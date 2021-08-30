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
public class News {
    private int id;
    private String name;
    private String description;
    private Date dataSubmit;
    private CategoryNews cateid;
    private String link;
    private String img;

    public News() {
    }

    public News(int id, String name, String description, Date dataSubmit, CategoryNews cateid, String link, String img) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.dataSubmit = dataSubmit;
        this.cateid = cateid;
        this.link = link;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDataSubmit() {
        return DateConver.toString(dataSubmit);
    }

    public void setDataSubmit(Date dataSubmit) {
        this.dataSubmit = dataSubmit;
    }

    public CategoryNews getCateid() {
        return cateid;
    }

    public void setCateid(CategoryNews cateid) {
        this.cateid = cateid;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
