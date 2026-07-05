<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Order Successful</title>

<style>
body{
    font-family: Arial;
    background:#f5f5f5;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}

.card{
    background:white;
    padding:40px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 0 15px lightgray;
}

h1{
    color:green;
}

a{
    text-decoration:none;
    background:#ff6b35;
    color:white;
    padding:10px 20px;
    border-radius:8px;
}
.btn{
    display:inline-block;
    margin:10px;
    background:#ff6b35;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;
}

.btn:hover{
    background:#e85a2a;
}
</style>
</head>
<body>

<div class="card">
    <h1>🎉 Order Placed Successfully!</h1>
    <p>Thank you for ordering from Swadify.</p>
    <br>

<a href="restaurants" class="btn">Continue Ordering</a>
<a href="myorders" class="btn">View My Orders</a>
</div>

</body>
</html>