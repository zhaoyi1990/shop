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
			ActionContext.getContext().put("fail", "该邮箱已被注册请重新输入其他邮箱。");
			return "fail";
		}
		
		MysqlUtil.insertObject(this.customer, "class");
		ActionContext.getContext().put("ok", "注册成功"); 
		return Action.SUCCESS;
	}
}
