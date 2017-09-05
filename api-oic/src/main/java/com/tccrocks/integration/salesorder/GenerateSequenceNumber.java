package com.tccrocks.integration.salesorder;

public class GenerateSequenceNumber {

	private int counter = 0;

	private static GenerateSequenceNumber counterIncrementer = null;

	private GenerateSequenceNumber() {
		counter = 0;
	}

	public int getCounter(String skuType) {

		if (skuType.equalsIgnoreCase("original")) {
			counterIncrementer = null;
			counter = 0;
		} else {
			counter++;
		}
		return counter;
	}

	public static GenerateSequenceNumber getInstance() {
		if (counterIncrementer == null) {
			counterIncrementer = new GenerateSequenceNumber();
		}
		return counterIncrementer;
	}

}
