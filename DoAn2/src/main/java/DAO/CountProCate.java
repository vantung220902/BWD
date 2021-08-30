/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author admin
 */
public class CountProCate {
    private int sizePro;
    private String name;

    public CountProCate() {
    }

    public CountProCate(int sizePro, String name) {
        this.sizePro = sizePro;
        this.name = name;
    }

    public int getSizePro() {
        return sizePro;
    }

    public void setSizePro(int sizePro) {
        this.sizePro = sizePro;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
