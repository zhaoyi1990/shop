package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Pager;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Subcategory;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class SubcategoryAction implements Serializable  {

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

	public String handle() {

		Subcategory subCategory = MysqlUtil.queryForObject(Subcategory.class, "id = " + this.id);
		Category category = MysqlUtil.queryForObject(Category.class, "id =" + subCategory.getCategoryId());
		subCategory.setCategory(category);
		ActionContext.getContext().put("subCategory", subCategory);

		// 分页
		int totalRows = MysqlUtil.queryTotalRows("product", "id", "subCategoryId =" + this.id);
		String pageRows = ServletActionContext.getServletContext().getInitParameter("pageRows");
		Pager pager = new Pager(totalRows, pageRows != null ? Integer.parseInt(pageRows) : 5);
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);

		// 主列表
		String sql = "SELECT id,`name`,smallImg,description, price,listPrice,hotDeal FROM product WHERE subCategoryId = "
				+ this.id + " LIMIT " + pager.getFirstRow() + "," + pager.getPageRows();

		List<Product> productList = new ArrayList<Product>(pager.getPageRows());
		List<Object[]> objectList = MysqlUtil.queryForObjectList(sql);
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
		List<Product> commendProductList = new ArrayList<Product>();
		objectList = MysqlUtil.queryForObjectList(
				"SELECT id,`name` FROM product WHERE commend = 1 and subCategoryId = " + this.id + " LIMIT 10");
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			commendProductList.add(product);
		}
		ActionContext.getContext().put("commendProductList", commendProductList);
		
		// 推荐列表-commendProductList
		List<Product> bestSellProductList = new ArrayList<Product>();
		objectList = MysqlUtil.queryForObjectList(
				"SELECT id,`name` FROM product WHERE subCategoryId = " + this.id + " ORDER BY sell DESC LIMIT 10");
		for (Object[] o : objectList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			bestSellProductList.add(product);
		}
		ActionContext.getContext().put("bestSellProductList", bestSellProductList);
		
		return Action.SUCCESS;

	}
}
