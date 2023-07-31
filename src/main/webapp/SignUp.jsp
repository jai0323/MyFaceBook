<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Index page</title>
</head>
<body>

<div class="jumbotron "  style="background-color:blue; color:white" >
<h1>MyFacebook</h1><br/>
<p>MyFacebook helps you connect and share with the people in your life.</p>


</div>

<div class="container">

  <div class="row">
    <div class="col-sm-4">
    </div>
   
    <div class="col-sm-4">
      <h3>SignUp</h3>
       <form action="SignUp.java">
  	    <div class="form-group">
         <label for="emailid">Email:</label>
  			<input type="text" class="form-control" id="emailid" name="emailid">
		</div>
		<div class="form-group">
		  <label for="password">Password:</label>
  			<input type="password" class="form-control" id="password" name="password">
		</div>
		<div class="form-group">
		  <label for="name">Name:</label>
  			<input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		  <label for="pno">Mobile No.:</label>
  			<input type="text" class="form-control" id="pno" name="pno">
		</div>
		<div class="form-group">
		  <label for="gender">Select Gender:</label>
		  <select class="form-control" id="gender" name="gender" size=1>
		    <option>Male</option>
		    <option>Female</option>
		    <option>Others</option>
		  </select>
		</div>
		<div class="form-group">
		  <button type="submit" class="btn btn-primary"> SignUp </button>
		</div>
		
		
      </form>
    </div>
     <div class="col-sm-4">
    </div>
   
  </div>
</div>
</body>
</html>