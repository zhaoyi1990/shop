package com.csxh.eshop.model;
// Generated 2015-11-19 16:57:11 by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.List;

/**
 * Order generated by hbm2java
 */
public class Order implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7240164993981622028L;
	private Integer id;
	private Integer orderId;
	private Integer customerId;
	private Integer payMethodId;
	private String name;
	private String city;
	private String addres;
	private String zip;
	private String phone;
	private Integer shippingId;
	private Date orderDate;
	private Boolean finished;
	private Date finishedTime;
	private String adminName;
	private Integer adminId;
	private Double totalPrice;
	
	private List<Orderdetails> orderdetails;

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<Orderdetails> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(List<Orderdetails> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Order() {
	}

	public Order(Date orderDate, Date finishedTime) {
		this.orderDate = orderDate;
		this.finishedTime = finishedTime;
	}

	public Order(Integer orderId, Integer customerId, Integer payMethodId, String name, String city, String addres,
			String zip, String phone, Integer shippingId, Date orderDate, Boolean finished, Date finishedTime,
			String adminName, Integer adminId) {
		this.orderId = orderId;
		this.customerId = customerId;
		this.payMethodId = payMethodId;
		this.name = name;
		this.city = city;
		this.addres = addres;
		this.zip = zip;
		this.phone = phone;
		this.shippingId = shippingId;
		this.orderDate = orderDate;
		this.finished = finished;
		this.finishedTime = finishedTime;
		this.adminName = adminName;
		this.adminId = adminId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getPayMethodId() {
		return this.payMethodId;
	}

	public void setPayMethodId(Integer payMethodId) {
		this.payMethodId = payMethodId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddres() {
		return this.addres;
	}

	public void setAddres(String addres) {
		this.addres = addres;
	}

	public String getZip() {
		return this.zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getShippingId() {
		return this.shippingId;
	}

	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Boolean getFinished() {
		return this.finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	public Date getFinishedTime() {
		return this.finishedTime;
	}

	public void setFinishedTime(Date finishedTime) {
		this.finishedTime = finishedTime;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderId=" + orderId + ", customerId=" + customerId + ", payMethodId="
				+ payMethodId + ", name=" + name + ", city=" + city + ", addres=" + addres + ", zip=" + zip + ", phone="
				+ phone + ", shippingId=" + shippingId + ", orderDate=" + orderDate + ", finished=" + finished
				+ ", finishedTime=" + finishedTime + ", adminName=" + adminName + ", adminId=" + adminId
				+ ", totalPrice=" + totalPrice + ", orderdetails=" + orderdetails + "]";
	}

}
