
package com.mycompany.animalkart.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Animal {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int aId;
    private String aSpecies;
    private String aDesc;
    private String aPic;
    private int aAge;
    private double aPrice;
    private double aDiscount;
    private int aQuantity;
    
    @ManyToOne
    private Category category;

    public Animal() {
    }

    public Animal(String aSpecies, String aDesc, String aPic, int aAge, double aPrice, double aDiscount, int aQuantity,Category category) {
        this.aSpecies = aSpecies;
        this.aDesc = aDesc;
        this.aPic = aPic;
        this.aAge = aAge;
        this.aPrice = aPrice;
        this.aDiscount = aDiscount;
        this.aQuantity = aQuantity;
        this.category = category;
    }

    public int getaId() {
        return aId;
    }

    public String getaSpecies() {
        return aSpecies;
    }

    public String getaDesc() {
        return aDesc;
    }

    public String getaPic() {
        return aPic;
    }

    public int getaAge() {
        return aAge;
    }

    public double getaPrice() {
        return aPrice;
    }

    public double getaDiscount() {
        return aDiscount;
    }

    public int getaQuantity() {
        return aQuantity;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public void setaSpecies(String aSpecies) {
        this.aSpecies = aSpecies;
    }

    public void setaDesc(String aDesc) {
        this.aDesc = aDesc;
    }

    public void setaPic(String aPic) {
        this.aPic = aPic;
    }

    public void setaAge(int aAge) {
        this.aAge = aAge;
    }

    public void setaPrice(double aPrice) {
        this.aPrice = aPrice;
    }

    public void setaDiscount(double aDiscount) {
        this.aDiscount = aDiscount;
    }

    public void setaQuantity(int aQuantity) {
        this.aQuantity = aQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    

    @Override
    public String toString() {
        return "Animal{" + "aId=" + aId + ", aSpecies=" + aSpecies + ", aDesc=" + aDesc + ", aPic=" + aPic + ", aAge=" + aAge + ", aPrice=" + aPrice + ", aDiscount=" + aDiscount + ", aQuantity=" + aQuantity + '}';
    }
    
    // calculating price after discount
    
    public double dicountPrice(double Price){
        double P ;
        P = aPrice - (aPrice * (aDiscount/100));
        return P;
        
    }
    
    
    
   
}
