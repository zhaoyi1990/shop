package com.csxh.eshop.action;

import java.io.Serializable;

import com.csxh.eshop.model.Customer;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class RegisterAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7239955804866817527L;

	Customer customer;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String handle() {

		Customer customerTset = MysqlUtil.queryForObject(Customer.class, "email='" + this.customer.getEmail() + "'");
		if(customerTset !=null){
			ActionContext.getContext().put("fail", "�������ѱ�ע�������������������䡣");
			return "fail";
		}
		
		MysqlUtil.insertObject(this.customer, "class");
		ActionContext.getContext().put("ok", "ע��ɹ�"); 
		return Action.SUCCESS;
	}
}
