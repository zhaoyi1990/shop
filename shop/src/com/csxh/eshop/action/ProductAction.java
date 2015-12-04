package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Pager;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Ratings;
import com.csxh.eshop.model.Review;
import com.csxh.eshop.model.Subcategory;
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

	public void setId(String id) {
		this.id = id;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String handle() {

		// 商品信息
		Product product = MysqlUtil.queryForObject(Product.class, "id='" + this.id + "'");
		Category category = MysqlUtil.queryForObject(Category.class, "id=" + product.getCategoryId());
		product.setCategory(category);
		Subcategory subCategory = MysqlUtil.queryForObject(Subcategory.class, "id=" + product.getSubCategoryId());
		product.setSubCategory(subCategory);

		ActionContext.getContext().put("product", product);

		// 评论分页
		int totalRows = MysqlUtil.queryTotalRows("review", "id", "productId='" + this.id + "'");
		String pageRows = ServletActionContext.getServletContext().getInitParameter("pageRows");
		Pager pager = new Pager(totalRows, pageRows == null ? 3 : Integer.parseInt(pageRows));
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);

		// 评论
		String sql = "SELECT id,`name`,email,content,time FROM review WHERE productId = '" + this.id + "' LIMIT "
				+ pager.getFirstRow() + "," + pager.getPageRows();
		List<Object[]> objectList = MysqlUtil.queryForObjectList(sql);
		List<Review> reviewList = new ArrayList<Review>(pager.getPageRows());
		for (Object[] o : objectList) {
			Review review = new Review();
			review.setId((Integer) o[0]);
			review.setName((String) o[1]);
			review.setEmail((String) o[2]);
			review.setContent((String) o[3]);
			review.setTime((Date) o[4]);
			reviewList.add(review);
		}
		ActionContext.getContext().put("reviewList", reviewList);

		// 评分
		Object[] o=MysqlUtil.queryForObject("SELECT Count(rating.rateLevel),Max(rating.rateLevel),Min(rating.rateLevel), Avg(rating.rateLevel) FROM rating WHERE productId ='"+this.id+"'");
		Ratings ratings=new Ratings();
		ratings.setNumber( (Long) o[0]);
		if (ratings.getNumber()!=0) {
			ratings.setHighRate((Integer) o[1]);
			ratings.setLowRate((Integer) o[2]);
			ratings.setAveRage(Double.parseDouble(String.format("%.2f", o[3])));
			ratings.setGragWidth((int) (ratings.getAveRage() * 14));
		}
		ActionContext.getContext().put("ratings", ratings);

		return Action.SUCCESS;
	}
}
