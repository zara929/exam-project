/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;
import java.sql.Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USER
 */
public class Koneksi {
Connection cn=null;
  public Statement st=null;
  Koneksi rs;
  
  public Koneksi() throws ClassNotFoundException{
      String dbName = "db_rental_film";
      String uName = "root";
      String pass ="";
      String URL = "jdbc:mysql://localhost/" + dbName;
      Class.forName("com.mysql.jdbc.Driver");
      try {
          cn=DriverManager.getConnection(URL, uName, pass);
          st=cn.createStatement();
      } catch (SQLException ex) {
          Logger.getLogger(Koneksi.class.getName()).log(Level.SEVERE, null, ex);
      }
  }
  public Koneksi (String dbName, String uName, String pass) throws ClassNotFoundException {
      String URL = "jbdc:mysql://localhost/" + dbName;
      Class.forName("com.mysql.jdbc.Driver");
      
      try {
          cn=DriverManager.getConnection(URL, uName, pass);
          st=cn.createStatement();
      } catch (SQLException ex) {
          Logger.getLogger(Koneksi.class.getName()).log(Level.SEVERE, null, ex);
      }
  }
  public void close() throws SQLException{
      cn.close();
      st.close();
    }
}
