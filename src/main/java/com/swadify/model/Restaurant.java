package com.swadify.model;

public class Restaurant {
	
	private int restaurantId;
    private String name;
    private String address;
    private double ratings;
    private String cuisineType;
    private int deliveryTime;
    private String imagePath;
    private boolean isActive;
    public Restaurant() {

    }
	public Restaurant(int restaurantId, String name, String address, double ratings, String cuisineType,
			int deliveryTime, String imagePath, boolean isActive) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.ratings = ratings;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.imagePath = imagePath;
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", ratings="
				+ ratings + ", cuisineType=" + cuisineType + ", deliveryTime=" + deliveryTime + ", imagePath="
				+ imagePath + ", isActive=" + isActive + "]";
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getRatings() {
		return ratings;
	}
	public void setRatings(double ratings) {
		this.ratings = ratings;
	}
	public String getCuisineType() {
		return cuisineType;
	}
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	public int getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
