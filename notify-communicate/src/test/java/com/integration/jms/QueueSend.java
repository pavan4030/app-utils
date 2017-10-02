package com.integration.jms;

import java.io.File;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.NamingException;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.commons.io.FileUtils;

public class QueueSend {
	
	public final static String ACTIVE_MQ_URLJNDI_FACTORY = "tcp://127.0.0.1:61616";
	
	public final static String QUEUE = "ESB.EXECUTION.METRICS";

	private QueueConnectionFactory qconFactory;
	private QueueConnection qcon;
	private QueueSession qsession;
	

	public void init() throws NamingException,JMSException {
		System.out.println("init start");
		qconFactory = new ActiveMQConnectionFactory(ACTIVE_MQ_URLJNDI_FACTORY);
		System.out.println("qconFactory done");
		qcon = qconFactory.createQueueConnection();
		System.out.println("queue connection created");
		
		qsession = qcon.createQueueSession(false, Session.CLIENT_ACKNOWLEDGE);
		

		System.out.println("init completed");
	}

	public void send(String message,String queueName) throws JMSException {
		System.out.println("Sending message");
		
		
		
		Destination destination = qsession.createQueue(QUEUE);
		MessageProducer producer = qsession.createProducer(destination);
		
		TextMessage textMessage = qsession.createTextMessage(message);
		
		producer.send(textMessage);
		
		System.out.println("Sent");
		
	}

	public void close() throws JMSException {

		qsession.close();
		qcon.close();
	}

	public static void main(String[] args) throws Exception {

		
	//	InitialContext ic = getInitialContext(ACTIVE_MQ_URL);
		
		File file = new File("/tmp/esb/notifications/request.json");
		String message = FileUtils.readFileToString(file);
		
		QueueSend qs = new QueueSend();
		qs.init();
		qs.send(message,QUEUE);
		
		qs.close();
	}


}