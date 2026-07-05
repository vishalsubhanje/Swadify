package com.swadify.dao;

import java.util.List;
import com.swadify.model.Restaurant;

public interface RestaurantDAO {

    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurant(int id);

    void addRestaurant(Restaurant r);

    void updateRestaurant(Restaurant r);

    void deleteRestaurant(int id);
}