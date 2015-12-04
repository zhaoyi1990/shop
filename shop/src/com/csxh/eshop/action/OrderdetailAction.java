package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Cart;
import com.csxh.eshop.model.CartItem;
import com.csxh.eshop.model.Nextorderid;
import com.csxh.eshop.model.Order;
import com.csxh.eshop.model.Orderdetails;
import com.csxh.eshop.util.MysqlUtil;
import com.csxh.eshop.util.ServletSessionUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class OrderdetailAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1167755485093956110L;

	public static final String Add = "add";
	public static final String Delete = "delete";
	public static final String Update = "update";
	public static final String Find = "find";
	public static final String Clean = "clean";
	public static final String List = "list";

	String op;
	Order order;
	Integer orderId;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String handle() {

		if (this.op == null) {
			this.op = OrderdetailAction.List;
		}
		if (this.op.equals(OrderdetailAction.Add)) {
			Cart cart = ServletSessionUtil.getCart(ServletActionContext.getRequest(), Cart.class);
			Nextorderid nextorderid = MysqlUtil.queryForObject(Nextorderid.class, "id=1");
			this.orderId = nextorderid.getNextId();
			// 插入订单
			this.order.setOrderId(nextorderid.getNextId());
			this.order.setTotalPrice(cart.getTotal());
			MysqlUtil.insertObject(order, "class");
			// 插入订单购物项
			for (CartItem item : cart.getItemList()) {
				Orderdetails orderdetails = new Orderdetails();
				orderdetails.setOrderId(nextorderid.getNextId());
				orderdetails.setProductId(item.getProductId());
				orderdetails.setProductName(item.getProductName());
				orderdetails.setUnitPrice(item.getProductPrice());
				orderdetails.setQuantity(item.getProductCount());
				orderdetails.setUnitWeight(item.getProductWeigh());
				MysqlUtil.insertObject(orderdetails, "class");
			}
			// 订单编号递增
			nextorderid.setNextId(nextorderid.getNextId() + 1);
			MysqlUtil.updateObject(nextorderid, "id");
			
			//订单已生成清空购物车
			cart.clean();
		}
		
		Order order1 = new Order();
		order1.setOrderId(this.orderId);
		Object[] objects = MysqlUtil.queryForObject("select totalPrice from `order` where orderId="+this.orderId);
		order1.setTotalPrice((Double) objects[0]);
		
		List<Orderdetails> orderdetails = MysqlUtil.queryForObjectList(Orderdetails.class,
				"orderId=" + order1.getOrderId());
		order1.setOrderdetails(orderdetails);
//		ActionContext.getContext().put("order", order1);
		ServletActionContext.getRequest().setAttribute("order", order1);
		
		return Action.SUCCESS;
	}
}
