package com.swadify.model;

public class CartItem {

    private int menuId;
    private String itemName;
    private int quantity;
    private double price;

    public CartItem(int menuId, String itemName, int quantity, double price) {
        this.menuId = menuId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }

    public int getMenuId() {
        return menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return price * quantity;
    }
}