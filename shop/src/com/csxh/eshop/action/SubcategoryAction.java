package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Pager;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Subcategory;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class SubcategoryAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6211907699185435546L;

	private Integer id;

	private Integer currentPage = 1;

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = (currentPage == null ? 1 : currentPage);
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@SuppressWarnings("unchecked")
	public String handle() {

		Session session = HibernateSessionUtil.openSession();
		Subcategory subCategory = session.get(Subcategory.class, this.id);
		Category category = session.get(Category.class, subCategory.getCategoryId());
		subCategory.setCategory(category);
		ActionContext.getContext().put("subCategory", subCategory);

		// 分页
		Query query = session.createQuery("select Count(*) from Product Where subCategoryId=?");
		query.setParameter(0, this.id);
		long totalRows = (long) query.uniqueResult();
		String pageRows = ServletActionContext.getServletContext().getInitParameter("pageRows");
		Pager pager = new Pager(totalRows, pageRows != null ? Integer.parseInt(pageRows) : 5);
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);

		// 主列表
		query = session.createQuery(
				"select id,name,smallImg,description,price,listPrice,hotDeal from Product WHERE subCategoryId=?");
		query.setParameter(0, this.id);
		query.setFirstResult(pager.getFirstRow());
		query.setMaxResults(pager.getPageRows());
		List<Object[]> objectList = query.list();
		List<Product> productList = new ArrayList<Product>(pager.getPageRows());
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setSmallImg((String) o[2]);
			product.setDescription((String) o[3]);
			product.setPrice((Double) o[4]);
			product.setListPrice((Double) o[5]);
			product.setHotDeal((Boolean) o[6]);
			productList.add(product);
		}
		ActionContext.getContext().put("productList", productList);

		// 推荐列表-commendProductList
		query = session.createQuery("select new Product(id,name) from Product where commend=1 and subCategoryId=?");
		query.setParameter(0, this.id);
		query.setMaxResults(10);
		List<Product> commendProductList = query.list();
		ActionContext.getContext().put("commendProductList", commendProductList);

		// 推荐列表-commendProductList
		query = session.createQuery("select new Product(id,name) from Product where subCategoryId=? ORDER BY sell DESC");
		query.setParameter(0, this.id);
		query.setMaxResults(10);
		List<Product> bestSellProductList = query.list();
		ActionContext.getContext().put("bestSellProductList", bestSellProductList);

		HibernateSessionUtil.closeSession();
		return Action.SUCCESS;
	}
}
