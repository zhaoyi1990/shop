package com.csxh.eshop.model;

import java.io.Serializable;

public class Ratings implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7213400843479992837L;
	private Long number;
	private Double aveRage;
	private Integer highRate;
	private Integer lowRate;
	private Integer gragWidth;

	public Integer getGragWidth() {
		return gragWidth;
	}

	public void setGragWidth(Integer gragWidth) {
		this.gragWidth = gragWidth;
	}

	public Ratings() {
		super();
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public Double getAveRage() {
		return aveRage;
	}

	public void setAveRage(Double aveRage) {
		this.aveRage = aveRage;
	}

	public Integer getHighRate() {
		return highRate;
	}

	public void setHighRate(Integer highRate) {
		this.highRate = highRate;
	}

	public Integer getLowRate() {
		return lowRate;
	}

	public void setLowRate(Integer lowRate) {
		this.lowRate = lowRate;
	}

	
}
