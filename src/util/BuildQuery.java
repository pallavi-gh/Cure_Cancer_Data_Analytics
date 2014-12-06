package util;

import java.util.ArrayList;

import org.apache.hadoop.yarn.server.utils.BuilderUtils;

public class BuildQuery {

	public String  makeQuery(String []parameter, String []value, String []operator){
		
		String query = "";
		
		query = "select * from segmentation_table where ";
		
		
		for(int i = 0; i < parameter.length; i++){
			
			if(parameter[i].equals("None")){
				continue;
			}
			else{
				
				switch(operator[i]){
				
					case "greater":{
						query = query.concat(parameter[i]+" > "+value[i]+ " and ");
						break;
					}
					case "equal":{
						query = query.concat(parameter[i]+" = "+value[i]+" and ");
						break;
					}
					case "less":{
						query = query.concat(parameter[i]+" < "+value[i]+" and ");
						break;
					}	
				}
			}
		} 
	
		
		if(query.substring(query.length() - 4).equals("and ")){
			query = query.substring(0, query.length() - 4);
		}
		
		return query;
	}
	
	public String  makeQuery(ArrayList<String> checkbox_new, ArrayList<String> txt1_new, ArrayList<String> txt2_new, ArrayList<String> opr_new){
		
		String query = "";
		query = "select * from segmentation_table where ";
		
		for(int i = 0; i < opr_new.size(); i++){
			
			switch(opr_new.get(i)){
			
			case "greater":{
				query = query.concat(checkbox_new.get(i)+" > "+txt1_new.get(i)+ " and ");
				break;
			}
			case "equal":{
				query = query.concat(checkbox_new.get(i)+" = "+txt1_new.get(i)+" and ");
				break;
			}
			case "less":{
				query = query.concat(checkbox_new.get(i)+" < "+txt1_new.get(i)+" and ");
				break;
			}
			case "range":{
				query = query.concat(checkbox_new.get(i)+" > "+txt1_new.get(i)+" and "+checkbox_new.get(i)+" < "+txt2_new.get(i));
				break;
			}
		}
		}
		
		if(query.substring(query.length() - 4).equals("and ")){
			query = query.substring(0, query.length() - 4);
		}
		
		return query;
	}
}
