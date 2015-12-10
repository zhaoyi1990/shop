package com.csxh.eshop.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.model.Subcategory;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class IndexAction implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8046246948286564536L;

	@SuppressWarnings("unchecked")
	public String handle() {
		Session session = HibernateSessionUtil.openSession();
		Query query = session.createQuery("From Category");
		List<Category> categoryList = query.list();

		// ��ർ��������С���-categoryList
		if (categoryList != null && categoryList.size() > 0) {
			for (Category c : categoryList) {
				query = session.createQuery("from Subcategory where categoryId=?");
				query.setParameter(0, c.getId());
				List<Subcategory> subCategoryList = query.list();
				c.setChildren(subCategoryList);
			}
		}
		ActionContext.getContext().put("categoryList", categoryList);

		// ������Ʒ-newProductList
		List<Product> newProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,smallImg,description FROM Product ORDER BY addDate DESC");
		query.setMaxResults(1);
		List<Object[]> objercList = query.list();
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			newProductList.add(product);
		}
		ActionContext.getContext().put("newProductList", newProductList);
		
		// �Ƽ���Ʒ-commendProductList
		List<Product> commendProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,smallImg,description FROM Product WHERE commend=1");
		query.setMaxResults(1);
		objercList = query.list();
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			commendProductList.add(product);
		}
		ActionContext.getContext().put("commendProductList", commendProductList);

		// �ۿ���Ʒ-discountProductList
		List<Product> discountProductList = new ArrayList<Product>();
		query = session.createQuery("SELECT id,name,author,smallImg,description,price,listPrice FROM Product ORDER BY listPrice DESC");
		query.setMaxResults(1);
		objercList = query.list();
		for (Object[] o : objercList) {
			Product product = new Product();
			product.setId((String) o[0]);
			product.setName((String) o[1]);
			product.setAuthor((String) o[2]);
			product.setSmallImg((String) o[3]);
			product.setDescription((String) o[4]);
			product.setPrice((Double) o[5]);
			product.setListPrice((Double) o[6]);
			discountProductList.add(product);
		}
		if (discountProductList.size() > 0) {
			ActionContext.getContext().put("discountProductList", discountProductList);
		}

		// �����ȵ�-hotProductList
		query = session.createQuery("SELECT new Product(id,name) FROM Product ORDER BY visits DESC");
		query.setMaxResults(10);
		List<Product> hotProductList = query.list();
		ActionContext.getContext().put("hotProductList", hotProductList);
		
		
		// ��������-sellProductList
		query = session.createQuery("SELECT new Product(id,name) FROM Product ORDER BY sell DESC");
		query.setMaxResults(10);
		List<Product> sellProductList = query.list();
		ActionContext.getContext().put("sellProductList", sellProductList);
		HibernateSessionUtil.closeSession();
		return Action.SUCCESS;
	}

}
