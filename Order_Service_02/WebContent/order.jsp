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
/*background: rgb(252, 238, 144);*/
background: linear-gradient(90deg, rgba(242, 242, 213,1) 0%, rgba(242, 238, 206) 49%, rgba(242, 242, 213,1) 100%);
}


#example1 {

border: 1px solid;
padding: 8px;
box-shadow: 3px 8px 6px 8px #888888;
background: linear-gradient(90deg, rgba(58, 82, 94,1) 2%, rgba(242, 75, 109) 49%, rgba(227, 217, 188,1) 100%);   
}


table{ background-color:white; 
	   width:100%;
}


th { background:rgba(58, 82, 94,8);  
	 color:white;
	  
}

.center {
  margin-left: auto;
  margin-right: auto;
}

h5{
  
}

</style>
</head>

<body>

<%

String itemID = request.getParameter("Item_id"); 
String name = request.getParameter("Item_Name"); 
String des  =request.getParameter("Item_Desc"); 
String price= request.getParameter("Item_price"); 
String qty= request.getParameter("Stock_qty");


%>

		
<div id="example1">
<h4 style="text-align:left;color:white;">GadgetBadget System</h4>
</div>
<br><br>

		<h3 style="text-align:center;">Order Management</h3>		
		<div class="row justify-content-center"><div class="col-7">

	
		
		
		<form id="formItem" name="formItem"  >

				
				<input id="productID" name="productID"  value="<%=itemID %>" type="hidden" class="form-control">
				
				<br><h6>Item Name:</h6>
				<input id="Name" name="Name"  value="<%=name%>" type="text" class="form-control">
				
				<br><h6>Description:</h6>
				<input id="Des" name="Des" value="<%=des%>"  type="text"class="form-control ">
				
				
				<br><h6>Item Price:</h6>
				<input id="Price" name="Price" value="<%=price %>"  type="text" class="form-control ">
				
				<br><h6>Quantity:</h6>
				<input id="qty" name="qty" type="number" placeholder ="Select item Quantity...." class="form-control ">
				
				<br><h6>Order Date:</h6>
				<input id="Date" name="Date" type="date"class="form-control ">
				<br>
				<input id="btnSave" name="btnSave" type="button" value="Add  Order"  class="btn btn-info">
				
				<input type="hidden" id="hidItemIDSave"name="hidItemIDSave" value="">
				<br>
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

</body>
</html>