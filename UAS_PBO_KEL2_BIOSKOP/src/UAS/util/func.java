/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UAS.util;

import java.awt.geom.RoundRectangle2D;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;

// Fungsi
public class func {

    public static void config(JFrame frame) {
        try {
            frame.setSize(1000, 600);
            frame.setLocationRelativeTo(null);
            frame.setShape(new RoundRectangle2D.Double(0, 0, frame.getWidth(), frame.getHeight(), 15, 15));
            frame.setVisible(true);
        } catch (Exception ex) {
            System.out.println("Terjadi kesalahan dalam konfigurasi: " + ex.getMessage());
        }
    }

    public static class db {

        public static ResultSet select(String sql) {
            ResultSet rs = null;
            try {
                Connection conn = koneksi.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
            } catch (SQLException ex) {
                System.out.println("Error SELECT: " + ex.getMessage());
            }
            return rs;
        }

        public static int insert(String sql) {
            int result = 0;
            try {
                Connection conn = koneksi.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                result = stmt.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error INSERT: " + ex.getMessage());
            }
            return result;
        }

        public static int update(String sql) {
            int result = 0;
            try {
                Connection conn = koneksi.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                result = stmt.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error UPDATE: " + ex.getMessage());
            }
            return result;
        }

        public static int delete(String sql) {
            int result = 0;
            try {
                Connection conn = koneksi.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                result = stmt.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error DELETE: " + ex.getMessage());
            }
            return result;
        }
    }

}
