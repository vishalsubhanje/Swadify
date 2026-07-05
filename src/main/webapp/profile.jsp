<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Dummy data (later replace with DB/session)
    String userName = "Vishal";
    String email = "vishal@gmail.com";
    String phone = "9876543210";
    String address = "BTM Layout, Bangalore";
    String city = "Bangalore";
    String pincode = "560076";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile - Swadify</title>

<style>

body{
    margin:0;
    font-family: Arial;
    background:#f5f5f5;
}

/* NAVBAR */
.navbar{
    background:#ff5a1f;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:15px;
}

/* CONTAINER */
.container{
    width:45%;
    margin:40px auto;
}

/* CARD */
.card{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

/* FORM */
label{
    font-weight:bold;
    color:#333;
}

input, textarea{
    width:100%;
    padding:12px;
    margin-top:8px;
    margin-bottom:18px;
    border:1px solid #ddd;
    border-radius:8px;
    font-size:14px;
}

textarea{
    resize:none;
    height:80px;
}

/* BUTTON */
.btn{
    background:#ff5a1f;
    color:white;
    border:none;
    padding:12px;
    width:100%;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;
}

.btn:hover{
    background:#e64a19;
}

h2{
    text-align:center;
    color:#333;
    margin-bottom:20px;
}

.section-title{
    margin-top:25px;
    margin-bottom:10px;
    color:#ff5a1f;
    font-weight:bold;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div><b>🍔 Swadify</b></div>
    <div>
        <a href="restaurants">Home</a>
        <a href="myorders">My Orders</a>
        <a href="profile.jsp">Profile</a>
    </div>
</div>

<!-- FORM -->
<div class="container">

    <div class="card">

        <h2>Edit Profile</h2>

        <form action="updateProfile" method="post">

            <label>Name</label>
            <input type="text" name="name" value="<%= userName %>">

            <label>Email</label>
            <input type="email" name="email" value="<%= email %>">

            <label>Phone</label>
            <input type="text" name="phone" value="<%= phone %>">

            <div class="section-title">📍 Address Details</div>

            <label>Full Address</label>
            <textarea name="address"><%= address %></textarea>

            <label>City</label>
            <input type="text" name="city" value="<%= city %>">

            <label>Pincode</label>
            <input type="text" name="pincode" value="<%= pincode %>">

            <button type="submit" class="btn">Update Profile</button>

        </form>

    </div>

</div>

</body>
</html>