<%@page import="com.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>





<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Order Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/orders.js"></script>

<style>

body  {
background-color:#d9d4d6;
 
}
#example1 {
color:white;
border: 1px solid;
padding: 6px;
box-shadow: 3px 8px 6px 8px #888888;
background-color:#947876;
  
}
table{ background-color:white; 
width:100%;
}
th { background-color:#b88c8a;
	color:white;
	 font-family: "Times New Roman", Times, serif; }

.center {
  margin-left: auto;
  margin-right: auto;
}

h5{
  font-family: "Times New Roman", Times, serif;

}

</style>
</head>

<body>
<br>
<%

String itemID = request.getParameter("Item_id"); 
String name = request.getParameter("Item_Name"); 
String des  =request.getParameter("Item_Desc"); 
String price= request.getParameter("Item_price"); 
String qty= request.getParameter("Stock_qty");


%>

		<div id="example1">
		<h2 style="text-align:center;font-style: italic;color:white;"> Order Management </h2>
		</div>
		<br>		
		<div class="row justify-content-center"><div class="col-7">

	
		
		
		<form id="formItem" name="formItem"  >

		
		<input id="productID" name="productID"  value="<%=itemID %>" type="hidden" class="form-control">
		
		<br><h5>Product Name:</h5>
		<input id="Name" name="Name"  value="<%=name%>" type="text" class="form-control">
		
		<br><h5>Description:</h5>
		<input id="Des" name="Des" value="<%=des%>"  type="text"class="form-control ">
		
		
		<br><h5>Product Price:</h5>
		<input id="Price" name="Price" value="<%=price %>"  type="text" class="form-control ">
		
		<br><h5>Quantity:</h5>
		<input id="qty" name="qty" type="number" placeholder ="Select item Quantity...." class="form-control ">
		
		<br><h5>Order Date:</h5>
		<input id="Date" name="Date" type="date"class="form-control ">
		<br>
		<input id="btnSave" name="btnSave" type="button" value="Add  Order"  class="btn btn-info">
		
		<input type="hidden" id="hidItemIDSave"name="hidItemIDSave" value="">
		<br>
</form>


<br>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>


<div  id="divItemsGrid" style="text-align:center">
 <%
 Order itemObj = new Order();
 out.print(itemObj.viewOrders());
 %>
</div>
</div>
</div>
</div>
</body>
</html>