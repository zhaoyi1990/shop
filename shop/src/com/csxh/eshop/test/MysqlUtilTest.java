package com.csxh.eshop.test;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Assert;
import org.junit.Test;

import com.csxh.eshop.model.Product;
import com.csxh.eshop.util.HibernateSessionUtil;
import com.csxh.eshop.util.MysqlUtil;

public class MysqlUtilTest {

	@Test
	public void test() {
		Session session = HibernateSessionUtil.openSession();
		
		Query query;
		query = session.createQuery("SELECT p.id,p.name,p.author,p.smallImg,p.description FROM Product p WHERE commend=1");
		query.setMaxResults(1);
		List list = query.list();
		
		System.out.println(list);
		Assert.assertTrue(list.size()>0);
		HibernateSessionUtil.closeSession();
	}

}
