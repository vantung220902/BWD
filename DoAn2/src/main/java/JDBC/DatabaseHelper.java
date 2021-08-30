
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author admin
 */
public class DatabaseHelper {
        public static final String connectionURL="jdbc:sqlserver://localhost;databaseName=FASHION;user=sa;password=12341234";
     public static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (Exception e) {
            System.out.println("Chua Co driver"+e.toString());
        }
        try {
            conn=DriverManager.getConnection(connectionURL);
            return conn;
        } catch (Exception ex) {
            System.out.println("Loi Connection"+ex.toString());
        }

        return null;
    }
}