package process;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ImageRowMapper;
/**
 * Servlet implementation class processFeature
 */
@WebServlet("/processFeature")
public class processFeature extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public processFeature() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		HistogramBuild hist = new HistogramBuild();
		String str = request.getParameter("rowid");
		String mappedRow = "";
		
		//Get Mapped Row
		ImageRowMapper obj = new ImageRowMapper();		
		mappedRow = obj.mapRow(str);
		
		//TODO check for dynamic refresh of directory
		hist.getHistogram(mappedRow);
		
		session.setAttribute("current_image", mappedRow);
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		response.sendRedirect("histogram.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
