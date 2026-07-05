<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.swadify.model.Cart" %>
<%@ page import="com.swadify.model.CartItem" %>
<%@ page import="java.util.List" %>


<%
Cart cart = (Cart)session.getAttribute("cart");

List<CartItem> items =
(cart != null) ? cart.getItems() : null;

%>


<!DOCTYPE html>
<html>

<head>

<title>Swadify Cart</title>


<link rel="stylesheet"
href="css/style.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">



<style>


body{

margin:0;

font-family:Arial;

background:#fff7f2;

}


/* NAVBAR */

.navbar{

height:75px;

background:white;

display:flex;

justify-content:space-between;

align-items:center;

padding:0 60px;

box-shadow:0 2px 10px #ddd;

}



.logo{

font-size:32px;

font-weight:bold;

color:#ff512f;

}


.nav-links a{

text-decoration:none;

margin:15px;

color:#333;

font-weight:bold;

}




/* TITLE */


.title{

text-align:center;

font-size:38px;

margin:40px;

color:#ff512f;

}





.cart-container{


width:80%;

margin:auto;


}




/* CART CARD */


.cart-card{


background:white;

border-radius:20px;

padding:25px;

display:flex;

justify-content:space-between;

align-items:center;


margin-bottom:20px;


box-shadow:0 5px 15px #ddd;


}



.food-info h2{

margin:0;

font-size:25px;

}



.price{

color:#ff512f;

font-size:20px;

font-weight:bold;

}




.qty{

display:flex;

align-items:center;

gap:10px;


}



.qty a button{


width:35px;

height:35px;

border:none;

background:#ff512f;

color:white;

border-radius:50%;

font-size:20px;

cursor:pointer;

}



.remove{
    background: #ff2d2d;
    padding: 8px 14px;
    border-radius: 20px;
    color: white;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    white-space: nowrap;
    margin-left: 20px;
    transition: 0.3s;
}

.remove:hover{
    background: #e60000;
}



/* TOTAL */


.checkout-box{


background:white;

margin-top:30px;

padding:30px;

border-radius:20px;

box-shadow:0 5px 15px #ddd;


text-align:right;


}



.total{


font-size:28px;

font-weight:bold;

}




.checkout{


display:inline-block;

margin-top:20px;

background:#18a558;

color:white;

padding:15px 40px;

border-radius:30px;

text-decoration:none;

font-size:18px;


}





.empty{


background:white;

padding:70px;

border-radius:20px;

text-align:center;

font-size:25px;

box-shadow:0 5px 15px #ddd;


}



</style>


</head>



<body>



<nav class="navbar">


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

Cart 🛒

</a>


<a href="myorders">

Orders

</a>



<a href="logout">

Logout

</a>



</div>


</nav>





<h1 class="title">

🛒 Your Cart

</h1>




<div class="cart-container">


<%

if(items!=null && !items.isEmpty()){



for(CartItem item:items){


%>




<div class="cart-card">



<div class="food-info">


<h2>

<%=item.getItemName()%>

</h2>



<p class="price">

₹ <%=item.getPrice()%>

</p>



<div class="qty">


<a href="cart?action=update&menuId=<%=item.getMenuId()%>&quantity=-1">

<button>-</button>

</a>



<b>

<%=item.getQuantity()%>

</b>



<a href="cart?action=update&menuId=<%=item.getMenuId()%>&quantity=1">

<button>+</button>

</a>


</div>


</div>




<div>


<h3>

₹ <%=item.getTotalPrice()%>

</h3>



<a class="remove"

href="cart?action=remove&menuId=<%=item.getMenuId()%>">

Remove

</a>



</div>



</div>



<%

}

%>




<div class="checkout-box">


<div class="total">


Grand Total :

₹ <%=cart.getTotalPrice()%>


</div>



<a class="checkout"

href="payment.jsp">

Proceed To Checkout

</a>



</div>



<%


}

else{


%>



<div class="empty">


<h2>

Your Cart is Empty 🛒

</h2>


<p>

Add some delicious food from menu

</p>



<a class="checkout"

href="restaurants">

Explore Food

</a>


</div>



<%


}

%>



</div>



</body>

</html>