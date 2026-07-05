package com.swadify.model;

public class OrderItem {

    private int orderItemId;
    private int orderId;
    private int menuId;
    private String itemName;
    private int quantity;
    private double price;
    private double subTotal;
    private String image;

    public OrderItem() {
    }

    public OrderItem(int orderId, int menuId,
                     String itemName,
                     int quantity,
                     double price) {
        this.orderId = orderId;
        this.menuId = menuId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return price * quantity;
    }

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	public String getImage() {
	    return image;
	}

	public void setImage(String image) {
	    this.image = image;
	}
}
