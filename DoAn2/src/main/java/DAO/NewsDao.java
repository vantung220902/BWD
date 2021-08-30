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
public class NewsDao {

    public List<News> getAllByCateNews(int cateID, int page) {
        List<News> ls = new ArrayList<News>();
        Connection conn = null;
        PreparedStatement smmt = null;
        try {
            String sSQL = "select News.id,News.name,description,dataSubmit,CategoryNews.name, link,img from News \n"
                    + "inner join CategoryNews on CategoryNews.id = News.cateId where cateId = ? order by News.id \n"
                    + "offset ? row fetch next 16 rows only";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setInt(1, cateID);
            smmt.setInt(2, (page - 1) * 16);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt(1));
                news.setName(rs.getString(2));
                news.setDescription(rs.getString(3));
                news.setDataSubmit(DateConver.todate(rs.getString(4)));
                news.setCateid(new CategoryNews(0, rs.getString(5)));
                news.setLink(rs.getString(6));
                news.setImg(rs.getString(7));
                ls.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ls;
    }

    public List<News> getTop16(int page) {
        List<News> ls = new ArrayList<News>();
        Connection conn = null;
        PreparedStatement smmt = null;
        try {
            String sSQL = "select News.id,News.name,description,dataSubmit,CategoryNews.name, link,img from News \n"
                    + "inner join CategoryNews on CategoryNews.id = News.cateId  order by News.id \n"
                    + "offset ? row fetch next 16 rows only";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setInt(1, (page - 1) * 16);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt(1));
                news.setName(rs.getString(2));
                news.setDescription(rs.getString(3));
                news.setDataSubmit(DateConver.todate(rs.getString(4)));
                news.setCateid(new CategoryNews(0, rs.getString(5)));
                news.setLink(rs.getString(6));
                news.setImg(rs.getString(7));
                ls.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ls;
    }

    public List<News> getAll() {
        List<News> ls = new ArrayList<News>();
        Connection conn = null;
        PreparedStatement smmt = null;
        try {
            String sSQL = "select * from News";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt(1));
                news.setName(rs.getString(2));
                news.setDescription(rs.getString(3));
                news.setDataSubmit(DateConver.todate(rs.getString(4)));
                news.setCateid(new CategoryNews(0, rs.getString(5)));
                news.setLink(rs.getString(6));
                news.setImg(rs.getString(7));
                ls.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ls;
    }

    public int getSIZE(int cateid) {
        Connection conn = null;
        PreparedStatement smmt = null;
        try {
            String sSQL = "select count(*) from News where cateId = ?";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setInt(1, cateid);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int getSIZEAll() {
        Connection conn = null;
        PreparedStatement smmt = null;
        try {
            String sSQL = "select count(*) from News ";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public List<News> searchByName(String name) throws ParseException {
        List<News> ls = new ArrayList<News>();
        Connection conn = null;
        PreparedStatement smmt = null;
        News news = null;
        try {
            String sSQL = "select News.id,News.name,description,dataSubmit,CategoryNews.name,link,img  from News \n"
                    + "inner join CategoryNews on CategoryNews.id = News.cateId where [News].[name] like ? order by News.id";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setString(1, "%" + name + "%");
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                news = new News();
                news.setId(rs.getInt(1));
                news.setName(rs.getString(2));
                news.setDescription(rs.getString(3));
                news.setDataSubmit(DateConver.todate(rs.getString(4)));
                news.setCateid(new CategoryNews(0, rs.getString(5)));
                news.setLink(rs.getString(6));
                news.setImg(rs.getString(7));
                ls.add(news);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
            }
        }
        return ls;
    }

    public News findById(int id) throws ParseException {
        Connection conn = null;
        PreparedStatement smmt = null;
        News news = null;
        try {
            String sSQL = "select * from News where id =?";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setInt(1, id);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                news = new News();
                news.setId(rs.getInt(1));
                news.setName(rs.getString(2));
                news.setDescription(rs.getString(3));
                news.setDataSubmit(DateConver.todate(rs.getString(4)));
                news.setCateid(new CategoryNews(0, rs.getString(5)));
                news.setLink(rs.getString(6));
                news.setImg(rs.getString(7));
                return news;
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
            }
        }
        return news;
    }

    public List<News> getTop4(int index) {
        List<News> ls = new ArrayList<News>();
        Connection conn = null;
        PreparedStatement smmt = null;
        News news = null;
        try {
            String sSQL = "select  img,name from News order by id desc\n"
                    + "offset ? row fetch next 4 row only";
            conn = DatabaseHelper.getConnection();
            smmt = conn.prepareStatement(sSQL);
            smmt.setInt(1, (index - 1) * 4);
            ResultSet rs = smmt.executeQuery();
            while (rs.next()) {
                news = new News();
                news.setImg(rs.getString(1));
                news.setName(rs.getString(2));
                ls.add(news);
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.toString());
        } finally {
            try {
                conn.close();
                smmt.close();
            } catch (Exception e) {
            }
        }
        return ls;
    }

    public int insert(News news) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "insert into News(id,name,description,dataSubmit,cateId,link,img) values(?,?,?,?,?,?,?)";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setInt(1, news.getId());
            sttm.setString(2, news.getName());
            sttm.setString(3, news.getDescription());
            sttm.setString(4, news.getDataSubmit());
            sttm.setInt(5, news.getCateid().getId());
            sttm.setString(6, news.getLink());
            sttm.setString(7, news.getImg());
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

    public int update(News news) {
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "set dateformat dmy;\n"
                    + "update News set name=?,description = ?,dataSubmit = ?,cateId=?,link=?,img=? where id=?";
            conn = DatabaseHelper.getConnection();
            sttm = conn.prepareStatement(sSQL);
            sttm.setString(1, news.getName());
            sttm.setString(2, news.getDescription());
            sttm.setString(3, news.getDataSubmit());
            sttm.setInt(4, news.getCateid().getId());
            sttm.setString(5, news.getLink());
            sttm.setString(6, news.getImg());
            sttm.setInt(7, news.getId());
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
            String sSQL = "delete News where id=?";
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
}
