package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.Arrays;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.csxh.eshop.model.Cart;
import com.csxh.eshop.model.CartItem;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;
import com.csxh.eshop.util.ServletSessionUtil;

public class CartAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7699354051728325983L;

	public static final String Add = "add";
	public static final String Delete = "delete";
	public static final String Update = "update";
	public static final String Find = "find";
	public static final String Clean = "clean";
	public static final String List = "list";

	private CartItem item;
	private String productId;
	private Integer productCount;
	private String op;

	public void setOp(String op) {
		this.op = op;
	}

	public CartItem getItem() {
		return item;
	}

	public void setItem(CartItem item) {
		this.item = item;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

	public String handle() {
		
		// 获得购物项目
		Session session = HibernateSessionUtil.openSession();
		Query query = session.createQuery("select name,listPrice,unitWeight from Product where id=?");
		query.setParameter(0, this.productId);
		Object[] objects = (Object[]) query.uniqueResult();
		HibernateSessionUtil.openSession();
		if (objects != null) {
			this.item = new CartItem();
			this.item.setProductId(this.productId);
			this.item.setProductName((String) objects[0]);
			this.item.setProductPrice((Double) objects[1]);
			this.item.setProductWeigh((Float) objects[2]);
			this.item.setProductCount(this.productCount);
		}
		
		op=ServletActionContext.getRequest().getParameter("op");
		String[] ss=ServletActionContext.getRequest().getParameterValues("count[]");
		// 获得购物车
		Cart cart = ServletSessionUtil.getCart(ServletActionContext.getRequest(), Cart.class);
		if(this.op==null){
			this.op = OrderdetailAction.List;
		}
		if (this.op.equals(CartAction.Add)) {
			cart.add(this.item);
		}else if (this.op.equals(CartAction.Update)) {
			for(int i=0;i<ss.length;i++){
				int count=Integer.parseInt(ss[i]);
				if(count<=0){
					cart.delete(i);
				}else{
					cart.update(i, count);
				}
			}
			System.out.println(Arrays.toString(ss));
			
		} else if (this.op.equals(CartAction.Clean)) {
			cart.clean();
		}

		if (ServletSessionUtil.isLoggined(ServletActionContext.getRequest())) {
			return "success";
		} else {
			return "login";
		}
		
	}
}
