<%@ page language="java" import="java.util.*,org.eclipse.jetty.util.ajax.JSON,org.json.JSONArray" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
ArrayList<String> arr = new ArrayList<String>();
ArrayList<String> arr_txt1 = new ArrayList<String>();
ArrayList<String> arr_txt2 = new ArrayList<String>();
ArrayList<String> arr_opr = new ArrayList<String>();
%>

<script>

function validate(){
	
}

function load(){

	document.getElementById('Area_txt1').style.visibility='hidden';
	document.getElementById('Perimeter_txt1').style.visibility='hidden';
	document.getElementById('Eccentricity_txt1').style.visibility='hidden';
	document.getElementById('Circularity_txt1').style.visibility='hidden';
	document.getElementById('MajorAxisLength_txt1').style.visibility='hidden';
	document.getElementById('MinorAxisLength_txt1').style.visibility='hidden';
	document.getElementById('Extent_txt1').style.visibility='hidden';
	document.getElementById('Solidity_txt1').style.visibility='hidden';
	document.getElementById('FSD1_txt1').style.visibility='hidden';
	document.getElementById('FSD2_txt1').style.visibility='hidden';
	document.getElementById('FSD3_txt1').style.visibility='hidden';
	document.getElementById('FSD4_txt1').style.visibility='hidden';
	document.getElementById('FSD5_txt1').style.visibility='hidden';
	document.getElementById('FSD6_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanIntensity_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanMedianDifferenceIntensity_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMaxIntensity_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMinIntensity_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinStdIntensity_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinEntropy_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinEnergy_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinSkewness_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinKurtosis_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinStdGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinEntropyGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinEnergyGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinSkewnessGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinKurtosisGradMag_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinSumCanny_txt1').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanCanny_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMeanIntensity_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMeanMedianDifferenceIntensity_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMaxIntensity_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMinIntensity_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmStdIntensity_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmEntropy_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmEnergy_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmSkewness_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmKurtosis_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMeanGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmStdGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmEntropyGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmEnergyGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmSkewnessGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmKurtosisGradMag_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmSumCanny_txt1').style.visibility='hidden';
	document.getElementById('CytoplasmMeanCanny_txt1').style.visibility='hidden';
	document.getElementById('Boundaries_txt1').style.visibility='hidden';

	document.getElementById('Area_txt2').style.visibility='hidden';
	document.getElementById('Perimeter_txt2').style.visibility='hidden';
	document.getElementById('Eccentricity_txt2').style.visibility='hidden';
	document.getElementById('Circularity_txt2').style.visibility='hidden';
	document.getElementById('MajorAxisLength_txt2').style.visibility='hidden';
	document.getElementById('MinorAxisLength_txt2').style.visibility='hidden';
	document.getElementById('Extent_txt2').style.visibility='hidden';
	document.getElementById('Solidity_txt2').style.visibility='hidden';
	document.getElementById('FSD1_txt2').style.visibility='hidden';
	document.getElementById('FSD2_txt2').style.visibility='hidden';
	document.getElementById('FSD3_txt2').style.visibility='hidden';
	document.getElementById('FSD4_txt2').style.visibility='hidden';
	document.getElementById('FSD5_txt2').style.visibility='hidden';
	document.getElementById('FSD6_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanIntensity_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanMedianDifferenceIntensity_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMaxIntensity_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMinIntensity_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinStdIntensity_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinEntropy_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinEnergy_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinSkewness_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinKurtosis_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinStdGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinEntropyGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinEnergyGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinSkewnessGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinKurtosisGradMag_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinSumCanny_txt2').style.visibility='hidden';
	document.getElementById('HematoxlyinMeanCanny_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMeanIntensity_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMeanMedianDifferenceIntensity_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMaxIntensity_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMinIntensity_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmStdIntensity_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmEntropy_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmEnergy_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmSkewness_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmKurtosis_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMeanGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmStdGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmEntropyGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmEnergyGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmSkewnessGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmKurtosisGradMag_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmSumCanny_txt2').style.visibility='hidden';
	document.getElementById('CytoplasmMeanCanny_txt2').style.visibility='hidden';
	document.getElementById('Boundaries_txt2').style.visibility='hidden';

}

function check_checkbox(parm, textbox1, textbox2){
	
	if(parm.checked){
		document.getElementById(textbox1).disabled=false;
		document.getElementById(textbox1).style.visibility='visible';
	}
	else{
		document.getElementById(textbox1).disabled=true;
		document.getElementById(textbox1).style.visibility='hidden';
	}
}

function check_select(val, textbox_name){
	
	if(val == "range"){
		document.getElementById(textbox_name).disabled=false;
		document.getElementById(textbox_name).style.visibility='visible';
	}
	else{
		document.getElementById(textbox_name).disabled=true;
		document.getElementById(textbox_name).style.visibility='hidden';
	}

}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cure Cancer Portal</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<!--
spigot, a free CSS web template by ZyPOP (zypopwebtemplates.com/)

