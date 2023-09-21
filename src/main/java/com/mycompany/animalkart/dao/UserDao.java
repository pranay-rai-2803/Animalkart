
package com.mycompany.animalkart.dao;

import com.mycompany.animalkart.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password
    
    public User getUserByEmail(String email,String password){
        
        User user = null;
        
        try {
            
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            user = (User)q.uniqueResult();
            
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
    public List<User> getUserList(){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from User");
        List<User> userList = query.list();
        s.close();
        return userList;
    
    
}
    
    
    
}
