/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.product;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Tam Dang
 */
public class ProductDTO implements Serializable{
    private String proID;
    private String name;
    private int quantity;
    private String img;
    private String des;
    private float price;
    private Date createdDate;
    private Date updatedDate;
    private String updatedUser;
    private boolean isAvailable;
    private String cateID;
    private String category;
    public ProductDTO() {
    }

    public ProductDTO(String name, int quantity, String img, float price) {
        this.name = name;
        this.quantity = quantity;
        this.img = img;
        this.price = price;
    }
    
    public ProductDTO(String proID, String name, int quantity, String img, float price) {
        this.proID = proID;
        this.name = name;
        this.quantity = quantity;
        this.img = img;
        this.price = price;
    }
   
    public ProductDTO(String proID, String name, int quantity, String img, String des, float price, Date createdDate, Date updatedDate,String updatedUser, boolean isAvailable, String category, String cateID) {
        this.proID = proID;
        this.name = name;
        this.quantity = quantity;
        this.img = img;
        this.des = des;
        this.price = price;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.updatedUser = updatedUser;
        this.isAvailable = isAvailable;
        this.category = category;
        this.cateID = cateID;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUpdatedUser() {
        return updatedUser;
    }

    public void setUpdatedUser(String updatedUser) {
        this.updatedUser = updatedUser;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }
    
}
