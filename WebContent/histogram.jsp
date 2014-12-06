<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script>
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cure Cancer Portal</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

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
		String currentImage = (String)session.getAttribute("current_image");
		
		if(session.getAttribute("current_image") == null){
			out.println("No Current Image");
		}
		else{
			%>
			<tr>
			<td><h3 align="center">Histograms for <%=currentImage %></h3><br><br></td>
			</tr>
			
			<tr><td>
			<div align="center">Area</div>
			<img class="" src='<%="images/histogram/"+currentImage+"Area.PNG" %>' alt="Area Image" style="width:650px;height:320px">
			</td></tr>
			
			<tr><td>
			<div align="center">CytoplasmMaxIntensity</div>
			<img class="" src='<%="images/histogram/"+currentImage+"CytoplasmMaxIntensity.PNG" %>' alt="Area Image" style="width:650px;height:320px">
			</td></tr>
			
			<tr><td>
			<div align="center">CytoplasmMinIntensity</div>
			<img class="" src='<%="images/histogram/"+currentImage+"CytoplasmMinIntensity.PNG" %>' alt="Area Image" style="width:650px;height:320px">
			</td></tr>
			
			<tr><td>
			<div align="center">Eccentricity</div>
			<img class="" src='<%="images/histogram/"+currentImage+"Eccentricity.PNG" %>' alt="Area Image" style="width:650px;height:320px">
			</td></tr>
			
			<tr><td>
			<div align="center">Perimeter</div>
			<img class="" src='<%="images/histogram/"+currentImage+"Perimeter.PNG" %>' alt="Area Image" style="width:650px;height:320px">
			</td></tr>
			<% 		
			}
		
		%>
		
		</table>
		
		
		
	    
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
