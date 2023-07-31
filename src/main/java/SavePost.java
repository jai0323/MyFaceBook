

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jai.DBHandler;

import com.jai.DBHandler;

/**
 * Servlet implementation class SavePost
 */
@WebServlet("/SavePost")
public class SavePost extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	          DBHandler db=new DBHandler();
	          HttpSession session=request.getSession();
	          db.savePost(session.getAttribute("emailid").toString(), request.getParameter("txt_post"));
	          response.sendRedirect("Welcome.jsp");
		
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
