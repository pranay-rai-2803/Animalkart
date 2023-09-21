<%@page import="com.mycompany.animalkart.entities.User"%>
<%
    User user3 = (User)session.getAttribute("current-user");
    if(user3==null){
     
    session.setAttribute("message", "You are not logged in  !!  login first to access checkout page");
    response.sendRedirect("login.jsp");
    return;
    }

%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/common_modals.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card mt-3">
                        <div class="card-body ">
                            <h3 class="text-center">Your selected items</h3>
                            <div class="cart-body mt-3"></div>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-6">
                    <!--form detail's-->
                    <div class="card mt-3">
                        <div class="card-body ">
                            <h3 class="text-center">Your order detail's  </h3>
                            <form action="action">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user3.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName">Name</label>
                                    <input value="<%=user3.getUserName()%>" type="name" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName">Phone Number</label>
                                    <input value="<%=user3.getUserPhone()%>" type="number" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Phone number">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea value="<%=user3.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>                            
                        </div>
                    </div>  
                </div>
            </div>
        </div>       
    </body>
</html>
