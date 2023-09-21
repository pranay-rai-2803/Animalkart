<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/common_modals.jsp"%>

        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>

                        <div class="card-body">


                            <form action="RegisterServlet" method="post">

                                <h2 class="text-center my-3 " >Sign Up Here</h2>

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input  name="user_email" type="email" class="form-control" id="email" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="Phone Number">Phone Number</label>
                                    <input name="user_phone" type="number" class="form-control" id="Phone Number" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="User Address">User Address</label>
                                    <textarea name="user_address" style="height: 200px" class="form-control" placeholder="Enter your address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn-outline-success">Submit</button> 
                                    <button type="reset"class="btn-outline-warning">Reset</button> 
                                </div>
                            </form>


                        </div>
                    </div>     
                </div>


            </div>
    </body>
</html>
