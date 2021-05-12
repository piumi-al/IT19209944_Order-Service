<%@page import="com.Order"%>
<%@page import="java.sql.*"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">


</head>
<body>
<br><br>
<h1 class="font-weight-bolder" style="text-align:center"> Items </h1>
<br><br><br>

<table align = "center"  border="0px" cellspacing="200px" cellpadding="15px">
<%

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gadgetbadget","root", "1999ppdd");

    String query = "SELECT * FROM items";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    int i =0;
    // iterate through the rows in the result set
    while (rs.next())
    {
      
      
      String id = Integer.toString(rs.getInt("Item_id")); 
      String name = rs.getString("Item_Name"); 
      String des = rs.getString("Item_Desc"); 
      String price= rs.getString("Item_price"); 
      String qty =  Integer.toString(rs.getInt("Stock_qty"));
    
      if(i==3){
    	  
    	  
    	  out.print("<tr></tr>");
    	  i=0;
      }
      i++;
      
%>
		
		
		<br>
		
		<div class="card" style="width: 18rem;">
		
		<td><h5 class="card-title"><%=name %></h5><br><br><br>
      	 Rs: <%= price %><br><br><br>
      	 <a class="btn btn-primary" href="order.jsp?Item_id=<%=id %>&Item_Name=<%=name %>&Item_Desc=<%=des %>&Item_price=<%=price%>&Stock_qty=<%=qty%>">Order Now</a>
  		</div>
  		  
  		  
  	
<%  
    }
   
}catch(Exception e){
	
	out.println(e);
	
	
}

%>
</table>

	

</body>
</html>