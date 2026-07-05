package com.swadify.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.swadify.dao.RestaurantDAO;
import com.swadify.model.Restaurant;
import com.swadify.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM restaurant";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

            	Restaurant r = new Restaurant();

                r.setRestaurantId(
                        rs.getInt("restaurantId"));

                r.setName(
                        rs.getString("name"));

                r.setAddress(
                        rs.getString("address"));

                r.setRatings(
                        rs.getDouble("ratings"));

                r.setCuisineType(
                        rs.getString("cuisineType"));

                r.setDeliveryTime(
                        rs.getInt("deliveryTime"));

                r.setImagePath(
                        rs.getString("imagePath"));

                r.setActive(
                        rs.getBoolean("isActive"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Restaurant getRestaurant(int id) {

        Restaurant r = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM restaurant WHERE restaurantId = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurantId"));
                r.setName(rs.getString("name"));
                r.setAddress(rs.getString("address"));
                r.setRatings(rs.getDouble("ratings"));
                r.setCuisineType(rs.getString("cuisineType"));
                r.setDeliveryTime(rs.getInt("deliveryTime"));
                r.setImagePath(rs.getString("imagePath"));
                r.setActive(rs.getBoolean("isActive"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

	@Override
	public void addRestaurant(Restaurant r) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRestaurant(Restaurant r) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRestaurant(int id) {
		// TODO Auto-generated method stub
		
	}
}