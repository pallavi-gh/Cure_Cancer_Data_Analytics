<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Iframe Query Support</title>
</head>
<body>


<%
ArrayList rows = new ArrayList();

if(session.getAttribute("rows_fetched") == null){
	out.println("No rows to display");
}
else{
	rows = (ArrayList)session.getAttribute("rows_fetched");

	if(rows.size() == 0){
		out.println("No rows to display");
	}
	else{
		for(int i=0; i < rows.size(); i++){
			out.println(rows.get(i));
			out.println("<br>");
		}
	}
}
%>

</body>
</html>