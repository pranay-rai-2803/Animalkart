

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login -AnimalKart</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/common_modals.jsp"%>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        
                          <div class="card-header custom-bg text-white"  >
                              <h3> Login Here</h3>
                          </div>
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post" >

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a class="btn btn-primary" href="register.jsp" role="button">Sign Up</a>
                                

                            </form>

                        </div>                    
                    </div>            
                </div>                     
                </div>                     
            </div>
        </div>
    </body>
</html>
