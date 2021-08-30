/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import JDBC.DatabaseHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AccountDAO {

    public List<Account> getAll() {
        Connection conn = null;
        PreparedStatement sttm = null;
        Account user = null;
        List<Account> ls = new ArrayList<Account>();
        ResultSet rs;
        try {
            String sSQL = "select * from Account";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            rs = sttm.executeQuery();
            while (rs.next()) {
                user = new Account();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setFullname(rs.getString(3));
                user.setAge(rs.getInt(4));
                user.setBirthday(DateConver.todate(rs.getString(5)));
                user.setGender(rs.getBoolean(6));
                user.setPhone(rs.getString(7));
                user.setEmail(rs.getString(8));
                user.setAddress(rs.getString(9));
                user.setPrivileges(rs.getString(10));
                ls.add(user);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }
    public int CountAcc(){
      Connection conn = null;
      PreparedStatement stmm = null;
        try {
            String sSQL="select count(username) from Account";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            try {
                conn.close();stmm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
    
    
    
    
    public int insert(Account ac) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL  = "set dateformat dmy;\n" +
"insert into Account(username,password,fullname,age,birthday,gender,phone,email,address,[Privileges],RegisterDate) values(?,?,?,?,?,?,?,?,?,?,?)";
            conn = DatabaseHelper.getConnection();
            sttm=conn.prepareStatement(sSQL);
            sttm.setString(1, ac.getUsername());
            sttm.setString(2, ac.getPassword());
            sttm.setString(3, ac.getFullname());
            sttm.setInt(4, ac.getAge());
            sttm.setString(5, ac.getBirthday());
            sttm.setBoolean(6, ac.isGender());
            sttm.setString(7, ac.getPhone());
            sttm.setString(8, ac.getEmail());
            sttm.setString(9, ac.getAddress());
            sttm.setString(10, ac.getPrivileges());
            sttm.setString(11, ac.getRegisterDate());
            if (sttm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return -1;
    }
     public int update(Account ac) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "update Account set password=?,fullname=?,age=?,birthday=?,gender=?,phone=?,email=?,address=?,RegisterDate=? where username=? ";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(10, ac.getUsername());
            sttm.setString(1, ac.getPassword());
            sttm.setString(2, ac.getFullname());
            sttm.setInt(3, ac.getAge());
            sttm.setString(4, ac.getBirthday());
            sttm.setBoolean(5, ac.isGender());
            sttm.setString(6, ac.getPhone());
            sttm.setString(7, ac.getEmail());
            sttm.setString(8, ac.getAddress());
            sttm.setString(9, ac.getRegisterDate());
            if (sttm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return -1;
    }
      public int delete(String username) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "delete Account where username=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, username);
            if (sttm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return -1;
    }

    public Account findbyid(String username) {
        Connection conn = null;
        PreparedStatement sttm = null;
        Account ac = null;
        ResultSet rs;
        try {
            String sSQL = "select * from Account where username =?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, username);
            rs = sttm.executeQuery();
            while (rs.next()) {
                ac = new Account();
               ac.setUsername(rs.getString(1));
                ac.setPassword(rs.getString(2));
                ac.setFullname(rs.getString(3));
                ac.setAge(rs.getInt(4));
                ac.setBirthday(DateConver.todate(rs.getString(5)));
                ac.setGender(rs.getBoolean(6));
                ac.setPhone(rs.getString(7));
                ac.setEmail(rs.getString(8));
                ac.setAddress(rs.getString(9));
                ac.setPrivileges(rs.getString(10));

                return ac;
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return ac;
    }
    public Account findbyTK(String username,String password) {
        Connection conn = null;
        PreparedStatement sttm = null;
        Account ac = null;
        ResultSet rs;
        try {
            String sSQL = "select * from Account where username =? and password = ?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, username);
            sttm.setString(2, password);
            rs = sttm.executeQuery();
            while (rs.next()) {
                ac = new Account();
                ac.setUsername(rs.getString(1));
                ac.setPassword(rs.getString(2));
                ac.setFullname(rs.getString(3));
                ac.setAge(rs.getInt(4));
                ac.setBirthday(DateConver.todate(rs.getString(5)));
                ac.setGender(rs.getBoolean(6));
                ac.setPhone(rs.getString(7));
                ac.setEmail(rs.getString(8));
                ac.setAddress(rs.getString(9));
                ac.setPrivileges(rs.getString(10));
                return ac;
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return ac;
    }

}
