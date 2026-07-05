<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.swadify.model.Order" %>

<%
Integer orderId = (Integer) request.getAttribute("orderId");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Order Details</title>

<style>
body{
    margin:0;
    background:#f5f5f5;
    font-family:Arial,Helvetica,sans-serif;
}

.header{
    background:#ff5a1f;
    color:white;
    padding:20px 40px;
}

.container{
    width:80%;
    margin:auto;
    margin-top:30px;
}

.order-card{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.1);
    margin-bottom:25px;
}

.item-card{
    background:white;
    margin-bottom:15px;
    padding:18px;
    border-radius:12px;
    box-shadow:0 2px 10px rgba(0,0,0,.08);
}

.item-card h3{
    color:#ff5a1f;
    margin-bottom:10px;
}

.status{
    background:#27ae60;
    color:white;
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
}
.btn{
    background:#ff5a1f;
    color:white;
    text-decoration:none;
    padding:12px 22px;
    border-radius:8px;
    display:inline-block;
    margin-top:20px;
}

.btn:hover{
    background:#e64a19;
}
.placed{
background:#3498db;
color:white;
padding:6px 15px;
border-radius:20px;
}

.delivered{
background:#2ecc71;
color:white;
padding:6px 15px;
border-radius:20px;
}

.cancelled{
background:#e74c3c;
color:white;
padding:6px 15px;
border-radius:20px;
}
</style>
</head>
<body>


a<%@ page import="java.util.List"%>
<%@ page import="com.swadify.model.Order"%>
<%@ page import="com.swadify.model.OrderItem"%>

<%
Order order =
        (Order) request.getAttribute("order");

List<OrderItem> items =
        (List<OrderItem>) request.getAttribute("items");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
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

<div class="header">
    <h1>📦 Order Details</h1>
</div>

<%
if (order != null) {
%>

<div class="order-card">

<h2>Order #<%=order.getOrderId()%></h2>

<p>
<b>Restaurant :</b>
<%=order.getRestaurantName()%>
</p>

<p>
<b>Order Date :</b>
<%=new java.text.SimpleDateFormat("dd MMM yyyy hh:mm a").format(order.getOrderDate())%>
</p>

<p>
<b>Payment :</b>
<%=order.getPaymentMode()%>
</p>

<p>
<b>Status :</b>

<%
String css="placed";

if(order.getStatus().equalsIgnoreCase("Delivered"))
    css="delivered";

else if(order.getStatus().equalsIgnoreCase("Cancelled"))
    css="cancelled";
%>

<span class="<%=css%>">

<%=order.getStatus()%>

</span>

</p>

</div>

<b>Restaurant :</b>
<%=order.getRestaurantName()%>
</p>

<p><b>Total Amount :</b>
₹<%=order.getTotalAmount()%>
</p>

<p><b>Status :</b>
<%=order.getStatus()%>
</p>

<p><b>Payment :</b>
<%=order.getPaymentMode()%>
</p>

<p><b>Order Date :</b>
<%= new java.text.SimpleDateFormat("dd MMM yyyy hh:mm a")
        .format(order.getOrderDate()) %>
</p>

<hr>

<h2 style="margin-top:30px;">
🍽 Ordered Items
</h2>

<%
if (items != null && !items.isEmpty()) {

    for (OrderItem item : items) {
%>

<div class="item-card">
<img src="images/<%=item.getImage()%>"
     width="120"
     height="100"
     style="border-radius:10px;">
    <h3><%=item.getItemName()%></h3>

    <p>
        Price : ₹<%=item.getPrice()%>
    </p>

    <p>
        Quantity : <%=item.getQuantity()%>
    </p>

    <p>
        Total : ₹<%=item.getPrice() * item.getQuantity()%>
    </p>

</div>
<hr>

<h2 style="text-align:right;color:#27ae60;">
Grand Total :
₹<%=order.getTotalAmount()%>
</h2>

<br>

<a href="myorders" class="btn">
← Back to My Orders
</a>
<hr>


<%
    }
    
}
}
%>

</body>
</html>
</body>
</html>