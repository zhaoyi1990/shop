package com.csxh.eshop.test;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.csxh.eshop.model.Product;
import com.csxh.eshop.util.HibernateSessionUtil;


public class MysqlUtilTest {

	@Test
	public void test() {
		Session session = HibernateSessionUtil.openSession();
		Query query;
		query = session.createQuery("from Review where productId=?");
		query.setParameter(0, "ISBN 7-89999-685-6/TP*277");
		System.out.println(query.list().size());
		HibernateSessionUtil.closeSession();
		Assert.assertTrue(true);
	}

}
