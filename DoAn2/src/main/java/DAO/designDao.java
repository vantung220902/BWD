package DAO;

import JDBC.DatabaseHelper;

import java.sql.*;


public class designDao {
    public int InsertInto(Design design) {
        Connection conn = null;
        PreparedStatement stmm = null;
        try {
            String sSQL = "insert into design(color,logo,text,img) values(?,?,?,?)";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setString(1, design.getColor());
            stmm.setString(2, design.getLogo());
            stmm.setString(3, design.getText());
            stmm.setString(4, design.getImg());
            if (stmm.executeUpdate() > 0) {
                return 1;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return -1;
    }

    public int delete() {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "delete design";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
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
    public Design getItem() {
        Connection conn = null;
        PreparedStatement sttm = null;
        Design ds = null;
        ResultSet rs;
        try {
            String sSQL = "select * from design";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            rs = sttm.executeQuery();
            ds = new Design();
            ds.setColor(rs.getString(1));
            ds.setLogo(rs.getString(2));
            ds.setText(rs.getString(3));
            ds.setImg(rs.getString(4));
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return ds;
    }
}
