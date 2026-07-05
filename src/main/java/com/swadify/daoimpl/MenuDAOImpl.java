package com.swadify.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.swadify.dao.MenuDAO;
import com.swadify.model.Menu;
import com.swadify.util.DBConnection;


public class MenuDAOImpl implements MenuDAO {
	

    @Override
    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "select * from menu where restaurantId=?";

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1, restaurantId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(
                        rs.getInt("menuId"));

                menu.setRestaurantId(
                        rs.getInt("restaurantId"));

                menu.setItemName(
                        rs.getString("itemName"));

                menu.setDescription(
                        rs.getString("description"));

                menu.setPrice(
                        rs.getDouble("price"));

                menu.setAvailable(
                        rs.getBoolean("isAvailable"));

                menu.setImage(rs.getString("image"));

                menuList.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
    
    public static void main(String[] args) {

        MenuDAOImpl dao = new MenuDAOImpl();

        System.out.println(
                dao.getMenusByRestaurantId(1));
    }
}