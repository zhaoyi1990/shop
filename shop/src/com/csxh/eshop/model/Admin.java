package com.csxh.eshop.model;
// Generated 2015-11-19 16:57:11 by Hibernate Tools 4.3.1.Final

/**
 * Admin generated by hbm2java
 */
public class Admin implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6747725886029587598L;
	private Integer id;
	private String username;
	private String password;
	private String level;

	public Admin() {
	}

	public Admin(String username, String password, String level) {
		this.username = username;
		this.password = password;
		this.level = level;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

}
