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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ProductDAO {

    public int insert(Product pro) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "insert into Product(id,name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,CategoryID,Description,quantity,PerentageDiscoint,SIZE,color) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, pro.getId());
            sttm.setString(2, pro.getName());
            sttm.setString(3, pro.getImgFont());
            sttm.setString(4, pro.getImgBehind());
            sttm.setInt(5, pro.getPriceOld());
            sttm.setInt(6, pro.getPriceNew());
            sttm.setString(7, pro.getMannufactureDate());
            sttm.setInt(8, pro.getCateID().getId());
            sttm.setString(9, pro.getDescription());
            sttm.setInt(10, pro.getQuantity());
            sttm.setInt(11, pro.getRerentageDiscoint());
            sttm.setString(12, pro.getSize());
            sttm.setString(13, pro.getColor());
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

    public int update(Product pro) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "update Product set name=?,imagesFont=?,imgesBehind=?,priceold=?,pricenew=?,MannufactureDate=?,CategoryID=?,Description=?,quantity=?,PerentageDiscoint=?,SIZE=?,color=? where id=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(13, pro.getId());
            sttm.setString(1, pro.getName());
            sttm.setString(2, pro.getImgFont());
            sttm.setString(3, pro.getImgBehind());
            sttm.setInt(4, pro.getPriceOld());
            sttm.setInt(5, pro.getPriceNew());
            sttm.setString(6, pro.getMannufactureDate());
            sttm.setInt(7, pro.getCateID().getId());
            sttm.setString(8, pro.getDescription());
            sttm.setInt(9, pro.getQuantity());
            sttm.setInt(10, pro.getRerentageDiscoint());
            sttm.setString(11, pro.getSize());
            sttm.setString(12, pro.getColor());
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

    public int updateQuantuty(int quantity, int id) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "update Product set quantity=quantity-? where id=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, quantity);
            sttm.setInt(2, id);
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
   public int updateColor(String color,String size, int id) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "update Product set color=?,size=? where id=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, color);
             sttm.setString(2, size);
            sttm.setInt(3, id);
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
            String sSQL = "delete Product where id=?";
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

    public List<Product> getAll() {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        Categories cate = new Categories();
        List<Product> ls = new ArrayList<Product>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint,SIZE,color from Product \n"
                    + "inner join Categories on Categories.id = Product.CategoryID order by id";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                pro.setSize(rs.getString(12));
                pro.setColor(rs.getString(13));
                ls.add(pro);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }

    public List<Product> getAllByCate(int cateid, int index) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        List<Product> ls = new ArrayList<Product>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint,SIZE,color from Product \n"
                    + "inner join Categories on Categories.id = Product.CategoryID where CategoryID=? and quantity>0 order by id \n"
                    + "offset ? rows fetch next 16 rows only;";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, cateid);
            stmm.setInt(2, (index - 1) * 16);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                 pro.setSize(rs.getString(12));
                pro.setColor(rs.getString(13));
                ls.add(pro);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }

    public List<Product> getNext16(int index) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        List<Product> ls = new ArrayList<Product>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint,SIZE,color from Product \n"
                    + "inner join Categories on Categories.id = Product.CategoryID order by id \n"
                    + "offset ? rows fetch next 16 rows only;";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, (index - 1) * 16);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                 pro.setSize(rs.getString(12));
                pro.setColor(rs.getString(13));
                ls.add(pro);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }

    public List<Product> getNextSize(int index, int size) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        List<Product> ls = new ArrayList<Product>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint,SIZE,color from Product \n"
                    + "inner join Categories on Categories.id = Product.CategoryID order by id \n"
                    + "offset ? rows fetch next ? rows only;";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, (index - 1) * size);
            stmm.setInt(2, size);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                 pro.setSize(rs.getString(12));
                pro.setColor(rs.getString(13));
                ls.add(pro);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }

    public int getSizeByCID(int cateid) {
        Connection conn = null;
        PreparedStatement stmm = null;
        ResultSet rs = null;

        try {
            String sSQL = "select count(*) from Product where CategoryID = ?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, cateid);
            rs = stmm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return 0;
    }

    public int getSize() {
        Connection conn = null;
        PreparedStatement stmm = null;
        ResultSet rs = null;

        try {
            String sSQL = "select count(id) from Product ";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            rs = stmm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return 0;
    }

    public int getQuantuty(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        ResultSet rs = null;
        try {
            String sSQL = "select quantity from  Product where id=?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            rs = stmm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return 0;
    }

    public List<Product> searchByName(String name) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        List<Product> ls = new ArrayList<Product>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint from Product\n"
                    + "inner join Categories on Categories.id = Product.CategoryID where [Product].[name] like ? and quantity>0 order by id";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setString(1, "%" + name + "%");
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                ls.add(pro);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }

    public Product findByid(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint,CategoryID,SIZE,color from Product \n"
                    + "inner join Categories on Categories.id = Product.CategoryID where Product.id=" + id + "";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setQuantity(rs.getInt(10));
                pro.setRerentageDiscoint(rs.getInt(11));
                pro.setCateidSame(rs.getInt(12));
                pro.setSize(rs.getString(13));
                pro.setColor(rs.getString(14));
                return pro;
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return pro;
    }
 public Product findByidSC(int id) {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;
        ResultSet rs = null;
        try {
            String sSQL = "select SIZE,color from Product where id =?";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, id);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setSize(rs.getString(1));
                pro.setColor(rs.getString(2));
                return pro;
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return pro;
    }
    public List<Product> searchByPrice(int cate, int begin, int end) throws ParseException {
        Connection conn = null;
        PreparedStatement stmm = null;
        Product pro = null;

        List<Product> ls = new ArrayList<>();
        try {
            String sSQL = "select Product.id,Product.name,imagesFont,imgesBehind,priceold,pricenew,MannufactureDate,Categories.name,Description,quantity,PerentageDiscoint from Product \n"
                    + "inner join Categories on Product.CategoryID = Categories.id where CategoryID=? and pricenew between ? and ? and quantity>0 order by Product.id";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            stmm.setInt(1, cate);
            stmm.setInt(2, begin);
            stmm.setInt(3, end);
            ResultSet rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImgFont(rs.getString(3));
                pro.setImgBehind(rs.getString(4));
                pro.setPriceOld(rs.getInt(5));
                pro.setPriceNew(rs.getInt(6));
                pro.setMannufactureDate(DateConver.todate(rs.getString(7)));
                pro.setCateID(new Categories(0, rs.getString(8)));
                pro.setDescription(rs.getString(9));
                pro.setRerentageDiscoint(rs.getInt(10));
                pro.setCateidSame(rs.getInt(11));
                ls.add(pro);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (SQLException e) {

            }
        }
        return ls;
    }

    public List<CountProCate> getLsCate() {
        Connection conn = null;
        PreparedStatement stmm = null;
        CountProCate pro = null;
        ResultSet rs = null;
        List<CountProCate> ls = new ArrayList<CountProCate>();
        try {
            String sSQL = "select count(Product.id),Categories.name from Product\n"
                    + "inner join Categories on Categories.id = Product.CategoryID\n"
                    + "group by Categories.name";
            conn = DatabaseHelper.getConnection();
            stmm = conn.prepareStatement(sSQL);
            rs = stmm.executeQuery();
            while (rs.next()) {
                pro = new CountProCate();
                pro.setSizePro(rs.getInt(1));
                pro.setName(rs.getString(2));
                ls.add(pro);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                stmm.close();
                conn.close();
            } catch (Exception e) {

            }
        }
        return ls;
    }
}
