<%@page import="com.Order"%>
<%@page import="java.sql.*"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>Item list</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">

<style>

#example1 {

border: 1px solid;
padding: 8px;
box-shadow: 3px 8px 6px 8px #888888;
background: linear-gradient(90deg, rgba(58, 82, 94,1) 2%, rgba(242, 75, 109) 49%, rgba(227, 217, 188,1) 100%);  
}

body  {
/*background: rgb(252, 238, 144);*/
background: linear-gradient(90deg, rgba(242, 242, 213,1) 0%, rgba(242, 238, 206) 49%, rgba(242, 242, 213,1) 100%);
}
  
 .div {
 width: 320px;
 padding: 10px;
 border: 1px solid gray;
 margin: 0;
 background-color:white;
}

</style>
</head>



<body>


<div id="example1">
<h4 style="text-align:left;color:white;">GadgetBadget System</h4>

</div>
<br><br><br>



<table align = "center"  border="0px" cellspacing="100px" cellpadding="60px">
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
    	 
      }
      
      i++;   
     
      
%>
		
		
		<th >
		<div class="card" style="width: 18rem;">
		<div class="card-body">
		<h4 class="card-title"><%=name %></h4><br><br>
      	<h5class="card-text"> Rs: <%= price %></h5> <br><br>
      	<a class="btn btn-danger" href="order.jsp?Item_id=<%=id %>&Item_Name=<%=name %>&Item_Desc=<%=des %>&Item_price=<%=price%>&Stock_qty=<%=qty%>">Order Now</a>
  		</div>
  		</div>
  		</th>
  		
<%  

 
    }
   
}catch(Exception e){
	
	out.println(e);
	
	
}

%>
</table>

  
	

</body>
</html>