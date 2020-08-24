<%@page import="logic.bean.LibrBean"%>
<%@page import="logic.bean.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stud.io</title>
   <link href="css/style.css" type="text/css" rel="stylesheet">
   <link href="css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>
 <!-- navbar -->
    <div class="container">
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Biblioteca <%out.println(((LibrBean) session.getAttribute("libraryBean")).getName()); %></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto"> <!-- "ml-auto" consente di allineare item a destra-->
         
            <li class="nav-item active">
            <form action="UpdateSeatsServlet" name="UpdateSeatsForm" method="GET">
              <a><input class="btn btn-secondary" type="submit" role="button" value="Update seats"></a>
              </form>
            </li>
            <li class="nav-item">
              <a class="btn btn-secondary" href="librarianTimetable.html">Time table</a>
            </li>
            <li class="nav-item">
              <a class="btn btn-secondary" href="librarianNoticeboard.html">Noticeboard</a>
            </li>
            <li class="nav-item">
             <form action="SuperviseServlet" name="SuperviseForm" method="GET">
              <a><input class="btn btn-success mx-auto" type="submit" role="button" value="Recent students"></a>
              </form>
            </li>
            <li class="nav-item">
              <a class="btn btn-secondary" href="librarianStatistics.html">Statistics</a>
            </li>
            <li class="nav-item">
              <a class="btn btn-secondary" href="librarianSettings.html">Settings</a>
            </li>
            <li class="nav-item">
              <a class="btn btn-secondary" href="index.html">Log out</a>
            </li>
           </ul>
          </div>
        </nav>
     </div>
    <!-- END navbar -->
    <h1 align="center"><br><br>Info student</h1>
    <form action="${pageContext.request.contextPath}/SuperviseServlet" name="InfoForm" method="POST">
     
      <%StudentBean studentBean = (StudentBean) session.getAttribute("studentBean"); %>
      <div class="container">
       <div class="form-group" align="center">
       <br>
        <h2>Name: <%out.println(studentBean.getName()); %></h2>
       </div>
       <div class="form-group" align="center">
        <h2>Surname: <%out.println(studentBean.getSurname()); %></h2>
       </div>
       <div class="form-group" align="center">
        <h2>Username: <%out.println(studentBean.getUsername()); %></h2>
       </div>
      <div class="form-group" align="center">
        <h2>Email: <%out.println(studentBean.getMail()); %></h2>
       </div>
       <div class="form-group" align="center">
        <h2>Phone: <%out.println(studentBean.getPhone()); %></h2>
       </div>
       <div class="form-group" align="center">
        <h2><%if(studentBean.isBanned()) { out.println("Utente bannato");}
		else { out.println("Utente attivo"); } %></h2>
       </div>
       <div class="form-group" align="center">
       <br>
        <button class="btn btn-outline-success mx-auto" role="button" type="submit"  name ="Report Account" style="width: 300px; height: 80px;"> <font style="verdana" size = "6" > Report account</font></button>		    
       </div>
      </div>
     </form>
    
    
</body>
</html>