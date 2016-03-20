package main.java;

public class Vehicle {
	
	private int vId;
	private int bId;
	private String make;
	private String model;
	private int passengerCapacity;
	private int costPerDay;
	private String type;
	private String transmission;
	
	public Vehicle(int vId, int bId, String make, String model, int capacity, int cost, String type, String transmission) {
		this.vId = vId;
		this.bId = bId;
		this.make = make;
		this.model = model;
		this.passengerCapacity = capacity;
		this.costPerDay = cost;
		this.type = type;
		this.transmission = transmission;
	}
	
	public int getVId() {
		return this.vId;
	}
	
	public int getBId() {
		return this.bId;
	}
	
	public String getMake() {
		return this.make;
	}
	
	public String getModel() {
		return this.model;
	}
	
	public int getPassengerCapacity() {
		return this.passengerCapacity;
	}
	
	public int costPerDay() {
		return this.costPerDay;
	}
	
	public String getType() {
		return this.getType();
	}
	
	public String getTransmission() {
		return this.transmission;
	}

}
