package main.java;

import java.io.Serializable;

public class User {
	
	private int uId;
	private String name;
	private String address;
	private String email;
	private boolean isPremium;
	private int points;
	
	
	public User(int id, String name, String address, String email, boolean isPremium, int points) {
		this.uId = id;
		this.name = name;
		this.address = address;
		this.email = email;
		this.isPremium = isPremium;
		this.points = points;
	}
	
	public int getUID() {
		return this.uId;
	}
	
	public void setUID(int id) {
		this.uId = id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean isPremium() {
		return this.isPremium;
	}
	
	public void setPremium(boolean premium) {
		this.isPremium = premium;
	}
	
	public int getPoints() {
		return this.points;
	}
	
	public void setPoints(int points) {
		this.points = points;
	}


}
