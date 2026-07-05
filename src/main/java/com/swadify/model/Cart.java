package com.swadify.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    // ADD ITEM
    public void addItem(CartItem newItem) {

        for (CartItem item : items) {
            if (item.getMenuId() == newItem.getMenuId()) {
                item.setQuantity(item.getQuantity() + newItem.getQuantity());
                return;
            }
        }

        items.add(newItem);
    }

    // REMOVE ITEM
    public void removeItem(int menuId) {
        items.removeIf(item -> item.getMenuId() == menuId);
    }

    // UPDATE QUANTITY
    public void updateQuantity(int menuId, int qtyChange) {

        for(int i=0;i<items.size();i++){

            CartItem item = items.get(i);


            if(item.getMenuId()==menuId){


                item.setQuantity(
                    item.getQuantity()+qtyChange
                );


                if(item.getQuantity()<=0){

                    items.remove(i);

                }


                return;
            }
        }
    }

    // TOTAL PRICE
    public double getTotalPrice() {

        double total = 0;

        for (CartItem item : items) {
            total += item.getTotalPrice();
        }

        return total;
    }
    public void updateItem(int menuId, int qtyChange) {

        for (CartItem item : items) {
            if (item.getMenuId() == menuId) {

                item.setQuantity(item.getQuantity() + qtyChange);

                if (item.getQuantity() <= 0) {
                    items.remove(item);
                }
                return;
            }
        }
    }
}