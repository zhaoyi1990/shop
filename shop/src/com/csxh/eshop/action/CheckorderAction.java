package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Customer;
import com.csxh.eshop.model.Order;
import com.csxh.eshop.util.MysqlUtil;
import com.csxh.eshop.util.ServletSessionUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class CheckorderAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1347112094436091165L;

	public String handle() {
		Customer customer = ServletSessionUtil.getUser(ServletActionContext.getRequest());

		if (customer == null) {
			return "login";
		}

		List<Order> orderList = MysqlUtil.queryForObjectList(Order.class, "`name`='" + customer.getRealname() + "'");
		ActionContext.getContext().put("orderList", orderList);
		return Action.SUCCESS;
	}
}
