<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>   
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<br>
<br>

<title>Orders</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/orders.js"></script>

</head>



<body>
<h1 class="font-weight-bolder" style="text-align:center" >Orders </h1>
		
<%

String itemID = request.getParameter("Item_id"); 
String name = request.getParameter("Item_Name"); 
String des  =request.getParameter("Item_Desc"); 
String price= request.getParameter("Item_price"); 
String qty= request.getParameter("Stock_qty");


%>

<div class="container">
<div class="row">
<div class="col-6">

		
		<form id="formItem" name="formItem">
	
	
		<br>Name:
		<input id="itemName" name="itemName" value="<%=name%>"type="text"class="form-control form-control-sm">
		
		
	
		<input id="itemID" name="itemID" value="<%=itemID %>" type="hidden"class="form-control form-control-sm">
		
		<br>Description:
		<input id="itemDes" name="itemDesc" value="<%=des%>" type="text"class="form-control form-control-sm">
		
		
		<br> Price:
		<input id="price" name="price" value="<%=price %>" type="text"class="form-control form-control-sm">
		
		
		
		<br>Quantity:
		<input id="qty" name="qty" type="text"class="form-control form-control-sm">
		
		<br>
		
		<input id="btnSave" name="btnSave"  type="button" value="Add" class="btn btn-primary">
		
		<input id="hidItemIDSave" name="hidItemIDSave" value="" type="hidden">
		
		
</form>


<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>

<br>

<div class="table" class="table table-striped"  cellspacing="40px" cellpadding="15px">
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