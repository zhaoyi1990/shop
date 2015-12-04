package com.csxh.eshop.test;

import org.junit.Assert;
import org.junit.Test;

import com.csxh.eshop.util.MysqlUtil;

public class MysqlUtilTest {

	@Test
	public void test() {
		int totalRows = MysqlUtil.queryTotalRows("product", "id","hotDeal=true");
		System.out.println(totalRows);
		boolean b = totalRows>0;
		Assert.assertTrue(b);
	}

}
