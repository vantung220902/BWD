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
public class CartDao {

    public int insert(Cart cart) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy; \n"
                    + "insert into CartDetails(ProductID,Quantity,price,status,username,name,createDate) values(?,?,?,?,?,?,?)";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, cart.getProid());
            sttm.setInt(2, cart.getQuantity());
            sttm.setDouble(3, cart.getPrice());
            sttm.setString(4, cart.getStatus());
            sttm.setString(5, cart.getUsername());
            sttm.setString(6, cart.getName());
            sttm.setString(7, cart.getCreateDate());
            if (sttm.executeUpdate() > 1) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                sttm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return -1;
    }

    public int Update(Cart cart) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "update CartDetails set ProductID=?,Quantity=?,price=?,status=?,username=?,name=?,createDate=? where id = ?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, cart.getProid());
            sttm.setInt(2, cart.getQuantity());
            sttm.setInt(3, cart.getPrice());
            sttm.setString(4, cart.getStatus());
            sttm.setString(5, cart.getUsername());
            sttm.setString(6, cart.getName());
            sttm.setString(7, cart.getCreateDate());
            sttm.setInt(8, cart.getId());
            if (sttm.executeUpdate() > 1) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();

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
            String sSQL = "delete CartDetails where id = ?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, id);
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

    public int SumPrice() {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select SUM(price) from CartDetails";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                sttm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int CountCART() {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select COUNT(id) from CartDetails";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                sttm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int AvgPrice() {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select AVG(price) from CartDetails";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                sttm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getLuotQuay(String username) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select luotquay from luotquat where username=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, username);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                sttm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getSIZE() {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select COUNT(id) from CartDetails";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                sttm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public List<Cart> getTop5() {
        List<Cart> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmm = null;
        Cart cart = null;
        try {
            String sSQL = "select  top 5 * from CartDetails order by id desc";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setId(rs.getInt(1));
                cart.setProid(rs.getInt(2));
                cart.setQuantity(rs.getInt(3));
                cart.setPrice(rs.getInt(4));
                cart.setStatus(rs.getString(5));
                cart.setUsername(rs.getString(6));
                cart.setName(rs.getString(7));
                cart.setCreateDate(DateConver.todate(rs.getString(8)));
                ls.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return ls;
    }

    public List<Cart> getNext16(int page) {
        List<Cart> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmm = null;
        Cart cart = null;
        try {
            String sSQL = "SELECT * \n"
                    + "FROM CartDetails\n"
                    + "ORDER BY id  OFFSET ? ROWS FETCH NEXT 16 ROWS ONLY;";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, (page - 1) * 16);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setId(rs.getInt(1));
                cart.setProid(rs.getInt(2));
                cart.setQuantity(rs.getInt(3));
                cart.setPrice(rs.getInt(4));
                cart.setStatus(rs.getString(5));
                cart.setUsername(rs.getString(6));
                cart.setName(rs.getString(7));
                cart.setCreateDate(DateConver.todate(rs.getString(8)));
                ls.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return ls;
    }

    public Cart findId(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Cart cart = null;
        try {
            String sSQL = "select * from CartDetails where id = ?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setId(rs.getInt(1));
                cart.setProid(rs.getInt(2));
                cart.setQuantity(rs.getInt(3));
                cart.setPrice(rs.getInt(4));
                cart.setStatus(rs.getString(5));
                cart.setUsername(rs.getString(6));
                cart.setName(rs.getString(7));
                cart.setCreateDate(DateConver.todate(rs.getString(8)));
                return cart;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return cart;
    }

    public List<MoneyOfMonth> getSumMonth() {
        List<MoneyOfMonth> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmm = null;
        MoneyOfMonth money = null;
        try {
            String sSQL = "select sum(price) from CartDetails \n"
                    + "group by MONTH(createDate)";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                money = new MoneyOfMonth();
                money.setMoney(rs.getInt(1));
                ls.add(money);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return ls;

    }

    public List<MoneyOfMonth> getAvgMonth() {
        List<MoneyOfMonth> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmm = null;
        MoneyOfMonth money = null;
        try {
            String sSQL = "select avg(price) from CartDetails \n"
                    + "group by MONTH(createDate)";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                money = new MoneyOfMonth();
                money.setMoney(rs.getInt(1));
                ls.add(money);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return ls;

    }

    public List<SumProCart> getSumCartPro() {
        List<SumProCart> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmm = null;
        SumProCart money = null;
        try {
            String sSQL = "select sum(price),Categories.name  from CartDetails \n"
                    + "inner join  Product on Product.id = CartDetails.ProductID \n"
                    + "inner join Categories on Product.CategoryID = Categories.id\n"
                    + "group by Categories.name";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                money = new SumProCart();
                money.setSum(rs.getInt(1));
                money.setName(rs.getString(2));
                ls.add(money);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                stmm.close();
            } catch (Exception e) {
            }
        }
        return ls;

    }
}
