package com.csxh.eshop.model;

import com.opensymphony.xwork2.ActionSupport;

public class CartItem extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8799377149705500176L;
	
	private String productId;
	private String productName;
	private Double productPrice;
	private Integer productCount;
	private Float productWeigh;
	public CartItem() {
		super();
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getProductCount() {
		return productCount;
	}
	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}
	public Float getProductWeigh() {
		return productWeigh;
	}
	public void setProductWeigh(Float productWeigh) {
		this.productWeigh = productWeigh;
	}
}
