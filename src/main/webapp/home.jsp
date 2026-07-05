<%@ page import="java.util.List" %>
<%@ page import="com.swadify.model.Restaurant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.swadify.model.User" %>


<%

User user =
(User)session.getAttribute("user");

%>
<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>


<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>

<title>Swadify Home</title>


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<style>


*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial;
}


body{

background:#fff7f2;

}


/* NAVBAR */


.navbar{

height:75px;
background:white;

display:flex;
align-items:center;
justify-content:space-between;

padding:0 60px;

}


.logo{

font-size:32px;
font-weight:bold;
color:#ff4b2b;

}



.nav-links a{

margin:15px;
text-decoration:none;
color:#333;
font-weight:bold;

}





/* HERO */


.hero{


margin:35px 60px;

height:430px;

border-radius:25px;

background:#fff0e8;

display:flex;

align-items:center;

justify-content:space-between;


padding:50px;


}




.hero h1{


font-size:55px;

color:#222;

line-height:1.1;


}


.hero h1 span{


color:#ff4b2b;


}


.hero p{

font-size:20px;

margin:20px 0;

color:#555;

}



.hero img{


width:500px;

height:330px;

object-fit:cover;

border-radius:20px;


}





.search{


display:flex;


}


.search input{


width:350px;

padding:18px;

border-radius:30px;

border:1px solid #ddd;


}



.search button{


padding:18px 35px;

border:none;

background:#ff512f;

color:white;

border-radius:30px;


}





/* CATEGORY */


.title{

margin:35px 60px;

font-size:32px;

}


.categories{


display:flex;

gap:20px;

margin:0 60px;


}



.cat{


background:white;

width:130px;

padding:25px;

text-align:center;

border-radius:20px;

box-shadow:0 5px 15px #ddd;


font-weight:bold;


}




/* RESTAURANT */


.container{


display:flex;

gap:25px;

margin:30px 60px;

flex-wrap:wrap;


}



.card{


background:white;

width:260px;

border-radius:20px;

overflow:hidden;

box-shadow:0 5px 20px #ddd;


}



.card img{


width:100%;

height:160px;

object-fit:cover;


}


.card-content{

padding:20px;


}



.btn{


display:block;

background:#ff512f;

color:white;

text-align:center;

padding:12px;

border-radius:25px;

text-decoration:none;

margin-top:15px;


}




/* FEATURES */


.features{


margin-top:50px;

background:white;

display:flex;

justify-content:space-around;

padding:40px;


}


.feature{

text-align:center;

}



</style>



</head>



<body>



<nav class="navbar">
<%

if(user!=null){

%>


<span>

Welcome <%=user.getName()%>

</span>


<%

}

%>

<div class="logo">

🍔 Swadify

</div>



<div class="nav-links">


<a href="home">
Home
</a>


<a href="restaurants">
Menu
</a>


<a href="cart.jsp">
Cart
</a>


<a href="myorders">
Orders
</a>



<a href="profile.jsp">
Profile
</a>


<a href="logout">
Logout
</a>


</div>

</nav>





<section class="hero">


<div>


<h1>

Delicious Food

<br>

<span>Delivered Fast</span>

</h1>



<p>

Fresh &bull; Hot &bull; Tasty &bull; On Your Doorstep

</p>



<div class="search">


<input placeholder="Search restaurants">


<button>

Search

</button>


</div>


</div>




<img src="images/banner.png">



</section>






<h2 class="title">

Explore By Cuisine

</h2>



<div class="categories">


<div class="cat">🍕<br>Pizza</div>

<div class="cat">🍔<br>Burgers</div>

<div class="cat">🥘<br>South Indian</div>

<div class="cat">🍜<br>Chinese</div>

<div class="cat">🍗<br>Chicken</div>

<div class="cat">🍰<br>Desserts</div>


</div>





<h2 class="title">

Top Restaurants

</h2>



<div class="container">



<%

if(restaurants!=null){


for(Restaurant r:restaurants){

%>


<div class="card">


<img src="<%=r.getImagePath()%>">


<div class="card-content">


<h2>

<%=r.getName()%>

</h2>



<p>

⭐ <%=r.getRatings()%>

</p>


<p>

🍽 <%=r.getCuisineType()%>

</p>


<p>

🕒 <%=r.getDeliveryTime()%> mins

</p>



<a class="btn"

href="menu?restaurantId=<%=r.getRestaurantId()%>">

View Menu

</a>


</div>


</div>


<%

}

}

else{

%>

<h2>

No Restaurants Found

</h2>


<%

}

%>



</div>






<div class="features">


<div class="feature">

🚴

<h3>Fast Delivery</h3>

<p>30-40 mins</p>

</div>



<div class="feature">

🛡

<h3>Safe & Secure</h3>

<p>Quality Food</p>

</div>



<div class="feature">

🏷

<h3>Best Offers</h3>

<p>Every Order</p>

</div>



<div class="feature">

☎

<h3>Support</h3>

<p>24/7 Help</p>

</div>


</div>



</body>

</html>