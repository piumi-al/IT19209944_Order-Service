$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();



});



// SAVE ============================================

$(document).on("click", "#btnSave", function(event)
		{
		// Clear alerts---------------------
		 $("#alertSuccess").text("");
		 $("#alertSuccess").hide();
		 $("#alertError").text("");
		 $("#alertError").hide();
		// Form validation-------------------
		var status = validateItemForm();
		if (status != true)
		 {
		 $("#alertError").text(status);
		 $("#alertError").show();
		 return;
		 }
		// If valid------------------------
		var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
		 $.ajax(
		 {
		 url : "OrderAPI",
		 type : type,
		 data : $("#formItem").serialize(),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemSaveComplete(response.responseText, status);
		 }
		 });
		});




	function onItemSaveComplete(response, status)
	{
				if (status == "success")
				{
				var resultSet = JSON.parse(response);
				if (resultSet.status.trim() == "success")
				{
				$("#alertSuccess").text("Successfully saved.");
				$("#alertSuccess").show();
				$("#divItemsGrid").html(resultSet.data);
				} else if (resultSet.status.trim() == "error")
				{
				$("#alertError").text(resultSet.data);
				$("#alertError").show();
				}
				} else if (status == "error")
				{
				$("#alertError").text("Error while saving.");
				$("#alertError").show();
				} else
				{
				$("#alertError").text("Unknown error while saving..");
				$("#alertError").show();
				}
				
				$("#hidItemIDSave").val("");
				$("#formItem")[0].reset();
	}

	
	
	
	

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	
$("#hidItemIDSave").val($(this).data("orderid"));

$("#productID").val($(this).closest("tr").find('td:eq(0)').text());
$("#Name").val($(this).closest("tr").find('td:eq(2)').text());
$("#Des").val($(this).closest("tr").find('td:eq(2)').text());
$("#Price").val($(this).closest("tr").find('td:eq(3)').text());
$("#qty").val($(this).closest("tr").find('td:eq(4)').text());
$("#Date").val($(this).closest("tr").find('td:eq(5)').text());

});







//delete====================================================
$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "OrderAPI",
		 type : "DELETE",
		 data : "orderID=" + $(this).data("orderid"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemDeleteComplete(response.responseText, status);
		 }
		 });
		});




function onItemDeleteComplete(response, status)
{
		if (status == "success")
		{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
		$("#alertSuccess").text("Successfully deleted.");
		$("#alertSuccess").show();
		$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
		}
		} else if (status == "error")
		{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
		} else
		{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
		}
}






//CLIENT-MODEL================================================================
function validateItemForm()
{
// CODE
if ($("#productID").val().trim() == "")
{
return "Cannot Insert Product ID.";
}
// NAME
if ($("#Name").val().trim() == "")
{
return "Cannot Insert Product Name.";
}
//PRICE-------------------------------
if ($("#Des").val().trim() == "")
{
return "Cannot Insert Description.";
}

//PRICE-------------------------------
if ($("#Price").val().trim() == "")
{
return "Cannot Insert Price.";
}
// is numerical value
var tmpPrice = $("#Price").val().trim();
if (!$.isNumeric(tmpPrice))
{
return "Insert a numerical value for Item Price.";
}
// convert to decimal price
$("#Price").val(parseFloat(tmpPrice).toFixed(2));
// DESCRIPTION------------------------
if ($("#qty").val().trim() == "")
{
return "Insert Item Quantity.";
}
if ($("#Date").val().trim() == "")
{
return "Insert Order Date.";
}
return true;
}
