

<%@page import="com.mycompany.animalkart.helper.Helper"%>
<%@page import="com.mycompany.animalkart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.animalkart.entities.Animal"%>
<%@page import="com.mycompany.animalkart.entities.Category"%>
<%@page import="com.mycompany.animalkart.helper.FactoryProvider"%>
<%@page import="com.mycompany.animalkart.dao.AnimalDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp"%>
        



    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%
                    String cat = request.getParameter("category");
                    //                out.println(cat);

                    AnimalDao dao = new AnimalDao(FactoryProvider.getFactory());
                    List<Animal> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllAnimals();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllAnimalsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> categoryList = cdao.getCategoryByTitle();

                %>


                <!-- show categories--> 
                <div class="col-md-2">


                    <div class="list-group">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Animal Categories 
                        </a>

                        <%for (Category c : categoryList) {
                        %>
                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() + "<br>"%></a>
                        <%
                            }

                        %>
                    </div>

                </div>
                <!-- show animals--> 
                <div class="col-md-10">

                    <!--row-->
                    <div class="row mt-4">

                        <!--col -12--> 
                        <div class="col-md-12">
                            <div class="card-columns">

                                <!--traversing animals-->
                                <%                                for (Animal a : list) {


                                %>
                                <!--Aniaml card-->
                                <div class="card animal-card">
                                    <div class="container text-center">
                                        <img class="card-img-top mt-2" style="max-height: 100%; max-width: 100%; width: auto;" src="images/animal/<%=a.getaPic()%>" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%=a.getaSpecies()%></h5>
                                        <p class="card-text"><%=Helper.get10Words(a.getaDesc())%></p> 
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white"onclick="add_to_cart(<%=a.getaId()%>,'<%=a.getaSpecies()%>'
                                            ,<%=a.dicountPrice(a.getaPrice())%>)" maxFractionDigits="2">Add to cart</button>
                                        <button class="btn btn-outline-primary">&#8377; <%=a.dicountPrice(a.getaPrice())%> /-
                                            <span class="text-secondary discount-lable">&#8377; <%=a.getaPrice()%> Off <%=a.getaDiscount()%> %  </span></button>
                                    </div>
                                </div>




                                <%}
                                    if (list.size() == 0) {%>
                                <h1>Sorry No animals available for this category</h1>
                                <%}

                                %>

                            </div>                                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                <%@include file="components/common_modals.jsp"%>
                                
    </body>
</html>
