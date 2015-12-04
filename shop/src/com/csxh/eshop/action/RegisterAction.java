package com.csxh.eshop.action;

import java.io.Serializable;


import com.csxh.eshop.model.Customer;
import com.opensymphony.xwork2.Action;

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
		
		return Action.SUCCESS;
	}
}
