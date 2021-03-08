<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (request.getParameter("action") != null) {
	//Insert item----------------------------------
		if (request.getParameter("action").toString().equalsIgnoreCase("insert")) 
		{
			Item itemObj = new Item();
			String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
					request.getParameter("itemName"),
					request.getParameter("itemPrice"), 
					request.getParameter("itemDesc"));
			session.setAttribute("statusMsg", stsMsg);
	//Update item-----------------------------------
		}
		else if (request.getParameter("action").toString().equalsIgnoreCase("update")) {
			Item itemObj = new Item();
			String stsMsg = itemObj.updateItem(Integer.parseInt(request.getParameter("itemID").toString()),
				request.getParameter("itemCode"), 
				request.getParameter("itemName"), 
				request.getParameter("itemPrice"),
				request.getParameter("itemDesc"));
			session.setAttribute("statusMsg", stsMsg);
	//Delete item------------------------------------
		} 
		else if (request.getParameter("action").toString().equalsIgnoreCase("remove")) {
			Item itemObj = new Item();
			String stsMsg = itemObj.removeItem(Integer.parseInt(request.getParameter("itemID").toString()));
			session.setAttribute("statusMsg", stsMsg);
		}
} 
	else {
	session.setAttribute("statusMsg", "");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="Views/bootstrap.min.css">


<title>Items Management</title>
</head>
<body>

<div class="container">
 <div class="row">
 <div class="col">
	<h1>Items Management</h1>
	<%
		if (request.getParameter("action") != null) {
			if (request.getParameter("action").toString().equalsIgnoreCase("select")) {
				Item itemObj = new Item();
				out.print(itemObj.viewItem(Integer.parseInt(request.getParameter("itemID"))));
			} 
			else {
				out.print("<form method='post' action='items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
				+ "Item code: <input name='itemCode' type='text' class='form-control'><br>"
				+ "Item name: <input name='itemName' type='text' class='form-control'><br> "
				+ "Item price: <input name='itemPrice' type='text' class='form-control'><br> "
				+ "Item description: <input name='itemDesc' type='text' class='form-control'><br> "
				+ "<input name='btnSubmit' type='submit' value='Save' class='btn btn-primary'> " + "</form>");
			}
		}
		else {
			out.print("<form method='post' action='items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
			+ "Item code: <input name='itemCode' type='text' class='form-control'><br>"
			+ "Item name: <input name='itemName' type='text' class='form-control'><br> "
			+ "Item price: <input name='itemPrice' type='text' class='form-control'><br> "
			+ "Item description: <input name='itemDesc' type='text' class='form-control'><br> "
			+ "<input name='btnSubmit' type='submit' value='Save' class='btn btn-primary'> " + "</form>");
		}
	%>

	<br>
	<p>
		<%
			if (session.getAttribute("statusMsg") != null) {
				out.print(session.getAttribute("statusMsg"));
				session.setAttribute("statusMsg", null);
		}
		%>
	</p>

	<br>
	<%
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>
 </div>
 </div>
</div>



</body>
</html>