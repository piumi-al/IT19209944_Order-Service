package com;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Order {
	
	
	  
	   /*
		* A method to connect to the DB
		*/
		private Connection connect(){
			
			Connection con = null;
			
			try
			{
				
				Class.forName("com.mysql.jdbc.Driver");
				//Provide the correct details: DBServer/DBName, username, password
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/gadgetbadget","root","1999ppdd");
			}
			catch (Exception e)
			{
				e.printStackTrace();
				
			
			}
			
		    return con;
		}
	
	
		
		
		 /*
		    * view all order details
	        */
			public String viewOrders() {
			
				
				String output = "";
				
				
				
				try {
					
					
					
					Connection con = connect();
					
					
					if (con == null) {
						
						return "Error while connecting to the database for reading.";
					}
					
					
					// Prepare the html table to be displayed
					output = "<table class='table table-hover' border='1'><tr><th scope='col' >Order ID</th><th scope='col'>Product ID</th>" + "<th scope='col'>Product Name</th>"+"<th scope='col'>Price</th>"+ "<th scope='col'>Quantity</th>" + "<th scope='col'>Order Date</th>" + "<th scope='col'>Update</th><th scope='col'>Remove</th></tr>";
		
					
					String query = "select * from orders";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(query);
		
					
					
					// iterate through the rows in the result set
					while (rs.next()) {
						
						String orderID = Integer.toString(rs.getInt("orderID"));
						String productID = rs.getString("productID");
						String name = rs.getString("Name");
						String price = Double.toString(rs.getDouble("Price")); 
						String qty =Integer.toString(rs.getInt("qty"));
						String orderDate = rs.getString("Date");
						
		
						
						// Add into the html table
						output += "<tr><td >" + orderID + "</td>";
						output += "<td>" + productID + "</td>";
						output += "<td>" + name + "</td>";
						output += "<td>" + price + "</td>";
						output += "<td>" + qty + "</td>";
						output += "<td>" + orderDate + "</td>";
		
					
						 
						// buttons
						 output += "<td><input name='btnUpdate' type='button' value='Update' "
						 + "class='btnUpdate btn btn-secondary' data-orderid='" +  orderID+ "'></td>"
						 + "<td><input name='btnRemove' type='button' value='Remove' "
						 + "class='btnRemove btn btn-danger' data-orderid='" + orderID  + "'></td></tr>";
						 
					
					}
					con.close();
					
		
					// Complete the html table
					output += "</table>";
					
					
				} catch (Exception e) {
					
					output = "Error while reading the orders details.";
					System.err.println(e.getMessage());
				}
				
				return output;
				
			}
		
		
		
			
			
			
		
		
			 
			/*
			 * add orders to the system
			 */
			 public String addOrders( String productID ,String Name ,String Price ,int qty,String Date  ){
			
				 int items_qty=0;
				boolean validate = false;
				String output = "";
		
				
				//java.sql.Date Date = new java.sql.Date(new java.util.Date().getTime());
				
			

				try
				{
					
					Connection con = connect();
					
					if (con == null)
					{
						return "Error while connecting to the database for inserting."; 
				
				
					}
		
					
					//select stock item quantity
					String query2 = " select Stock_qty from items where Item_id = ?";
					PreparedStatement preparedStmt2 = con.prepareStatement(query2);
					preparedStmt2.setString(1, productID);
					ResultSet rs = preparedStmt2.executeQuery();
					
				
		
					while(rs.next()) {
						
						
						items_qty= rs.getInt("Stock_qty");
			
					}
		
		
					if(qty > items_qty) {
						
						validate = false;
						//output = " only " + items_qty + " quantity available!" ;
						
						output = "{\"status\":\"error\", \"data\": \" only " + items_qty + " quantity available!\"}";
						
					}
					
					
					else {
						validate = true;
					}
					
					
					
					
					if(validate) {
						
				
					// create a prepared statement
					String query = " insert into orders(`orderID`,`productID`,`Name`,`Price`,`qty`,`Date`)"+ "values(?,?,?,?,?,?)";
						
						PreparedStatement preparedStmt = con.prepareStatement(query);
						
				
						
						// binding values
						preparedStmt.setInt(1, 0);
						preparedStmt.setString(2, productID);
						preparedStmt.setString(3, Name);
						preparedStmt.setDouble(4, Double.parseDouble(Price));
						preparedStmt.setInt(5,(qty));
						preparedStmt.setString(6, Date);
						
						
						// execute the statement
				
						preparedStmt.execute();
						con.close();
						
						
						
						
						String newItems = viewOrders();
						output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
						
						
					
						}
					
					
					}
				
						catch (Exception e)
						{
							
							output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}";
							System.err.println(e.getMessage());
						}
				
				
					return output;
					
					
					
				}
				
				
		
			 
			 
			 

				
			  /*
			   * update order items quantity
			   */ 
			   public String updateOrders(String orderID,String qty) {
				
					
					String output = "";
					
					
					try {
						
						
						Connection con = connect();
						
						
						if (con == null) {
							
							return "Error while connecting to the database for updating.";
						}
						
						
						// create a prepared statement
						String query = "UPDATE orders SET qty=? WHERE orderID=?";
						PreparedStatement preparedStmt = con.prepareStatement(query);
						
						
						// binding values
						preparedStmt.setInt(1, Integer.parseInt(qty));
					    preparedStmt.setInt(2, Integer.parseInt(orderID));
			
						
						// execute the statement
						preparedStmt.execute();
						con.close();
						
						
						String newItems = viewOrders();
						output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
						
					} catch (Exception e) {
						
						
						output = "{\"status\":\"error\", \"data\":\"Error while updating the item.\"}";
						System.err.println(e.getMessage());
					}
					
					
					return output;
					
			  }
			
			
			
			
			   /*
				* delete order details
				*/ 
				
				

			public String deleteOrders(String orderID) {
				
				
				
				String output = "";
				
						try {
							Connection con = connect();
							if (con == null) {

								return "Error while connecting to the database for deleting.";
							}
							
							
							// create a prepared statement
							String query = "delete from orders where orderID=?";
							PreparedStatement preparedStmt = con.prepareStatement(query);
							
							// binding values
							preparedStmt.setInt(1, Integer.parseInt(orderID));
							
							// execute the statement
							preparedStmt.execute();
							con.close();
							
							String newItems = viewOrders();
							output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
						} catch (Exception e) {
							output = "{\"status\":\"error\", \"data\":\"Error while deleting order.\"}";
							System.err.println(e.getMessage());
						}
						return output;
					}
				
				
				
				
		

}
