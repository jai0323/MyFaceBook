<%@page import="com.jai.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>Profile</title>
</head>
<body>

 <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">MyFacebook</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>
    <li class="nav-item">
      <a class="nav-link " href="#">Link 3</a>
    </li>
  </ul>
 
  <form class="form-inline" action="Welcome.jsp" >
    <input class="form-control mr-sm-4" type="text" name="txt_name" placeholder="Search">
    <input class="btn btn-success" type="submit" value="Search">
  </form>
  <%
  DBHandler db=new DBHandler();
  %>
 
</nav>

  
    <%
    if(request.getParameter("txt_name")!=null && request.getParameter("txt_name").length()!=0)
    {
    	
     	ArrayList<User> users=db.getUser(request.getParameter("txt_name"));
     	if(users!=null && users.size()!=0)
     	{
    	%><div class="container-fluid">

      <table class="table table-striped" style="font-size:20px;">
    <tbody>
       	<%
     	for(User u:users)
    	{ 
     	%> <tr >
           <td> <%=u.getName()%></td>
           <td><%=u.getEmail()%></td>
            <td><a  class="btn btn-dark" role="button" href="SendRequest?email=<%=u.getEmail()%>">Send Request</a></td>
    		</tr>
          <%
    	}
    	%> 
    	 </tbody>
 		 </table>
    	</div>
    <%
    }
    }
   %>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3">
      <h3>Profile Picture</h3>
      <img src="images/dpicon.png" class="rounded" alt="Cinque Terre">
    </div>
    <div class="col-sm-6">
      <h3>Profile</h3>
      <%
         DBHandler dba=new DBHandler();
         User u=dba.getprofile(request.getParameter("email"));   
      %>
         <div class="container-fluid">
         Name:<br><%=u.getName() %><br>Email:<br><%=u.getEmail() %>
         <hr>
         
         </div>
      
    </div>
   
  </div>
</div>
</body>
</html>