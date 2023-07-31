

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String emailid,password;
        emailid=request.getParameter("emailid");		
        password=request.getParameter("password");
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
        	String query="select * from user where emailid=? and password=?";
        	PreparedStatement st=cn.prepareStatement(query);
        	st.setString(1,emailid);
        	st.setString(2,password);
        	ResultSet rs=st.executeQuery();
        	if(rs.next())
        	{
        		
            	HttpSession session=request.getSession();
            	session.setAttribute("emailid", emailid);
            	cn.close();
            	response.sendRedirect("Welcome.jsp");
        	}
        	else
        	{
        		cn.close();
        		response.sendRedirect("index.jsp? message=Invalid");
        	}
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
