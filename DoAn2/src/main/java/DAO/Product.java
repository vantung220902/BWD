
package DAO;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Product {
    private int id;
    private String name;
    private String imgFont;
    private String imgBehind;
    private int priceOld;
    private int priceNew;
    private Date mannufactureDate;
    private Categories cateID;
    private String description;
    private int quantity;
    private int rerentageDiscoint;
    private int cateidSame;
    private String size;
    private String color;
    public Product() {
    }

    public Product(int id, String name, String imgFont, String imgBehind,
  int priceOld, int priceNew, Date mannufactureDate, Categories cateID,
  String description, int quantity, int rerentageDiscoint,String size,String color) {
        this.id = id;
        this.name = name;
        this.imgFont = imgFont;
        this.imgBehind = imgBehind;
        this.priceOld = priceOld;
        this.priceNew = priceNew;
        this.mannufactureDate = mannufactureDate;
        this.cateID = cateID;
        this.description = description;
        this.quantity = quantity;
        this.rerentageDiscoint = rerentageDiscoint;
        this.size  = size;
        this.color = color;
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

    public String getImgFont() {
        return imgFont;
    }

    public void setImgFont(String imgFont) {
        this.imgFont = imgFont;
    }

    public String getImgBehind() {
        return imgBehind;
    }

    public void setImgBehind(String imgBehind) {
        this.imgBehind = imgBehind;
    }

    public int getPriceOld() {
        return priceOld;
    }

    public void setPriceOld(int priceOld) {
        this.priceOld = priceOld;
    }

    public int getPriceNew() {
        return priceNew;
    }

    public void setPriceNew(int priceNew) {
        this.priceNew = priceNew;
    }



    public String getMannufactureDate() {
        return DateConver.toString(mannufactureDate);
    }

    public void setMannufactureDate(Date mannufactureDate) {
        this.mannufactureDate = mannufactureDate;
    }

    public Categories getCateID() {
        return cateID;
    }

    public void setCateID(Categories cateID) {
        this.cateID = cateID;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getRerentageDiscoint() {
        return rerentageDiscoint;
    }

    public void setRerentageDiscoint(int rerentageDiscoint) {
        this.rerentageDiscoint = rerentageDiscoint;
    }

    public int getCateidSame() {
        return cateidSame;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setCateidSame(int cateidSame) {
        this.cateidSame = cateidSame;
    }


}