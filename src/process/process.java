package process;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
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
import util.BuildQuery;
import util.ResultImages;
import process.QueryHive;

/**
 * Servlet implementation class process
 */
@WebServlet("/process")
public class process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public process() {
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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		ArrayList<String> checkbox_old = new ArrayList<String>(); 
		ArrayList<String> txt1_old = new ArrayList<String>();
		ArrayList<String> txt2_old = new ArrayList<String>();
		ArrayList<String> opr_old = new ArrayList<String>();
		
		ArrayList<String> checkbox_new = new ArrayList<String>(); 
		ArrayList<String> txt1_new = new ArrayList<String>();
		ArrayList<String> txt2_new = new ArrayList<String>();
		ArrayList<String> opr_new = new ArrayList<String>();
		
		checkbox_old = (ArrayList)session.getAttribute("global_col");
		txt1_old = (ArrayList)session.getAttribute("global_col_txt1");
		txt2_old = (ArrayList)session.getAttribute("global_col_txt2");
		opr_old = (ArrayList)session.getAttribute("global_col_opr");
		
		for(int i = 0; i < checkbox_old.size(); i++){
			
			if(request.getParameter(checkbox_old.get(i)) == null){
				continue;
			}
			else if(request.getParameter(checkbox_old.get(i)).equals(checkbox_old.get(i))){
			
				checkbox_new.add(request.getParameter(checkbox_old.get(i)));
				
				if(request.getParameter(opr_old.get(i)).equals("range")){
					txt1_new.add(request.getParameter(txt1_old.get(i)));
					txt2_new.add(request.getParameter(txt2_old.get(i)));
					opr_new.add(request.getParameter(opr_old.get(i)));
				}
				else{
					txt1_new.add(request.getParameter(txt1_old.get(i)));
					opr_new.add(request.getParameter(opr_old.get(i)));
					txt2_new.add("None");
				}
			}
		}
		
		
		String query = "";
		ArrayList rows = new ArrayList();
		BuildQuery build = new BuildQuery();
		QueryHive hive = new QueryHive();
		int[] idx = new int[TOTAL_IMAGES];
		process pro = new process();
		ResultImages resultImage = new ResultImages();
 		
		query = build.makeQuery(checkbox_new, txt1_new, txt2_new, opr_new);
		System.out.println(query);
		try {
			rows = hive.execute(query);
		} catch (SQLException e) {
			System.out.println("Exception caught");
			e.printStackTrace();
		}
		
		
		idx = resultImage.getResultImage(rows);
		
		pro.getResultImageNames(idx);
		pro.writeRowsToFile(rows);
		
		session.setAttribute("image_row_count", idx);
		session.setAttribute("rows_fetched", rows);
		session.setAttribute("image_name", image_name);
		session.setAttribute("image_icon", image_icon);
		session.setAttribute("image_orig", image);
		response.sendRedirect("result.jsp");
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
