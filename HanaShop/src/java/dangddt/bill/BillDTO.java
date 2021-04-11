/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.bill;

import java.sql.Date;

/**
 *
 * @author Tam Dang
 */
public class BillDTO {
    private int billID;
    private String userID;
    private String fullname;
    private String address;
    private String phone;
    private float totalPrice;
    private Date date_checkOut;

    public BillDTO() {
    }
    
    public BillDTO(String userID, String fullname, String address, String phone, float totalPrice, Date date_checkOut) {
        this.userID = userID;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.totalPrice = totalPrice;
        this.date_checkOut = date_checkOut;
    }
    
    public BillDTO(String userID, String fullname, String address, String phone, float totalPrice) {
        this.userID = userID;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.totalPrice = totalPrice;
    }

    public BillDTO(int billID, String userID, String fullname, String address, String phone, float totalPrice, Date date_checkOut) {
        this.billID = billID;
        this.userID = userID;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.totalPrice = totalPrice;
        this.date_checkOut = date_checkOut;
    }
    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDate_checkOut() {
        return date_checkOut;
    }

    public void setDate_checkOut(Date date_checkOut) {
        this.date_checkOut = date_checkOut;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }
    
}
