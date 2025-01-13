/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UAS.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

 
public class koneksi {

    private static Connection conn;

    public static Connection getConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bioskop", "root", "");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            JOptionPane.showMessageDialog(null, "koneksi database gagal");
        }
        return conn;
    }
}
