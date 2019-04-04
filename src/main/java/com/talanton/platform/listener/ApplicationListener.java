package com.talanton.platform.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.talanton.platform.common.CommonStorage;
import com.talanton.platform.monitoring.domain.EnvData;
import com.talanton.platform.monitoring.service.EnvDataService;

/**
 * Application Lifecycle Listener implementation class ApplicationListener
 *
 */
@WebListener
public class ApplicationListener implements ServletContextListener  {
	@Autowired
    private EnvDataService service;

    /**
     * Default constructor. 
     */
    public ApplicationListener() {
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  {

    	SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    	// MQTT Client를 추가
        final String MQTT_BROKER_IP = "tcp://192.168.0.141:1883";
        try {
	    	MqttClient client = new MqttClient(MQTT_BROKER_IP, MqttClient.generateClientId(), new MemoryPersistence());
	    	CommonStorage cs = CommonStorage.getInstance();
	    	cs.setMqttClient(client);
	    	client.connect();
	    	client.setCallback(new MqttCallback() {
	    		@Override
	    		public void connectionLost(Throwable acuse) { }
	
	    		@Override
	    		public void deliveryComplete(IMqttDeliveryToken token) { }
	
	    		@Override
	    		public void messageArrived(String topic, MqttMessage message) throws Exception {
//	    			System.out.println(message.toString());
	    			JsonParser parser = new JsonParser();
	    			JsonElement element = parser.parse(message.toString());
	    			JsonObject jsonObj = element.getAsJsonObject();
	    			EnvData environ = new EnvData();
	    			environ.setTemperature(jsonObj.get("temperature").getAsFloat());
	    			environ.setHumidity(jsonObj.get("humidity").getAsFloat());
	    			environ.setIlluminate(jsonObj.get("illuminate").getAsInt());
	    			environ.setSoil_humid(jsonObj.get("soil_humid").getAsInt());
//	    			System.out.println("T:" + environ.getTemperature() + ", H:" + environ.getHumidity() + ", I: " + environ.getIlluminate() + ", S: " + environ.getSoil_humid());
	    			service.insert(environ);
	    		}
	    	});
	    	// Subscribe 추가 
	    	client.subscribe("outTopic", 1);
        } catch(MqttException e) {
        	e.printStackTrace();
        }
    }
}