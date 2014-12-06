<!doctype html>
<html>
<head>
<script>

function validate(){

	query = document.getElementById("query").value;
	
	if(query == ""){
		alert("Query cannot be empty");
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
            <li class="start selected"><a href="query_text.jsp">Query Text</a></li>
            <li class=""><a href="query_old.jsp">Query Old</a></li>
            <li class=""><a href="window.jsp">Window Histogram</a></li>
        </ul>
    </nav>

	<img height="240" width="950" class="header-image" src="images/image.jpg" alt="Buildings" />

<% if(session.getAttribute("name") == null){
		 
	response.sendRedirect("home.jsp");
}else{
%>
	<p align="right" style="color:blue;">Welcome: <%=session.getAttribute("name").toString() %> </p>
<% 
}
%>

    <div id="body">

		<section id="content">

		<form name="myform" action="Query_text" method="get">
		<table>
		<tr>
		<td><h3 class="text_style">Enter Query: </h3></td>
		<td> <input class="text_query" type="text" name="query" id="query"/> </td>
		<td> <input class="button_query_text" type="submit" value="Query" onclick="return validate()"> </td>
		</tr>
		</table>
	    </form>
	    
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
