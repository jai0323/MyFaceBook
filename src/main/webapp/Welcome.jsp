<%@page import="java.util.ArrayList"%>
<%@ page import="com.jai.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyFacebook</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
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
     <li class="nav-item">
      <a class="nav-link " href="#">Link 3</a>
    </li>
  </ul>
 <div style="float: right;margin-left:auto;margin-right:0">
  <form class="form-inline" action="Welcome.jsp" >
    <input class="form-control mr-sm-4" type="text" name="txt_name" placeholder="Search">
    <input class="btn btn-success" type="submit" value="Search">
  </form>
  </div>
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
       
          <table class="table table-dark table-hover"> 
          <thead>
      <tr>
        <th> <h3>Friends</h3> </th>      
      </tr>
    </thead>
    <tbody>
    
      <%
      ArrayList<User> friends=db.getFriends(session.getAttribute("emailid").toString());
      for(User u:friends)
      {
    	  %>
      <tr  >
        <td style="font-size:20px"><a style="color:white" href="ViewProfile.jsp?email=<%=u.getEmail()%>"><%=u.getName() %></a></td>
      </tr>
 
    	  <%
      }
      %>
        </tbody>
  </table>

    </div>
    <div class="col-sm-6">   

      <h3>Whats on your mind <%=db.getName(session.getAttribute("emailid").toString()) %>?</h3>
      <form action="SavePost">
      <textarea rows="5" cols="90" name="txt_post"></textarea>
      <br>
       <input type="file" class="form-control-file border" name="image">
      <input class="btn btn-dark" role="button" type="submit" value="Upload">
     
      </form>
     <%
     DBHandler dba=new DBHandler();
     ArrayList<Wpost> posts=dba.getPosts(session.getAttribute("emailid").toString());
     for(Wpost w:posts)
     {  String name=dba.getName(w.getSender());
    	 %>
    	 <div class="container p-3 my-3 border">
    	 <span >
    	
    	 <h5><%=name %></h5>
    	 <font size="2"><%=w.getDop() %></font>
    	<%if(w.getImg()!=null)
    	{ %>
    	 <span>
    	 <%=w.getImg() %>
    	 </span>
    	 <%
    	 }
    	 %>
    	 <p class="container p-3 my-3 border">
    	 <%=w.getPost() %>
    	 <p>
    	   	 
    	 </span>
    	 </div>
    	 <%
     }
     
     %>
    </div>
    <div class="col-sm-3">
     
          <table class="table table-dark table-hover"> 
          <thead>
      <tr>
        <th> <h3>Requests</h3> </th>      
      </tr>
    </thead>
    <tbody>
       <%
       DBHandler dbh=new DBHandler();
       ArrayList<User> requests=dbh.getRequest(session.getAttribute("emailid").toString());
       for(User u:requests)
       {
    	   %>
    	   	<tr ><td style="font-size:20px;">   <%=u.getName() %></td>
    	   	<td> <a  class="btn btn-light" role="button" href="Accept?fid=<%=u.getEmail().split(":")[0]%>">Accept</a></td>
    	   	</tr>
    	   <%
       }
       %>
        </tbody>
        </table>

       
    </div>
  </div>
</div>

</body>
</html>