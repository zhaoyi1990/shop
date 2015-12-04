package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Subcategory;
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
	
	public String handle(){
		
		String limit = " LIMIT 3";
		
		Category category = MysqlUtil.queryForObject(Category.class, "id="+this.id);
		List<Subcategory> subcategoryList = MysqlUtil.queryForObjectList(Subcategory.class, "categoryId="+this.id);
		category.setChildren(subcategoryList);
		
		ActionContext.getContext().put("category", category);
		
		// 新品列表-newProductList
		List<Product> newProductList = new ArrayList<Product>();
		String sql = "SELECT id,`name`,author,description,smallImg FROM product WHERE categoryId= "+this.id+" ORDER BY addDate DESC "+limit;
		List<Object[]> objectList = MysqlUtil.queryForObjectList(sql);
		for(Object[] o : objectList){
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			newProductList.add(product);
		}
		if(newProductList.size()>0){
			ActionContext.getContext().put("newProductList", newProductList);
		}
		
		// 打折列表-discountProductList
		List<Product> discountProductList = new ArrayList<Product>();
		sql = "SELECT id,`name`,author,description,smallImg,price,listPrice FROM product WHERE categoryId= "+this.id+limit;
		objectList = MysqlUtil.queryForObjectList(sql);
		for(Object[] o : objectList){
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			product.setPrice((Double) o[5]);
			product.setListPrice( (Double) o[6]);
			discountProductList.add(product);
		}
		if(discountProductList.size()>0){
			ActionContext.getContext().put("discountProductList", discountProductList);
		}
		
		//推荐列表-commendProductList
		List<Product> commendProductList = new ArrayList<Product>();
		sql = "SELECT id,`name`,author,description,smallImg FROM product WHERE hotDeal=1 and categoryId= "+this.id+limit;
		objectList = MysqlUtil.queryForObjectList(sql);
		for(Object[] o : objectList){
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			commendProductList.add(product);
		}
		if(commendProductList.size()>0){
			ActionContext.getContext().put("commendProductList", commendProductList);
		}
		
		
		//热卖列表-bestSellProductList
		List<Product> bestSellProductList = new ArrayList<Product>();
		sql = "SELECT id,`name`,author,description,smallImg FROM product WHERE categoryId= "+this.id+" ORDER BY sell DESC "+limit;
		objectList = MysqlUtil.queryForObjectList(sql);
		for(Object[] o : objectList){
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setDescription((String) o[3]);
			product.setSmallImg((String) o[4]);
			bestSellProductList.add(product);
		}
		if(bestSellProductList.size()>0){
			ActionContext.getContext().put("bestSellProductList", bestSellProductList);
		}
		
		
		
		return Action.SUCCESS;
	}
}
