<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Payment</title>

<style>

body{
    font-family: Arial;
    background: #f5f5f5;
}

.container{
    width: 40%;
    margin: auto;
    margin-top: 80px;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px lightgray;
}

h1{
    text-align: center;
    color: #ff6b35;
}

button{
    background: green;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    cursor: pointer;
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

<div class="container">

<h1>💳 Payment</h1>

<form action="checkout" method="get">

    <p>
        <input type="radio"
               name="paymentMode"
               value="Cash On Delivery"
               checked>
        Cash On Delivery
    </p>

    <p>
        <input type="radio"
               name="paymentMode"
               value="UPI">
        UPI
    </p>

    <p>
        <input type="radio"
               name="paymentMode"
               value="Card">
        Credit/Debit Card
    </p>

    <br>

    <button type="submit">
        Place Order
    </button>

</form>

</div>

</body>
</html>