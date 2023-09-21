
package com.mycompany.animalkart.dao;

import com.mycompany.animalkart.entities.Category;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory){
        this.factory=factory;
    }
    
    // saving the new category
    public int saveCategory(Category cat){
        
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();        
        return catId;
    } 
    
    
    
    public List<Category> getCategoryByTitle(){
        
        List<Category> categorys = new ArrayList<>();
        
        try {
            
            String query = "from Category ";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            categorys = q.list();
            
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return categorys;
    }
    
    
    public Category getCategoryById(int cId){
        
        
        Category cat = null;
        
        try {
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class,cId);
            session.close();
            
        } catch (Exception e) {
        }
        
        return cat;
    }
    
    

    
    
    
}
