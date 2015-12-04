package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.csxh.eshop.model.Pager;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class ProductListAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1034238642399285183L;

	private Integer currentPage = 1;

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public String newList() {
		List<Product> productList = new ArrayList<Product>();
		int totalRows = MysqlUtil.queryTotalRows("product", "id");
		int pageRows = 10;
		Pager pager = new Pager(totalRows, pageRows);
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);
		List<Object[]> objects = MysqlUtil.queryForObjectList(
				"SELECT id,`name`,author,smallImg,supplier FROM product ORDER BY addDate DESC LIMIT "
						+ pager.getFirstRow() + "," + pager.getPageRows());
		for (Object[] o : objects) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setSupplier((String) o[4]);
			productList.add(product);
		}
		ActionContext.getContext().put("productList", productList);
		return Action.SUCCESS;
	}

	public String commendList() {
		List<Product> productList = new ArrayList<Product>();
		int totalRows = MysqlUtil.queryTotalRows("product", "id", "commend=true");
		int pageRows = 10;
		Pager pager = new Pager(totalRows, pageRows);
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);
		List<Object[]> objects = MysqlUtil
				.queryForObjectList("SELECT id,`name`,author,smallImg,supplier FROM product WHERE commend=true LIMIT "
						+ pager.getFirstRow() + "," + pager.getPageRows());
		for (Object[] o : objects) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setSupplier((String) o[4]);
			productList.add(product);
		}
		ActionContext.getContext().put("productList", productList);
		return Action.SUCCESS;
	}
	
	public String sellList(){
		List<Product> productList = new ArrayList<Product>();
		int totalRows = MysqlUtil.queryTotalRows("product", "id");
		int pageRows = 10;
		Pager pager = new Pager(totalRows, pageRows);
		pager.setCurrentPage(this.currentPage);

		ActionContext.getContext().put("pager", pager);
		List<Object[]> objects = MysqlUtil
				.queryForObjectList("SELECT id,`name`,author,smallImg,supplier FROM product ORDER BY sell DESC LIMIT "
						+ pager.getFirstRow() + "," + pager.getPageRows());
		for (Object[] o : objects) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setSupplier((String) o[4]);
			productList.add(product);
		}
		ActionContext.getContext().put("productList", productList);
		return Action.SUCCESS;
	}
	
	public String priceList(){
		List<Product> productList = new ArrayList<Product>();
		int totalRows = MysqlUtil.queryTotalRows("product", "id","hotDeal=true");
		int pageRows = 10;
		Pager pager = new Pager(totalRows, pageRows);
		pager.setCurrentPage(this.currentPage);
		
		ActionContext.getContext().put("pager", pager);
		List<Object[]> objects = MysqlUtil
				.queryForObjectList("SELECT id,`name`,author,smallImg,supplier,price,listPrice FROM product WHERE hotDeal=true LIMIT "
						+ pager.getFirstRow() + "," + pager.getPageRows());
		for (Object[] o : objects) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setSupplier((String) o[4]);
			product.setPrice((Double) o[5]);
			product.setListPrice((Double) o[6]);
			productList.add(product);
		}
		ActionContext.getContext().put("productList", productList);
		return Action.SUCCESS;
	}
}
