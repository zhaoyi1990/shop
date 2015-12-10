package com.csxh.eshop.test;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Assert;
import org.junit.Test;

import com.csxh.eshop.action.CartAction;
import com.csxh.eshop.model.Category;
import com.csxh.eshop.model.Product;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;

public class MysqlUtilTest {

	@Test
	public void test() {
		Session session = HibernateSessionUtil.openSession();
		
		Query query = session.createQuery(
				"select id,name,smallImg,description,price,listPrice,hotDeal from Product WHERE subCategoryId=?");
		query.setParameter(0, 1);
		System.out.println(query.list().size());
		Assert.assertTrue(query.list().size()>0);
		HibernateSessionUtil.closeSession();
	}

}
