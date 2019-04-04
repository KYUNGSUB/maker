package com.talanton.platform.monitoring.domain;

public class Environment {
	private float temperature;
	private float humidity;
	private int illuminate;
	private int soil_humid;

	public float getTemperature() {
		return temperature;
	}
	public void setTemperature(float temperature) {
		this.temperature = temperature;
	}
	public float getHumidity() {
		return humidity;
	}
	public void setHumidity(float humidity) {
		this.humidity = humidity;
	}
	
	public int getIlluminate() {
		return illuminate;
	}
	public void setIlluminate(int illuminate) {
		this.illuminate = illuminate;
	}
	public int getSoil_humid() {
		return soil_humid;
	}
	public void setSoil_humid(int soil_humid) {
		this.soil_humid = soil_humid;
	}
}
