<%-- 
    Document   : error
    Created on : 6 Jun 2023, 11:07:57 pm
    Author     : User
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Error page</title>
    </head>
    <body>
        <center>
            <!-- Display error message -->
            <h1>Error</h1>
            <h2><%=exception.getMessage()%><br/> </h2>
        </center>
    </body>
</html>

