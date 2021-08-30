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
public class CategoriesDAO {

    public List<Categories> getAll() {
        Connection conn = null;
        PreparedStatement stmm = null;
        Categories cate = null;
        List<Categories> ls = new ArrayList<Categories>();
        try {
            String sSQL = "select * from Categories";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cate = new Categories();
                cate.setId(rs.getInt(1));
                cate.setName(rs.getString(2));
                ls.add(cate);
            }
        } catch (Exception e) {
            System.out.println("Eorr=>CategoriDao=>getALL()" + e.toString());
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ls;
    }
    public int getSize(){
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL="select  count(id) from Categories";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            try {
                conn.close();sttm.close();
            } catch (Exception e) {
            }
        }
        return 0;
    }
    public int insert(Categories cate){
         Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL ="insert into Categories(id,name) values(?,?)" ;
            conn = DatabaseHelper.getConnection();
            sttm=conn.prepareStatement(sSQL);
            sttm.setInt(1, cate.getId());
            sttm.setString(2, cate.getName());
            if (sttm.executeUpdate() > 0) {
                return 1;
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
        return -1;
    }
      public int update(Categories cate){
         Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL ="update Categories set name=? where id=?" ;
            conn = DatabaseHelper.getConnection();
            sttm=conn.prepareStatement(sSQL);
            sttm.setInt(2, cate.getId());
            sttm.setString(1, cate.getName());
            if (sttm.executeUpdate() > 0) {
                return 1;
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
        return -1;
    }
    public int delete(int id) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "delete Categories where id=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, id);
            if (sttm.executeUpdate() > 0) {
                return 1;
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
        return -1;
    }

    public Categories findbyid(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Categories cate = null;
        try {
            String sSQL = "select * from Categories where id=?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cate = new Categories();
                cate.setId(rs.getInt(1));
                cate.setName(rs.getString(2));
                return cate;
            }
        } catch (Exception e) {
            System.out.println("Eorr=>CategoriDao=>findIB()" + e.toString());
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return cate;
    }
}
