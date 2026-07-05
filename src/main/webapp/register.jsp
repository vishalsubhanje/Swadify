<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Swadify - Register</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#f4f4f4;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{
    background:white;
    width:400px;
    padding:30px;
    border-radius:10px;
    box-shadow:0px 0px 10px lightgray;
}

h1{
    text-align:center;
    color:#ff6b35;
}

input{
    width:100%;
    padding:12px;
    margin-top:15px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

button{
    width:100%;
    padding:12px;
    margin-top:20px;
    border:none;
    background:#ff6b35;
    color:white;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#e85a2a;
}

a{
    text-decoration:none;
    color:#ff6b35;
}

p{
    text-align:center;
}

</style>
</head>

<body>

<div class="container">

<h1>Swadify</h1>

<form action="register" method="post">

<input type="text"
name="name"
placeholder="Enter Name"
required>

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<input type="text"
name="phone"
placeholder="Enter Phone Number"
required>

<input type="text"
name="address"
placeholder="Enter Address"
required>

<button type="submit">
Register
</button>

</form>

<p>
Already have an account?
<a href="login.jsp">Login</a>
</p>

</div>

</body>
</html>