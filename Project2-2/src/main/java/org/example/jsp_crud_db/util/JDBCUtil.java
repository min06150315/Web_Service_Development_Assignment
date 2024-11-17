package org.example.jsp_crud_db.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static Connection conn = null;
    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            if (conn == null) {
                conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:" + "3306/OSS24_22300265?user=OSS24_22300265&password=Eecie4ub");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    public static void close(AutoCloseable... resources) {
        for (AutoCloseable resource : resources) {
            if (resource != null) {
                try {
                    resource.close();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    public static void main(String[] args) {
        Connection conn = JDBCUtil.getConnection();
        if (conn != null) {
            System.out.println("Connection Complete!!!!");
        }
    }
}
