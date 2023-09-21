package com.mycompany.animalkart.servlets;

import com.mycompany.animalkart.dao.AnimalDao;
import com.mycompany.animalkart.dao.CategoryDao;
import com.mycompany.animalkart.entities.Category;
import com.mycompany.animalkart.entities.Animal;
import com.mycompany.animalkart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;

@MultipartConfig
public class AnimalCategoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            // servlet 2
            // add category
            // add animal
            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {

                //add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

                List<Category> categoryByTitle = categoryDao.getCategoryByTitle();

                for (Category c : categoryByTitle) {
                    if (c.getCategoryTitle().equals(title)) {
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("message", title + " is alreday present");
                        response.sendRedirect("admin.jsp");
                        return;
                    }
                }

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                // adding category to database
//                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                out.println("Category Saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", category.getCategoryTitle() + " has been added successfully");
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addanimal")) {

                // add Animal
                String aSpecies = request.getParameter("aSpecies");
                int aQuantity = Integer.parseInt(request.getParameter("aQuantity"));
                double aPrice = Double.parseDouble(request.getParameter("aPrice"));
                double aDiscount = Double.parseDouble(request.getParameter("aDiscount"));
                int aAge = Integer.parseInt(request.getParameter("aAge"));
                String aDescription = request.getParameter("aDescription");
                int aId = Integer.parseInt(request.getParameter("aId"));
                Part part = request.getPart("aPic");

                Animal animal = new Animal();
                animal.setaSpecies(aSpecies);
                animal.setaDesc(aDescription);
                animal.setaPic(part.getSubmittedFileName());
                animal.setaAge(aAge);
                animal.setaPrice(aPrice);
                animal.setaDiscount(aDiscount);
                animal.setaQuantity(aQuantity);

//                String aSpecies, String aDesc, String aPic, int aAge, double aPrice, double aDiscount, int aQuantity,Category category
//                get Category by Id
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category category1 = cDao.getCategoryById(aId);

                animal.setCategory(category1);

                // Animal save
                AnimalDao animalDao = new AnimalDao(FactoryProvider.getFactory());
               animalDao.saveAnimal(animal);
               //out.println("Animal Added");
               
            
                //pic upload
                //find out the path to upload photo
                String path = request.getRealPath("images"+File.separator+"animal"+File.separator+part.getSubmittedFileName());
                System.out.println(path);

                try {
               // uploading Code...
                FileOutputStream fos= new FileOutputStream(path);
                InputStream is = part.getInputStream();

                // reading data
                
                byte []data = new byte[is.available()];
                
                is.read(data);
                
                
                //Writing the data
                
                fos.write(data);
                fos.close();
                
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // Success message
                if(animalDao.saveAnimal(animal) == true){
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", animal.getaSpecies() + " has been added successfully");
                response.sendRedirect("admin.jsp");
                return;
                }                
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
