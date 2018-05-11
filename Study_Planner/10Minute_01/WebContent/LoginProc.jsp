<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Login.css">
</head>
<body>
<div class="container" id="container">
<div class="w3-panel w3-card-4" style="background-color:white;margin-left: 40px; margin-right:40px;">
<form name="loginForm" action="LoginCheck.jsp" method="post">
      <div class="col">
        <div>
          <h3>Login</h3>
        </div>
        <input id="input" class="w3-input w3-border" type="text" name="id" placeholder="Id" required><br>
        <input id="input" class="w3-input w3-border" type="password" name="pw" placeholder="Password" required><br>
        <input id="input"  type="submit" value="Login" style="margin-bottom:50px;">
      </div>
  </form>
</div>
  
</div>
