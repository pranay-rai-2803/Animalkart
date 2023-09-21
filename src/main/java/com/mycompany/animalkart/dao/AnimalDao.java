package com.mycompany.animalkart.dao;

import com.mycompany.animalkart.entities.Animal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AnimalDao {

    private SessionFactory factory;

    public AnimalDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveAnimal(Animal animal) {

        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(animal);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;

        }

        return f;

    }
    
    // get all Animals
    
    public List<Animal> getAllAnimals(){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Animal");
        List<Animal> list = query.list();
        
        return list;
    }
    
    // get all Animals of requested category 
    
    public List<Animal> getAllAnimalsById(int cid){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Animal as a where a.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Animal> list = query.list();
        
        return list;
    }
    
     
}
