package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.List;

import com.csxh.eshop.model.Paymethod;
import com.csxh.eshop.model.Shipping;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class OrderAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6421991376275149808L;
	
	public String handle(){
		
		List<Paymethod> paymethodList = MysqlUtil.queryForObjectList(Paymethod.class);
		ActionContext.getContext().put("paymethodList", paymethodList);
		List<Shipping> shippingList = MysqlUtil.queryForObjectList(Shipping.class);
		ActionContext.getContext().put("shippingList", shippingList);
		
		return Action.SUCCESS;
	}

}
