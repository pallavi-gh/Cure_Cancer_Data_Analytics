<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script>

function validate(){

	name = document.getElementById("name").value;
	id = document.getElementById("id").value;
	
	if(name == ""){
		alert("Please enter patient Full Name");
		return false;
	}
	else if(id == ""){
		alert("Please Enter ID");
		return false;
	}
	else if(id.length < 6){
		alert("ID length should be greater than or equal to 6");
		return false;
	}
	return true;
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cure Cancer Portal</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--
spigot, a free CSS web template by ZyPOP (zypopwebtemplates.com/)

Download: http://zypopwebtemplates.com/

License: Creative Commons Attribution
//-->
</head>
<body>
<div id="container">
    <header>
    	<h1><a href="/">Pathology<span>Application</span></a></h1>
        <h2></h2>
    </header>
    <nav>
    	<ul>
        	<li class=""><a href="home.jsp">Home</a></li>
        	<li class=""><a href="index.jsp">View Features</a></li>
            <li class=""><a href="query.jsp">Query GUI</a></li>
            <li class=""><a href="query_text.jsp">Query Text</a></li>
            <li class=""><a href="query_old.jsp">Query Old</a></li>
            <li class=""><a href="window.jsp">Window Histogram</a></li>
        </ul>
    </nav>

	<img height="240" width="950" class="header-image" src="images/image.jpg" alt="Buildings" />

	
<% if(session.getAttribute("name") == null){
	 %>
	<p align="right" style="color:blue;" >Please enter Patient Details</p>
	<%
}
else{
%>
	<p align="right" style="color:blue;">Welcome: <%=session.getAttribute("name").toString() %> </p>
<% 
}
%>

    <div id="body">

		<section id="content">
		
		<table>
		
		<%
		int len = 22;

		final int TOTAL_IMAGES = 35;
		ArrayList idx = new ArrayList();
		String[] image_orig = new String[TOTAL_IMAGES];
		String[] image_name = new String[TOTAL_IMAGES];
		String[] image_icon = new String[TOTAL_IMAGES];
		int [] image_row_count = new int[TOTAL_IMAGES];
		ArrayList rows_fetched = new ArrayList();
		
		image_orig = (String[])session.getAttribute("image_orig");
		image_name = (String[])session.getAttribute("image_name");
		image_icon = (String[])session.getAttribute("image_icon");
		image_row_count = (int [])session.getAttribute("image_row_count");	
		rows_fetched = (ArrayList)session.getAttribute("rows_fetched");
		
		//Fill idx
		for(int i = 0; i < TOTAL_IMAGES; i++){
			
			if(image_orig[i].equals("")){
				continue;
			}
			else{
				idx.add(i);
			}
		}
		
		for(int i = 0; i < idx.size(); i= i+3){ %>
		
		<tr>
		<td><img class="image_scale" src='<%="images/output/"+image_icon[(int)idx.get(i)] %>' alt="Input_image" style="width:100px;height:100px">
				<div>Count: <%=image_row_count[(int)idx.get(i)]%></div>
				<div><a href='<%="images/output/"+image_orig[(int)idx.get(i)] %>'><%=image_name[(int)idx.get(i)]%></a></div></td>
		<td><%
		if((i+1) < idx.size()){ 
	%>  <img class="image_scale" src='<%="images/output/"+image_icon[(int)idx.get(i+1)] %>' alt="Input_image" style="width:100px;height:100px">
				<div>Count: <%=image_row_count[(int)idx.get(i+1)]%></div>
				<div><a href='<%="images/output/"+image_orig[(int)idx.get(i+1)] %>'><%=image_name[(int)idx.get(i+1)]%></a></div><%}
		else{
			continue;
		}%></td>
		<td><%
		if((i+2) < idx.size()){%>
		<img class="image_scale" src='<%="images/output/"+image_icon[(int)idx.get(i+2)] %>' alt="Input_image" style="width:100px;height:100px">
				<div>Count: <%=image_row_count[(int)idx.get(i+2)]%></div>
				<div><a href='<%="images/output/"+image_orig[(int)idx.get(i+2)] %>'><%=image_name[(int)idx.get(i+2)]%></a></div>
		<%}
		else{
			continue;
		}%></td>
		</tr>
		<%} %>
		</table>
		
		<br>
		<br>
		<br>
		<div>
		<h3>Rows fetched: <%=rows_fetched.size() %></h3>
		<!-- <iframe class="myframe" src="result_iframe.jsp" id="iframe1" width=600 height="200"></iframe> -->
		</div>
    	<div>
    	<a href="files/rows.txt" download="rows.txt" class="button">Download File</a>
    	</div>
        </section>
        
       
    	<div class="clear"></div>
    </div>
    <footer>
        <div class="footer-bottom">
            <p>Group4 Pathology</p>
         </div>
    </footer>
</div>
</body>
</html>
