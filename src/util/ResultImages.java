package util;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class ResultImages {

	public int[] getResultImage(ArrayList row){
		
		final int TOTAL_IMAGES = 35;
		String subStr = "", temp = "";
		int[] idx = new int[TOTAL_IMAGES];
		
		for(int i = 0 ; i < row.size(); i++){
			temp = row.get(i).toString();
			subStr = temp.substring(0, temp.indexOf(':'));
			subStr = subStr.substring(5, subStr.indexOf('_'));
			if(Integer.parseInt(subStr) < 35){
				idx[Integer.parseInt(subStr)]++;
			}
		}
		
		return idx;
	}
	
	public static void main(String[] args){
		
		
		ArrayList arr = new ArrayList();
		
		arr.add("image0_1000:sam:dam:");
		arr.add("image1_10:sam:dam:");
		arr.add("image20_100:sam:dam:");
		arr.add("image30_1:sam:dam:");
		arr.add("image1_100:sam:dam:");
		
		ResultImages obj = new ResultImages();
		obj.getResultImage(arr);
	}
}
