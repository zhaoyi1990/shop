package com.csxh.admin.action;

import java.io.Serializable;

import org.apache.struts2.ServletActionContext;

import com.csxh.eshop.model.Admin;
import com.csxh.eshop.util.MysqlUtil;
import com.opensymphony.xwork2.Action;

public class AdminAction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -822155400924596232L;
	
	private Admin admin;
	
	public Admin getAdmin() {
		return admin;
	}
	
	
	public void setAdmin(Admin admin) {
		
		this.admin = admin;
	}


	public String login(){
		Admin admin2 = MysqlUtil.queryForObject(Admin.class, "username='"+this.admin.getUsername()+"'");
		System.out.println(this.admin.toString());
		if(admin2!=null&&admin2.getPassword().equals(this.admin.getPassword())){
			ServletActionContext.getRequest().getSession().setAttribute("admin", admin2);
			return Action.SUCCESS;
		}
		return "fail";
	}

}