Download: http://zypopwebtemplates.com/

License: Creative Commons Attribution
//-->
</head>
<body onload="load()">
<div id="container">
  <header>
    	<h1><a href="/">Pathology<span>Application</span></a></h1>
        <h2></h2>
    </header>
    <nav>
    	<ul>
        	<li class=""><a href="home.jsp">Home</a></li>
        	<li class=""><a href="index.jsp">View Features</a></li>
            <li class="start selected"><a href="query.jsp">Query GUI</a></li>
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
	
		<form name="form1" action="process" method="get">
		
		<table>
		<tr>
		<td>Parameter</td>
		<td>Value1</td>
		<td>Value2</td>
		<td>Operator</td>
		</tr>
				
		<%
		arr.add("Area");
		arr.add("Perimeter");
		arr.add("Eccentricity");
		arr.add("Circularity");
		arr.add("MajorAxisLength");
		arr.add("MinorAxisLength");
		arr.add("Extent");
		arr.add("Solidity");
		arr.add("FSD1");
		arr.add("FSD2");
		arr.add("FSD3");
		arr.add("FSD4");
		arr.add("FSD5");
		arr.add("FSD6");
		arr.add("HematoxlyinMeanIntensity");
		arr.add("HematoxlyinMeanMedianDifferenceIntensity");
		arr.add("HematoxlyinMaxIntensity");
		arr.add("HematoxlyinMinIntensity");
		arr.add("HematoxlyinStdIntensity");
		arr.add("HematoxlyinEntropy");
		arr.add("HematoxlyinEnergy");
		arr.add("HematoxlyinSkewness");
		arr.add("HematoxlyinKurtosis");
		arr.add("HematoxlyinMeanGradMag");
		arr.add("HematoxlyinStdGradMag");
		arr.add("HematoxlyinEntropyGradMag");
		arr.add("HematoxlyinEnergyGradMag");
		arr.add("HematoxlyinSkewnessGradMag");
		arr.add("HematoxlyinKurtosisGradMag");
		arr.add("HematoxlyinSumCanny");
		arr.add("HematoxlyinMeanCanny");
		arr.add("CytoplasmMeanIntensity");
		arr.add("CytoplasmMeanMedianDifferenceIntensity");
		arr.add("CytoplasmMaxIntensity");
		arr.add("CytoplasmMinIntensity");
		arr.add("CytoplasmStdIntensity");
		arr.add("CytoplasmEntropy");
		arr.add("CytoplasmEnergy");
		arr.add("CytoplasmSkewness");
		arr.add("CytoplasmKurtosis");
		arr.add("CytoplasmMeanGradMag");
		arr.add("CytoplasmStdGradMag");
		arr.add("CytoplasmEntropyGradMag");
		arr.add("CytoplasmEnergyGradMag");
		arr.add("CytoplasmSkewnessGradMag");
		arr.add("CytoplasmKurtosisGradMag");
		arr.add("CytoplasmSumCanny"); 
		arr.add("CytoplasmMeanCanny");
		arr.add("Boundaries");
		
		for(int i = 0; i < arr.size(); i++){
			
			arr_txt1.add(arr.get(i)+"_txt1");
			arr_txt2.add(arr.get(i)+"_txt2");
			arr_opr.add(arr.get(i)+"_opr");
		}
		
		session.setAttribute("global_col", arr);
		session.setAttribute("global_col_txt1", arr_txt1);
		session.setAttribute("global_col_txt2", arr_txt2);
		session.setAttribute("global_col_opr", arr_opr);
		%>
		
		<%for(int i = 0; i < arr.size(); i++){ %>
		
		<tr>
		<td>
		<input type="checkbox" name='<%=arr.get(i)%>' value='<%=arr.get(i)%>' onChange= "check_checkbox(this, '<%=arr_txt1.get(i)%>', '<%=arr_txt2.get(i)%>')">&nbsp <%=arr.get(i) %>
		</td>
		<td>
		<input style="width:100px" type="text" id='<%=arr_txt1.get(i)%>' name='<%=arr_txt1.get(i)%>' value="" />
		</td>
		<td>
		<input style="width:100px" type="text" id='<%=arr_txt2.get(i)%>' name='<%=arr_txt2.get(i)%>' value="" disabled/>
		</td>
		<td>
		<select class="myselect" name='<%=arr_opr.get(i)%>' onChange= "check_select(this.value, '<%=arr_txt2.get(i)%>')">
  		<option value="greater">Greater</option>
  		<option value="equal">Equal</option>
  		<option value="less">Less</option>
  		<option value="range">Range</option> 
		</select>
		</td>
		</tr>
		
		<%}%>
		
		<tr>
		<td></td>
		<td></td>
		<td><input class="button_feature" type="submit" value="Query" onclick="return validate()"></td>
		<td></td>
		</tr>
		</table>
		
		</form>
		
        </section>
        
        <aside class="sidebar">
	
        </aside>
        
        
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
