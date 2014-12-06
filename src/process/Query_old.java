package process;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Mark_image;
import util.BuildQuery;
import util.ResultImages;

/**
 * Servlet implementation class Query_old
 */
@WebServlet("/Query_old")
public class Query_old extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Query_old() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    static final int TOTAL_IMAGES = 35;
    static String[] image;
    static String[] image_icon;
    static String[] image_name;
    static ArrayList[] image_array = new ArrayList[35];
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String query_param = "";
		ArrayList rows = new ArrayList();
		BuildQuery build = new BuildQuery();
		QueryHive hive = new QueryHive();
		int[] idx = new int[TOTAL_IMAGES];
		Query_old qold = new Query_old();
		Mark_image mark = new Mark_image();
		ResultImages resultImage = new ResultImages();
 		
		query_param = request.getParameter("query");
		
		if((query_param == null) || query_param.isEmpty()){
			System.out.println("Query is empty");
			return;
		}
		
		System.out.println(query_param);
		
		try {
			rows = hive.execute(query_param);
		} catch (SQLException e) {
			System.out.println("Exception caught");
			e.printStackTrace();
		}
		
		mark.plot(image_array);
		
		idx = resultImage.getResultImage(rows);
		
		qold.getResultImageNames(idx);
		qold.writeRowsToFile(rows);
		
		session.setAttribute("image_row_count", idx);
		session.setAttribute("rows_fetched", rows);
		session.setAttribute("image_name", image_name);
		session.setAttribute("image_icon", image_icon);
		session.setAttribute("image_orig", image);
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("result_old.jsp");
	}

public void writeRowsToFile(ArrayList rows) throws IOException{
		
		File fout = new File("/home/kumar/workspace/hbase_web_new/WebContent/files/rows.txt");

		if(fout.exists()){
			fout.delete();
		}
		fout.createNewFile();
		
		FileOutputStream fos = new FileOutputStream(fout);


		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos)); 
		
		for (int i = 0; i < rows.size(); i++) {
			bw.write(""+rows.get(i));
			bw.newLine();
			bw.newLine();
		}
	 
		bw.close();
		
	}
	
	public void getResultImageNames(int[] idx){
		
			image = new String[TOTAL_IMAGES];
			image_icon = new String[TOTAL_IMAGES];
			image_name = new String[TOTAL_IMAGES];
		
			for(int i = 0; i < TOTAL_IMAGES; i++){
				
				image[i] = "";
				image_icon[i] = "";
				image_name[i] = "";
			}
			
			for(int i = 0; i < TOTAL_IMAGES; i++){
			
			if(idx[i] != 0){
				
				image[i] = "path-image-";
				image_icon[i] = "path-image-";
				image_name[i] = "path-image-";
				
				if(i < 10){
					image[i] = image[i].concat("10"+i);
					image_icon[i] = image_icon[i].concat("10"+i);
					image_name[i] = image_name[i].concat("10"+i);
				}
				else{
					image[i] = image[i].concat("1"+i);
					image_icon[i] = image_icon[i].concat("1"+i);
					image_name[i] = image_name[i].concat("1"+i);
				}
			}
			
			if(idx[i] != 0){
				image[i] = image[i].concat(".jpg");
				image_icon[i] = image_icon[i].concat(".icon.jpg");
			}
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
