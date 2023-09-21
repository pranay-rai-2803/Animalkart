<%@page import="com.mycompany.animalkart.entities.User"%>
<%
    User user2 = (User)session.getAttribute("current-user");
    if(user2==null){
    
    
    session.setAttribute("message", "You are not logged in  !!  login first");
    response.sendRedirect("login.jsp");
    return;
    }else{
    
        if(user2.getUserType().equals("admin")){
        response.sendRedirect("login.jsp");
        session.setAttribute("message", "You are not a normal user !! You are not normal user");
        return;
    } 
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_modals.jsp"%>
       <%@include file="components/common_css_js.jsp"%>
        
        
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <h1>Normal Panel Page !!</h1>
    </body>
</html>
