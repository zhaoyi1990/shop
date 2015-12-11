package com.csxh.eshop.model;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class Cart extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 659472277886951117L;

	private List<CartItem> itemList = new ArrayList<CartItem>();

	public List<CartItem> getItemList() {
		return itemList;
	}

	public void add(CartItem item) {
		for (CartItem item2 : this.itemList) {
			if (item.getProductId().equals(item2.getProductId())) {
				item2.setProductCount(item2.getProductCount() + 1);
				return;
			}
		}
		this.itemList.add(item);
	}

	public void delete(int index) {
		this.itemList.remove(index);
	}

	public void update(CartItem item, int count) {
		for (CartItem item2 : this.itemList) {
			if (item.getProductId().equals(item2.getProductId())) {
				item2.setProductCount(count);
				return;
			}
		}
	}

	public void clean() {
		this.itemList.clear();
	}

	public double getTotal() {
		double total = 0.0;
		for (CartItem item : this.itemList) {
			total += item.getProductPrice() * item.getProductCount();
		}
		return total;
	}

	public float getWeight() {
		float weight = 0.0f;
		for (CartItem item : this.itemList) {
			weight += item.getProductWeigh() * item.getProductCount();
		}
		return weight;
	}

	public int getCount() {
		int count = 0;
		for (CartItem item : this.itemList) {
			count += item.getProductCount();
		}
		return count;
	}

	public void update(int i, int count) {
		this.itemList.get(i).setProductCount(count);
	}

}
