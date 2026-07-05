<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
href="css/style.css">
<meta charset="UTF-8">
<title>Swadify - Login</title>

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
    width:350px;
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

<%

String error =
(String)request.getAttribute("error");


if(error!=null){

%>


<p style="color:red">

<%=error%>

</p>


<%

}

%>

<form action="login" method="post">

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<button type="submit">
Login
</button>

</form>

<p>
Don't have an account?
<a href="register.jsp">Register</a>
</p>

</div>

</body>
</html>