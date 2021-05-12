<%@page import="com.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>





<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Orders</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/orders.js"></script>


</head>

<body>

<%

String itemID = request.getParameter("Item_id"); 
String name = request.getParameter("Item_Name"); 
String des  =request.getParameter("Item_Desc"); 
String price= request.getParameter("Item_price"); 
String qty= request.getParameter("Stock_qty");


%>

		
<div class="container"><div class="row"><div class="col-6">

		<h1>Orders Management </h1>
		<form id="formItem" name="formItem">

		
		<input id="productID" name="productID"  value="<%=itemID %>" type="hidden"class="form-control form-control-sm">
		
		<br> Name:
		<input id="Name" name="Name"  value="<%=name%>" type="text"class="form-control form-control-sm">
		
		<br> Description
		<input id="Des" name="Des" value="<%=des%>"  type="text"class="form-control form-control-sm">
		
		
		<br> Price:
		<input id="Price" name="Price" value="<%=price %>"  type="text"class="form-control form-control-sm">
		
		<br> Quantity:
		<input id="qty" name="qty" type="number"class="form-control form-control-sm">
		
		<br> Date:
		<input id="Date" name="Date" type="date"class="form-control form-control-sm">
		<br>
		<input id="btnSave" name="btnSave" type="button" value="Add  Order"  class="btn btn-primary">
		
		<input type="hidden" id="hidItemIDSave"name="hidItemIDSave" value="">
		<br>
</form>

<br>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>

<br>

<div id="divItemsGrid">
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