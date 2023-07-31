

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String emailid,password,name,pno,gender;
        emailid=request.getParameter("emailid");		
        password=request.getParameter("password");
        name=request.getParameter("name");
        pno=request.getParameter("pno");
        gender=request.getParameter("gender");
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
        	String query="insert into user values(?,?,?,?,?)";
        	PreparedStatement st=cn.prepareStatement(query);
        	st.setString(1,emailid);
        	st.setString(2,password);
        	st.setString(3,name);
        	st.setString(4,pno);
        	st.setString(5,gender);
        	st.executeUpdate();
        	cn.close();
        	HttpSession session=request.getSession();
        	session.setAttribute("emailid", emailid);
        	response.sendRedirect("Welcome.jsp");
        }
        catch(Exception e){
        	out.println(e.getMessage());
        }
        
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
