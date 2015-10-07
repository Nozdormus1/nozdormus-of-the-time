<%--
  Created by IntelliJ IDEA.
  User: Ноздорму
  Date: 06.10.2015
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <form method="get" action="/servlet">
    <center>
      <table border="1" width="30%" cellpadding="3">
        <thead>
        <tr>
          <th colspan="2">Login Here</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>User Name</td>
          <td><input type="text" name="uname" value="" /></td>
        </tr>
        <tr>
          <td>Password</td>
          <td><input type="password" name="pass" value="" /></td>
        </tr>
        <tr>
          <th colspan="2"><input type="submit" value="Login" /></th>
        </tr>
        </tbody>
      </table>
    </center>
  </form>

  </body>
</html>
