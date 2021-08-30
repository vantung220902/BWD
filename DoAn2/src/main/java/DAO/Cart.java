/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Cart {

    private int id;
    private int proid;
    private int quantity;
    private int price;
    private String status;
    private String username;
    private String name;
    private Date createDate;

    public Cart() {
    }

    public Cart(int id, int proid, int quantity, int price, String status, String username, String name, Date createDate) {
        this.id = id;
        this.proid = proid;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.username = username;
        this.name = name;
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreateDate() {
        return DateConver.toString(createDate);
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
}
