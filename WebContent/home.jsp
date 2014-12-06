<!doctype html>
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
        	<li class="start selected"><a href="home.jsp">Home</a></li>
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

		<form name="form1" action="initSession" method="get">
		
		<table>
		<tr>
		<td>Full Name</td>
		<td><input type="text" id="name" name="name" value=""/></td>
		</tr>
		<tr>
		<td>ID</td>
		<td><input type="text" id="id" name="id" value=""/></td>
		</tr>
		<tr>
		<td>Cancer Type</td>
		<td>
		<select class="myselect" name="type">
		<option value="none">None</option> 
  		<option value="lung">Lung</option>
  		<option value="pancreatic">Pancreatic</option>
  		<option value="breast">Breast</option>
  		<option value="bladder">Bladder</option>
  		<option value="prostate">Prostate</option> 
		</select>
		</td>
		</tr>
		<tr>
	
		<td align="center" colspan="2"><input type="submit" value="Register" onclick="return validate()"></td>
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
