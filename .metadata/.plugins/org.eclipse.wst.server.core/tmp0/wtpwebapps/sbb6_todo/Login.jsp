<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>

<div style="text-align: center;">
  <% Object error = request.getAttribute("loginError"); %>
  <% if (error != null) { %>
      <p style="color: red; background-color: yellow; font-style: italic;"><%= error %></p>
  <% } %>
</div>

<form method="post" action="./LoginServlet">
    <table style="margin: auto; border: 1px solid black; width: 17%;">

      <tr>
        <th>Email</th>
        <td><input type="text" name="email"></td>
      </tr>
      <tr>
        <th>Pass</th>
        <td><input type="password" name="pass"></td>
      </tr>
      <tr>
        <th><input type="submit" name="submit" value="Login"></th>
        <td><input type="reset" name="reset" value="Clear"></td>
      </tr>
    </table>
</form>

<p style="text-align: center;">New User? <a href="Register.html">Sign Up</a></p>  

</body>
</html>
