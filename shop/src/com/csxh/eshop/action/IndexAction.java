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

public class IndexAction implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8046246948286564536L;

	public String handle() {

		List<Category> categoryList = MysqlUtil.queryForObjectList(Category.class);

		// 左侧导航大类别和小类别-categoryList
		if (categoryList != null && categoryList.size() > 0) {
			for (Category c : categoryList) {
				List<Subcategory> subCategoryList = MysqlUtil.queryForObjectList(Subcategory.class,
						"categoryId=" + c.getId());
				c.setChildren(subCategoryList);
			}
		}
		ActionContext.getContext().put("categoryList", categoryList);

		// 最新商品-newProductList
		List<Product> newProductList = new ArrayList<Product>();
		List<Object[]> objercList = MysqlUtil.queryForObjectList(
				"SELECT id,`name`,author,smallImg,description FROM product ORDER BY addDate DESC LIMIT 1");
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			newProductList.add(product);
		}

		if (newProductList.size() > 0) {
			ActionContext.getContext().put("newProductList", newProductList);
		}

		// 推荐商品-commendProductList
		List<Product> commendProductList = new ArrayList<Product>();
		objercList = MysqlUtil.queryForObjectList(
				"SELECT id,`name`,author,smallImg,description FROM product WHERE commend=1 LIMIT 1");
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			commendProductList.add(product);
		}
		if (commendProductList.size() > 0) {
			ActionContext.getContext().put("commendProductList", commendProductList);
		}

		// 折扣商品-discountProductList
		List<Product> discountProductList = new ArrayList<Product>();
		objercList = MysqlUtil.queryForObjectList(
				"SELECT id,`name`,author,smallImg,description,price,listPrice FROM product ORDER BY listPrice DESC LIMIT 1");
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			product.setPrice((Double) o[5]);
			product.setListPrice((Double) o[6]);
			discountProductList.add(product);
		}
		if (discountProductList.size() > 0) {
			ActionContext.getContext().put("discountProductList", discountProductList);
		}

		// 今日热点-hotProductList
		List<Product> hotProductList = new ArrayList<Product>();
		objercList = MysqlUtil.queryForObjectList("SELECT id,`name` FROM product ORDER BY visits DESC LIMIT 10");
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			hotProductList.add(product);
		}
		if (hotProductList.size() > 0) {
			ActionContext.getContext().put("hotProductList", hotProductList);
		}
		
		// 销售排行-sellProductList
		List<Product> sellProductList = new ArrayList<Product>();
		objercList = MysqlUtil.queryForObjectList("SELECT id,`name` FROM product ORDER BY visits DESC LIMIT 10");
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			sellProductList.add(product);
		}
		if (sellProductList.size() > 0) {
			ActionContext.getContext().put("sellProductList", sellProductList);
		}
		
		return Action.SUCCESS;
	}

}
