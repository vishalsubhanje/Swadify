<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.swadify.model.Order"%>
<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f5f5;
}


.navbar{
    background:white;
    padding:18px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 10px rgba(0,0,0,.08);
}

.logo{
    font-size:30px;
    color:#ff5a1f;
    font-weight:bold;
}

.navbar a{
    text-decoration:none;
    color:#444;
    margin-left:25px;
    font-weight:600;
}

.navbar a:hover{
    color:#ff5a1f;
}

.container{
    width:85%;
    margin:40px auto;
}

.heading{
    font-size:35px;
    margin-bottom:30px;
    color:#333;
}

.order-card{
    background:white;
    border-radius:15px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.top{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
}

.payment-text{
    color:#222;
    font-size:17px;
    font-weight:600;
    margin-top:10px;
}

.amount{
    color:#27ae60;
    font-size:40px;
    font-weight:bold;
}

.buttons{
    margin-top:20px;
}

.top{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
}

.order-id{
    font-size:24px;
    font-weight:bold;
    color:#ff5a1f;
}

.amount{
    font-size:28px;
    color:#27ae60;
    font-weight:bold;
}

.info p{
    margin:12px 0;
    color:#555;
    font-size:17px;
}

.badge{
    color:white;
    padding:5px 14px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

.placed{
    background:#3498db;
}

.delivered{
    background:#2ecc71;
}

.cancelled{
    background:#e74c3c;
}

.buttons{
    margin-top:25px;
}
.payment-text{
    color:#000;
    font-weight:600;
}

.btn{
    text-decoration:none;
    background:#ff5a1f;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    margin-right:15px;
    display:inline-block;
}

.btn:hover{
    background:#e64a19;
}

.empty{
    background:white;
    padding:80px;
    text-align:center;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.empty h2{
    color:#777;
}
</style>

</head>

<body>

<nav class="navbar">

<div class="logo">
🍔 Swadify
</div>

<div class="nav-links">
<a href="home">Home</a>
<a href="restaurants">Restaurants</a>
<a href="cart.jsp">Cart</a>
<a href="myorders">My Orders</a>
<a href="logout">Logout</a>
</div>

</nav>

<div class="container">

<h1 class="heading">📦 My Orders</h1>

<%
if(orders != null && !orders.isEmpty()){

    for(Order order : orders){

        String css = "placed";

        if("DELIVERED".equalsIgnoreCase(order.getStatus())){
            css = "delivered";
        }
        else if("CANCELLED".equalsIgnoreCase(order.getStatus())){
            css = "cancelled";
        }
%>

<div class="order-card">

    <div class="top">

        <div>

            <div class="order-id">
                Order #<%=order.getOrderId()%>
            </div>

            <div class="info">

                <p>
                    <b>Status :</b>
                    <span class="badge <%=css%>">
                        <%=order.getStatus()%>
                    </span>
                </p>

                <p>
                    📅 <b>Order Date :</b>
                   <%=order.getOrderDate()%>
                </p>

                <p>
🏪 <b>Restaurant :</b>
<%=order.getRestaurantName()%>
                </p>

                <p class="payment-text">
                    💳 <b>Payment :</b>
                    <%=order.getPaymentMode()==null ? "Cash on Delivery" : order.getPaymentMode()%>
                </p>

            </div>

            <div class="buttons">

                <a href="orderdetails?orderId=<%=order.getOrderId()%>" class="btn">
    View Details
</a>

                <a href="#" class="btn">
                    Reorder
                </a>

            </div>

        </div>

        <div class="amount">
            ₹<%=order.getTotalAmount()%>
        </div>

    </div>

</div>

<%
    }
}
else{
%>

<div class="empty">

    <i class="fa-solid fa-box-open"
       style="font-size:70px;color:#bbb;margin-bottom:20px;"></i>

    <h2>No Orders Yet</h2>

    <p style="margin-top:15px;">
        Looks like you haven't placed any orders.
    </p>

</div>

<%
}
%>

</div>

</body>
</html>