<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.swadify.model.Menu" %>

<%
List<Menu> menus = (List<Menu>) request.getAttribute("menus");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swadify - Menu</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="logo">
        <i class="fa-solid fa-burger"></i>
        Swadify
    </div>

    <div class="nav-links">

        <a href="restaurants">
            <i class="fa-solid fa-house"></i>
            Home
        </a>

<a href="restaurants">
            <i class="fa-solid fa-utensils"></i>
            Menu
        </a>

        <a href="cart.jsp">
            <i class="fa-solid fa-cart-shopping"></i>
            Cart
        </a>

        <a href="myorders">
            <i class="fa-solid fa-bag-shopping"></i>
            Orders
        </a>

    </div>

</nav>

<!-- ================= HERO ================= -->

<div class="hero">

    <div class="hero-left">

        <span class="tag">
            🔥 India's Favourite Food
        </span>

        <h1>
            Delicious Food
            <br>
            Delivered Fast
        </h1>

        <p>
            Fresh • Hot • Tasty • Fast Delivery
        </p>

        <button class="btn">
            Order Now
        </button>

    </div>

    <div class="hero-right">

        <img src="images/banner.png" alt="Banner">

    </div>

</div>

<!-- ================= MENU ================= -->

<div class="container">

<h2 class="section-title">
🍔 Our Menu
</h2>

<div class="menu-grid">

<%
if(menus!=null && !menus.isEmpty()){

for(Menu m:menus){
%>

<div class="food-card">

<img
src="images/<%=m.getImage()%>"
class="food-image"
alt="<%=m.getItemName()%>">

<div class="food-content">

<h2><%=m.getItemName()%></h2>

<p><%=m.getDescription()%></p>

<div class="rating">

⭐⭐⭐⭐⭐

4.8 • 25 mins

</div>

<div class="price">

₹<%=m.getPrice()%>

</div>

<form action="cart" method="get">

<input
type="hidden"
name="menuId"
value="<%=m.getMenuId()%>">

<input
type="hidden"
name="restaurantId"
value="<%=m.getRestaurantId()%>">

<input
type="hidden"
name="itemName"
value="<%=m.getItemName()%>">

<input
type="hidden"
name="price"
value="<%=m.getPrice()%>">

<input
type="hidden"
name="quantity"
value="1">


<button
class="btn"
type="submit">

Add To Cart

</button>

</form>
<input
type="hidden"
name="menuId"
value="<%=m.getMenuId()%>">

<input
type="hidden"
name="restaurantId"
value="<%=m.getRestaurantId()%>">

<input
type="hidden"
name="itemName"
value="<%=m.getItemName()%>">

<input
type="hidden"
name="price"
value="<%=m.getPrice()%>">

<input
type="hidden"
name="quantity"
value="1">




</form>

</div>

</div>

<%
}

}
else{
%>

<div
style="width:100%;
text-align:center;
padding:80px;">

<h2>

No Menu Available

</h2>

<p>

Please check again later.

</p>

</div>

<%
}
%>

</div>

</div>

<!-- ================= FOOTER ================= -->

<footer
style="margin-top:60px;
padding:30px;
background:#222;
color:white;
text-align:center;">

<h3>

🍔 Swadify

</h3>

<p>

Fresh Food • Fast Delivery • Happy Customers

</p>

<p
style="margin-top:10px;">

© 2026 Swadify. All Rights Reserved.

</p>

</footer>

</body>

</html>
