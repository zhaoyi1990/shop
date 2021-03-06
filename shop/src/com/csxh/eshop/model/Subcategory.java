package com.csxh.eshop.model;
// Generated 2015-11-19 16:57:11 by Hibernate Tools 4.3.1.Final

/**
 * Subcategory generated by hbm2java
 */
public class Subcategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2805618763134759192L;
	private Integer id;
	private String name;
	private String description;
	private String img;
	private Integer categoryId;
	private String style;

	private Category category;
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Subcategory() {
	}

	public Subcategory(String name, String description, String img, Integer categoryId, String style) {
		this.name = name;
		this.description = description;
		this.img = img;
		this.categoryId = categoryId;
		this.style = style;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}
