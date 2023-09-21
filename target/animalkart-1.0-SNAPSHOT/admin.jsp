
<%@page import="com.mycompany.animalkart.dao.UserDao"%>
<%@page import="com.mycompany.animalkart.dao.AnimalDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.animalkart.helper.FactoryProvider"%>
<%@page import="com.mycompany.animalkart.dao.CategoryDao"%>
<%@page import="com.mycompany.animalkart.entities.User"%>
<%@page import="com.mycompany.animalkart.entities.Category"%>
<%@page import="com.mycompany.animalkart.entities.Animal"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not Logged in !!  login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            response.sendRedirect("login.jsp");
            session.setAttribute("message", "You are not admin !! You are not admin");
            return;
        }
    }

%>


<% CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

    List<Category> list = categoryDao.getCategoryByTitle();

%>
<% AnimalDao animalDao = new AnimalDao(FactoryProvider.getFactory());

    List<Animal> listAnimal = animalDao.getAllAnimals();

%>
<% UserDao userDao = new UserDao(FactoryProvider.getFactory());

    List<User> userList = userDao.getUserList();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp"%>
        <%@include file="components/common_modals.jsp"%>


    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>         
            </div>


            <!--First row-->
            <div class="row mt-3">
                <!--1st Column-->
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="card-body text-center " >

                            <div class="container">
                                <img style="max-width: 150px;" class ="img-fluid rounded-circle"src="images/team.png" alt="alt"/>

                            </div>
                            <h1><%=userList.size()%></h1>
                            <h1 class="text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--2nd Column-->
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="card-body text-center ">

                            <div class="container">
                                <img style="max-width: 150px;" class ="img-fluid rounded-circle"src="images/options.png" alt="alt"/>

                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-muted">Categories</h1>

                        </div>
                    </div>
                </div>
                <!--3rd Column-->
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="card-body text-center ">
                            <div class="container">
                                <img style="max-width: 150px;" class ="img-fluid rounded-circle"src="images/livestock.png" alt="alt"/>

                            </div>
                            <h1><%=listAnimal.size()%></h1>
                            <h1 class="text-muted">Animals</h1>

                        </div>
                    </div>
                </div>
            </div>

            <!--Second Row-->

            <div class="row mt-3">

                <!--1st Column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-animal-modal">
                        <div class="card-body text-center " >

                            <div class="container">
                                <img style="max-width: 150px;" class ="img-fluid rounded-circle" src="images/plus.png" alt="alt"/>

                            </div>
                            <p class="mt-2">Click here to add new Animal</p>
                            <h1 class="text-muted">Add Animal</h1>
                        </div>
                    </div>
                </div>



                <!--2nd Column-->
                <div class="col-md-6 ">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal" >
                        <div class="card-body text-center "  >

                            <div class="container">
                                <img style="max-width: 150px;" class ="img-fluid rounded-circle" src="images/plus.png" alt="alt"/>

                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Add category Model-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AnimalCategoryServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                            </div>


                            <div class="form-group">
                                <textarea style="height:100px" type="text" class="form-control" name="catDescription" placeholder="Enter category Description" required /></textarea>
                            </div>
                            <div class="container text-center">

                                <button class="btn-outline-success ">Add Category</button>
                                <button type="button" class="btn-outline-success" data-dismiss="modal">Close</button>

                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end category Model-->
        <!--Add Animal Model-->

        <div class="modal fade" id="add-animal-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Animal</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AnimalCategoryServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addanimal">




                            <div class="form-group" >
                                <select name="aId" class="form-control"  id="">
                                    <option selected>Please select one Category</option>
                                    <% for (Category c : list) {

                                    %>

                                    <option value="<%= c.getCategoryId()%>" ><%=c.getCategoryTitle()%> </option>>


                                    <%}%>
                                </select>

                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="aSpecies" placeholder="Specie Name" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="aAge" placeholder="Age" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="aQuantity" placeholder="Quantity" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="aPrice" placeholder="Price" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="aDiscount" placeholder="Discount %" required />
                            </div>                          
                            <div class="form-group">
                                <textarea style="height:100px" type="text" class="form-control" name="aDescription" placeholder="Enter animal Description" required /></textarea>
                            </div>


                            <div class="form-group">
                                <label for="aPic">Select Picture of Animal</label>
                                <br>
                                <input type="file" id="aPic" name="aPic" required/>
                            </div>


                            <div class="container text-center">
                                <button  class="btn-outline-success ">Add Animal</button>
                                <!--                                <button type="button" class="btn-outline-success" data-dismiss="modal">Close</button>-->
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--end Animal Model-->
    </body>
</html>
