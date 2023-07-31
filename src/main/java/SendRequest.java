

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jai.DBHandler;

/**
 * Servlet implementation class SendRequest
 */
@WebServlet("/SendRequest")
public class SendRequest extends HttpServlet  {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String receiver=request.getParameter("email");
	 HttpSession session=request.getSession();
	 String sender=session.getAttribute("emailid").toString();
	
	 
	 DBHandler db=new DBHandler();
	 db.sendRequest(receiver,sender);
	 
	 response.sendRedirect("Welcome.jsp");
	  
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
