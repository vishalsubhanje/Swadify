package com.swadify.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.swadify.dao.UserDAO;
import com.swadify.model.User;
import com.swadify.util.DBConnection;

public class UserDAOImpl implements UserDAO {

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	@Override
	public int addUser(User user) {

	    int status = 0;

	    try {

	        Connection con =
	                DBConnection.getConnection();

	        String sql =
	                "INSERT INTO users(name,email,password,phone,address) VALUES(?,?,?,?,?)";

	        PreparedStatement ps =
	                con.prepareStatement(sql);

	        ps.setString(1, user.getName());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getPassword());
	        ps.setString(4, user.getPhone());
	        ps.setString(5, user.getAddress());

	        status = ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	@Override
	public User getUser(String email) {

	    User user = null;

	    try {

	        Connection con =
	                DBConnection.getConnection();

	        String sql =
	                "SELECT * FROM users WHERE email=?";

	        PreparedStatement ps =
	                con.prepareStatement(sql);

	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            user = new User();

	            user.setUserId(rs.getInt("userId"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setPhone(rs.getString("phone"));
	            user.setAddress(rs.getString("address"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}

}