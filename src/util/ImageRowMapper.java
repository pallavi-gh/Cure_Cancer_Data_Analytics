package util;

public class ImageRowMapper {
	
	public String mapRow(String str){
		
		String mappedRow = "image";
		int imgNo = 0;
		
		imgNo = Integer.parseInt(str.substring(11)) - 100;
		mappedRow = mappedRow.concat(""+imgNo);
	
		return mappedRow;
	}
}
