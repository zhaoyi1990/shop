package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Pager;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Rating;
import com.csxh.eshop.model.Ratings;
import com.csxh.eshop.model.Review;
import com.csxh.eshop.model.Subcategory;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class ProductAction implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5324815031753651177L;
	private String id;
	private int currentPage = 1;
	private Rating rating;

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@SuppressWarnings("unchecked")
	public String handle() {

		// 商品信息
		Session session = HibernateSessionUtil.openSession();
		Product product = session.get(Product.class, this.id);
		Category category = session.get(Category.class, product.getCategoryId());
		Subcategory subCategory = session.get(Subcategory.class, product.getSubCategoryId());
		product.setCategory(category);
		product.setSubCategory(subCategory);
		ActionContext.getContext().put("product", product);

		// 评论分页
		Query query = session.createQuery("select Count(*) from Review Where productId=?");
		query.setParameter(0, this.id);
		long totalRows = (long) query.uniqueResult();
		String pageRows = ServletActionContext.getServletContext().getInitParameter("pageRows");
		Pager pager = new Pager(totalRows, pageRows == null ? 3 : Integer.parseInt(pageRows));
		pager.setCurrentPage(this.currentPage);
		ActionContext.getContext().put("pager", pager);

		// 评论
		query = session.createQuery("from Review where productId=?");
		query.setParameter(0, this.id);
		query.setFirstResult(pager.getFirstRow());
		query.setMaxResults(pager.getPageRows());
		List<Review> reviewList = query.list();
		ActionContext.getContext().put("reviewList", reviewList);
		
		// 评分
		query= session.createQuery("select Count(rateLevel),Max(rateLevel),Min(rateLevel), Avg(rateLevel) FROM Rating Where productId=?");
		query.setParameter(0, this.id);
		Object[] o= (Object[]) query.uniqueResult();
		Ratings ratings=new Ratings();
		ratings.setNumber((Long) o[0]);
		if (ratings.getNumber()!=0) {
			ratings.setHighRate((Integer) o[1]);
			ratings.setLowRate((Integer) o[2]);
			ratings.setAveRage(Double.parseDouble(String.format("%.2f", o[3])));
			ratings.setGragWidth((int) (ratings.getAveRage() * 14));
		}
		ActionContext.getContext().put("ratings", ratings);
		
		HibernateSessionUtil.closeSession();
		return Action.SUCCESS;
	}
	
	public String rating(){
		this.rating.setProductId(this.id);
		Session session = HibernateSessionUtil.openSession();
		Transaction t = session.beginTransaction();
		session.save(this.rating);
		t.commit();
		HibernateSessionUtil.closeSession();
		return handle();
	}
}
