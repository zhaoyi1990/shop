package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Subcategory;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class CategoryAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4374640751522475726L;

	private Integer id;

	public void setId(Integer id) {
		this.id = id;
	}

	public String handle() {

		int limit = 3;
		Session session = HibernateSessionUtil.openSession();
		Category category = session.get(Category.class, this.id);

		Query query = session.createQuery("From Subcategory where categoryId=?");
		query.setParameter(0, this.id);
		List<Subcategory> subcategoryList = query.list();
		category.setChildren(subcategoryList);

		ActionContext.getContext().put("category", category);

		// 新品列表-newProductList
		List<Product> newProductList = new ArrayList<Product>();
		query = session.createQuery(
				"SELECT id,name,author,description,smallImg FROM Product WHERE categoryId=? ORDER BY addDate DESC");
		query.setParameter(0, this.id);
		query.setMaxResults(limit);
		List<Object[]> objectList = query.list();
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			newProductList.add(product);
		}
		ActionContext.getContext().put("newProductList", newProductList);

		// 打折列表-discountProductList
		List<Product> discountProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,description,smallImg,price,listPrice FROM Product WHERE categoryId=?");
		query.setParameter(0, this.id);
		query.setMaxResults(limit);
		objectList = query.list();
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			product.setPrice((Double) o[5]);
			product.setListPrice((Double) o[6]);
			discountProductList.add(product);
		}
		ActionContext.getContext().put("discountProductList", discountProductList);
		
		// 推荐列表-commendProductList
		List<Product> commendProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,description,smallImg FROM Product WHERE categoryId=? and hotDeal=1");
		query.setParameter(0, this.id);
		query.setMaxResults(limit);
		objectList = query.list();
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			commendProductList.add(product);
		}
		ActionContext.getContext().put("commendProductList", commendProductList);
		
		// 热卖列表-bestSellProductList
		List<Product> bestSellProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,description,smallImg FROM Product WHERE categoryId=? ORDER BY sell DESC");
		query.setParameter(0, this.id);
		query.setMaxResults(limit);
		objectList = query.list();
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			bestSellProductList.add(product);
		}
		ActionContext.getContext().put("bestSellProductList", bestSellProductList);

		HibernateSessionUtil.closeSession();
		return Action.SUCCESS;
	}
}
