package com.talanton.platform.common;

import org.eclipse.paho.client.mqttv3.MqttClient;

public class CommonStorage {
	private static CommonStorage instance = new CommonStorage();
	private CommonStorage() { };
	public static CommonStorage getInstance() {
		return instance;
	}

	private MqttClient mqttClient;
	
	public MqttClient getMqttClient() {
		return mqttClient;
	}
	
	public void setMqttClient(MqttClient mqttClient) {
		this.mqttClient = mqttClient;
	}
	
}
