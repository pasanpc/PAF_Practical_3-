<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (request.getParameter("action") != null) {
	//Insert item----------------------------------
	if (request.getParameter("action").toString().equalsIgnoreCase("insert")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
		request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
		//Update item-----------------------------------
	} else if (request.getParameter("action").toString().equalsIgnoreCase("update")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.updateItem(Integer.parseInt(request.getParameter("itemID").toString()),
		request.getParameter("itemCode"), request.getParameter("itemName"), request.getParameter("itemPrice"),
		request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
		//Remove item------------------------------------
	} else if (request.getParameter("action").toString().equalsIgnoreCase("remove")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.removeItem(Integer.parseInt(request.getParameter("itemID").toString()));
		session.setAttribute("statusMsg", stsMsg);
	}
} else {
	session.setAttribute("statusMsg", "");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>

	<h1>Items Management</h1>
	<%
		if (request.getParameter("action") != null) {
		if (request.getParameter("action").toString().equalsIgnoreCase("select")) {
			Item itemObj = new Item();
			out.print(itemObj.viewItem(Integer.parseInt(request.getParameter("itemID"))));
		} else {
			out.print("<form method='post' action='items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
			+ "Item code: <input name='itemCode' type='text'><br>"
			+ "Item name: <input name='itemName' type='text'><br> "
			+ "Item price: <input name='itemPrice' type='text'><br> "
			+ "Item description: <input name='itemDesc' type='text'><br> "
			+ "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
		}
	} else {
		out.print("<form method='post' action='items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
		+ "Item code: <input name='itemCode' type='text'><br>"
		+ "Item name: <input name='itemName' type='text'><br> "
		+ "Item price: <input name='itemPrice' type='text'><br> "
		+ "Item description: <input name='itemDesc' type='text'><br> "
		+ "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
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

</body>
</html>