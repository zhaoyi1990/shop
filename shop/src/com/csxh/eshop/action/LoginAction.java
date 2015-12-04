package com.csxh.eshop.action;

import java.io.Serializable;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Customer;
import com.csxh.eshop.util.MysqlUtil;
import com.csxh.eshop.util.ServletSessionUtil;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7628976285014087301L;
	Customer customer;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String handle() {
		if (customer == null) {
			return "input";
		}

		Customer customer1 = MysqlUtil.queryForObject(Customer.class, "email='" + this.customer.getEmail() + "'");
		
		if(customer1==null |!customer1.getPassword().equals(this.customer.getPassword())){
			ActionContext.getContext().put("fail", "您输入邮箱或者密码错误，请确认输入！");
			return "input";
		}
	
		boolean b = ServletSessionUtil.loginSuccess(ServletActionContext.getRequest(), customer1);
		if (b) {
			return "cart";
		} else {
			return "index";
		}
	}
}
