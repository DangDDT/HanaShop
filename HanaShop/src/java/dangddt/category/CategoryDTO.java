/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.category;

import java.io.Serializable;

/**
 *
 * @author Tam Dang
 */
public class CategoryDTO implements Serializable{
    private String cateID;
    private String name;

    public CategoryDTO() {
    }

    public CategoryDTO(String cateID, String name) {
        this.cateID = cateID;
        this.name = name;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
