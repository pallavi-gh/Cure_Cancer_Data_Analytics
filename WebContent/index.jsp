<!doctype html>
<html>
<head>

<script>


function jump(val, e){
    
	 if(e.keyCode === 13){
		 pagination(val);
     }
	
    return false;
}

function pagination(current_page){
	
	//alert(current_page);
	document.location.href="index.jsp?current_page="+current_page;
}

function extractFeatures(image_name){

	//alert(image_name);
	document.location.href="processFeature?rowid="+image_name;
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
        	<li class="start selected"><a href="index.jsp">View Features</a></li>
            <li class=""><a href="query.jsp">Query GUI</a></li>
            <li class=""><a href="query_text.jsp">Query Text</a></li>
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

	    <article>
			
			<%
			//Get current page
			int current_page = 1;
			try{
				current_page = Integer.parseInt(request.getParameter("current_page"));
			}
			catch(Exception e){
				out.println("cannot parse current page");
			}
			
			if(current_page < 1){
				current_page = 1;
			}
			%>	
			
			<h2>Cure Cancer Image Database</h2>
			
			<table>
			<tr>
			<td><h3>Page# <%=current_page %> </h3></td>
			<td align="right"><h3> Jump to page:  <input class="text_style" width="50" type="text" name="jump" id="jump" onkeypress="jump(this.value ,event)"/> </h3></td>
			 </tr>
			</table> 
			
			<table>
			<tr>
			<td>Input Image</td>
			<td>Physician Marked Image</td>
			<td>Output Image</td>
			<td>Features</td>
			</tr>
			<%	
			//Input image
			String in_name_icon = "";
			String in_name_orig = "";
			String in_name_short = "";
			
			//Physician marked image
			String marked = "";
			String marked_short = "";
			String marked_orig = "";
			
			//Output Image
			String out_name_icon = "";
			String out_name_orig = "";
			String out_name_short = "";
			
			int temp = 0;
			
			for(int i = ((current_page*10)-10); i <= (current_page*10); i++){
				
				temp = i+100;
				
				in_name_icon = "images/input/path-image-";
				in_name_orig = "images/input/path-image-";
				in_name_short = "path-image-";
				
				marked = "images/marked/fastgrowcut_";
				marked_short = "fastgrowcut_";
				marked_orig = "images/marked/fastgrowcut_";
				
				out_name_icon = "images/output/path-image-";
				out_name_orig = "images/output/path-image-";
				out_name_short = "path-image-";
				
				in_name_icon = in_name_icon.concat(""+temp);
				in_name_orig = in_name_orig.concat(""+temp);
				in_name_short = in_name_short.concat(""+temp);
				
				marked = marked.concat(""+(i+1));
				marked_short = marked_short.concat(""+(i+1));
				marked_orig = marked_orig.concat(""+(i+1));
					
				out_name_icon = out_name_icon.concat(""+temp);
				out_name_orig = out_name_orig.concat(""+temp);
				out_name_short = out_name_short.concat(""+temp);
				
				
				
				in_name_icon = in_name_icon.concat("-0-icon.jpg");
				in_name_orig = in_name_orig.concat("-0.jpg");
				
				marked = marked.concat(".icon.jpg");
				marked_orig = marked_orig.concat(".jpg");
				
				out_name_icon = out_name_icon.concat(".icon.jpg");
				out_name_orig = out_name_orig.concat(".jpg");
				
				%>
			
			<tr>
			<td>
				<div><a href='<%=in_name_orig %>'><%=in_name_short%></a></div>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
			<input class="button_feature" type="button" value="Features" onclick="extractFeatures('<%=out_name_short%>')"/>
			</td>
			</tr>
			
			<%} %>
			</table>	
		
		</article>
		
		 <div align = "right">
		 	<%if(current_page != 1) {%>
		 	<input class="button_page_prev_next" type="button" name="page1" value='Previous' onclick="pagination('<%=current_page-1%>')"/>
		 	<%}%>
		 	<%if(current_page != 1){%>
		    	<input class="button_page" type="button" name="page1" value='1' onclick="pagination('1')"/>
		    <%}%>
        <%for(int i = current_page; i < current_page+6; i++){ %>
        	<input class="button_page" type="button" name="page"+'<%=i%>' value='<%=i%>' onclick="pagination('<%=i%>')"/>
        <%} %>
        <input class="button_page_prev_next" type="button" name="page1" value='Next' onclick="pagination('<%=current_page+1%>')"/>
       	 </div>
		
        </section>
        
        <!-- <aside class="sidebar">
	
            <ul>	
               <li>
                <h4>Option 1</h4>
                <input type="checkbox" name="chk_group1" value="option1" onclick="test();" />Value 1<br/>
				<input type="checkbox" name="chk_group1" value="option2" />Value 2<br />
				<input type="checkbox" name="chk_group1" value="option3" />Value 3<br />
                </li>
                    </ul>
                </li>
            </ul>

            <ul>	
               <li>
                <h4>Option 2</h4>
                <input type="checkbox" name="chk_group2" value="option1" onclick="test(this)" />Value 1<br/>
				<input type="checkbox" name="chk_group2" value="option2" />Value 2<br />
				<input type="checkbox" name="chk_group2" value="option3" />Value 3<br />
                </li>
                    </ul>
                </li>
            </ul>
		
        </aside> -->
        
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
