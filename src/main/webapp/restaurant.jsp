<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.swadify.model.Restaurant" %>

<%
List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Swadify Restaurants</title>

<style>

body{
    font-family: Arial, sans-serif;
    background: #f5f5f5;
    margin: 0;
}

/* NAVBAR */
.navbar{
    background: #ff5a1f;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 40px;
    color: white;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo{
    font-size: 25px;
    font-weight: bold;
    color: white;
}

.nav-links a{
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-weight: 500;
    transition: 0.3s;
}

.nav-links a:hover{
    color: #ffe0d1;
}

/* TITLE */
h1{
    text-align: center;
    color: #ff5a1f;
    margin-top: 25px;
    font-size: 28px;
}

/* CONTAINER */
.container{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 40px;
    width: 100%;
    padding: 0 10px;
    box-sizing: border-box;
}

/* CARD */
.card{
    width: 320px;
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover{
    transform: translateY(-5px);
}

.card img{
    width: 100%;
    height: 180px;
    object-fit: cover;
}

.card-content{
    padding: 15px;
}

.card h2{
    margin: 0;
    color: #333;
}

.card p{
    margin: 6px 0;
    color: #666;
}

/* BUTTON */
.menu-btn{
    display: inline-block;
    margin-top: 10px;
    padding: 10px 15px;
    background: #ff5a1f;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    transition: 0.3s;
}

.menu-btn:hover{
    background: #e64a19;
}

/* FOOTER */
.footer{
    background: #222;
    color: #ccc;
    text-align: center;
    padding: 20px;
    margin-top: 50px;
}

.footer span{
    color: #ff5a1f;
    font-weight: bold;
}

</style>
</head>

<body>

<nav class="navbar">

    <div class="logo">
        🍔 Swadify
    </div>

    <div class="nav-links">
        <a href="restaurants">Home</a>
        <a href="menu?restaurantId=1">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="myorders">My Orders</a>
        <a href="profile.jsp">Profile</a>
    </div>

</nav>

<h1>Welcome to Swadify 🍕🍔🍗</h1>

<div class="container">

<%
if(restaurants != null){

    for(Restaurant r : restaurants){
%>

<div class="card">

    <img src="<%= r.getImagePath() %>" alt="<%= r.getName() %>">

    <div class="card-content">

        <h2><%= r.getName() %></h2>

        <p>⭐ <%= r.getRatings() %></p>

        <p>🍽️ <%= r.getCuisineType() %></p>

        <p>📍 <%= r.getAddress() %></p>

        <p>🕒 <%= r.getDeliveryTime() %> mins</p>

        <a class="menu-btn"
           href="menu?restaurantId=<%= r.getRestaurantId() %>">
            View Menu
        </a>

    </div>

</div>

<%
    }
}
%>

</div>
<footer class="footer">
    <p>© 2026 <span>Swadify</span> | Food Delivered Fast 🍕🚀</p>
</footer>
</body>
</html>