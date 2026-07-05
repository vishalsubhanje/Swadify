package com.swadify.dao;

import java.util.List;
import com.swadify.model.Menu;

public interface MenuDAO {

    List<Menu> getMenusByRestaurantId(int restaurantId);

}