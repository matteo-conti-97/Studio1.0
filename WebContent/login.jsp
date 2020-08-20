<%@ page import="logic.control.LoginController" %>
<%@ page import="logic.control.StudentMainPageController" %>
<%@ page import="logic.control.LibraryMainPageController" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stud.io</title>
    <link href="style.css" type="text/css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
</head>
  <body>

    <!-- navbar -->
    <div class="container">
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.html">Stud.io</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="login.html">Login <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="signIn.html">Sign in</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <!-- END navbar -->

    <div class="container">
      <h1 align=center><br><br>LOGIN</h1>
      <h3 align=center>Please insert username and password:</h3>

      <!-- Login form -->
      <div class="container">
      
      
      
      
      
 
      <form action="login.jsp" name="logForm" method="POST">
        <div class="form-group">
          <label for="exampleInputEmail1">Email</label>
          <input class="form-control" id="emailLogin" name="emailLogin" type="text" 
               value="" 
               aria-describedby="emailHelp">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input class="form-control" id="passwordLogin" name="passwordLogin" type="password" 
               value="">
        </div>
        <input class="btn btn-success mx-auto" role="button" name="loginBtn" type="submit"
               id="loginBtn" value="Login">
      </form>
      
      
      
      
      
      
      
      </div>
      <!-- END Login form -->

      <h3 align=center><br><br>If you don't have an account, sign in!</h3>
      <p class="text-center">
        <a class="btn btn-success my-2 my-sm-0" href="signIn_selectUser.html" role="button">Sign in</a>
      </p>
    </div>
    <!-- jQuery e plugin JavaScript  -->
   <script src="http://code.jquery.com/jquery.js"></script>
   <script src="js/bootstrap.min.js"></script>

  </body>
</html>



<%

  if(request.getParameter("loginBtn") != null) { 
    
    try {
    	LoginController loginController = new LoginController();
      if (loginController.validateUser(request.getParameter("emailLogin"), request.getParameter("passwordLogin")) == 's')
      {  
    	  StudentMainPageController.getStudentMainPageController()
			.setStudInfo(loginController.getStudent());
	StudentMainPageController.getStudentMainPageController()
			.setStudInfoB(loginController.getStudentBean());
	
	System.out.println(StudentMainPageController.getStudentMainPageController().getStudInfo().getMail());
      %> <jsp:forward page="studentHome.jsp"/> <% }
     
      else if (loginController.validateUser(request.getParameter("emailLogin"), request.getParameter("passwordLogin")) == 'l')
      { 
    	  LibraryMainPageController.getLibraryMainPageController()
			.setLibrInfo(loginController.getLibrary());
	LibraryMainPageController.getLibraryMainPageController()
			.setLibrInfoB(loginController.getLibrBean());
      %> <jsp:forward page="librarianHome.jsp"/> <% }
      }
    catch (Exception e) {
      e.printStackTrace();
    }
    
  }

%>