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
public class Account {

    private String username;
    private String password;
    private String fullname;
    private int age;
    private Date birthday;
    private boolean gender;
    private String phone;
    private String email;
    private String address;
    private String privileges;
    private Date registerDate;
    public Account() {
    }

    public Account(String username, String password, String fullname, int age,
            Date birthday, boolean gender, String phone, String email, String address,String privileges,Date registerDate) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.age = age;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.privileges=privileges;
        this.registerDate=registerDate;
    }

  

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBirthday() {
        return DateConver.toString(birthday);
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender?"Nam":"Nu";
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPrivileges() {
        return privileges;
    }

    public void setPrivileges(String privileges) {
        this.privileges = privileges;
    }

    public String getRegisterDate() {
        return DateConver.toString(birthday);
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

}
