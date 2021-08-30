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
public class CateNewsDao {

    public List<CategoryNews> getAll() {
        Connection conn = null;
        PreparedStatement smmt = null;
        List<CategoryNews> ls = new ArrayList<CategoryNews>();
        try {
            String sSQL = "select * from CategoryNews";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                CategoryNews ctnews = new CategoryNews();
                ctnews.setId(rs.getInt(1));
                ctnews.setName(rs.getString(2));
                ls.add(ctnews);
            }

        } catch (SQLException e) {
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ls;
    }

    public int insert(CategoryNews ctnews) {
        Connection conn = null;
        PreparedStatement stmm = null;
        try {
            String sSQL = "insert into CategoryNews(id,name) values(?,?)";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, ctnews.getId());
            stmm.setString(2, ctnews.getName());
            if (stmm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("CateNews + Insert" + e.toString());
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public int update(CategoryNews ctNews) {
        Connection conn = null;
        PreparedStatement stmm = null;
        try {
            String sSQL = "update CategoryNews set name=? where id = ?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, ctNews.getId());
            stmm.setString(2, ctNews.getName());
            if (stmm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("CateNews + Update" + e.toString());
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public int delete(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        try {
            String sSQL = "delete CategoryNews where id = ?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            if (stmm.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("CateNews + Delete" + e.toString());
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public CategoryNews findbyid(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        CategoryNews cate = null;
        try {
            String sSQL = "select * from CategoryNews where id=?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cate = new CategoryNews();
                cate.setId(rs.getInt(1));
                cate.setName(rs.getString(2));
                return cate;
            }
        } catch (Exception e) {
            System.out.println("Eorr=>CategoryNewsDao=>findIB()" + e.toString());
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
