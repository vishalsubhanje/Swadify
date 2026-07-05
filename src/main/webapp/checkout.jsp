<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.swadify.model.Cart" %>
<%@ page import="com.swadify.model.CartItem" %>
<%@ page import="java.util.List" %>

<%
Cart cart = (Cart) session.getAttribute("cart");
List<CartItem> items = null;

if(cart != null){
    items = cart.getItems();
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Checkout</title>

<style>

body{
    font-family: Arial;
    background: #f5f5f5;
    margin: 0;
}

h1{
    text-align: center;
    color: #ff6b35;
    margin-top: 30px;
}

.container{
    width: 60%;
    margin: auto;
    margin-top: 30px;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px lightgray;
}

.item{
    display: flex;
    justify-content: space-between;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.total{
    text-align: right;
    font-size: 22px;
    margin-top: 20px;
    font-weight: bold;
}

input, textarea{
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
}

button{
    width: 100%;
    padding: 12px;
    background: green;
    color: white;
    border: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 6px;
}

button:hover{
    background: darkgreen;
}

</style>

</head>
<body>

<nav class="navbar">

    <div class="logo">
        🍔 Swadify
    </div>

    <div class="nav-links">
        <a href="menu?restaurantId=1">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="myorders">My Orders</a>
        <a href="profile.jsp">Profile</a>
    </div>

</nav>

<h1>Checkout 🧾</h1>

<div class="container">

<%
if(items != null && !items.isEmpty()){
%>

<h3>Order Summary</h3>

<%
for(CartItem item : items){
%>

<div class="item">
    <span><%= item.getItemName() %> x <%= item.getQuantity() %></span>
    <span>₹ <%= item.getTotalPrice() %></span>
</div>

<%
}
%>

<div class="total">
    Grand Total: ₹ <%= cart.getTotalPrice() %>
</div>

<hr>

<h3>Delivery Details</h3>

<form action="placeOrder" method="post">

    <input type="text" name="name" placeholder="Enter Name" required>

    <input type="text" name="address" placeholder="Enter Address" required>

    <input type="text" name="phone" placeholder="Enter Phone Number" required>

    <button type="submit">Place Order 🚀</button>

</form>

<%
} else {
%>

<h2>Your cart is empty</h2>

<%
}
%>

</div>

</body>
</html>