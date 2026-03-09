
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

  private static final String URL = "jdbc:mysql://localhost:3306/bank_management?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
  private static final String USER = "root";
  private static final String PASSWORD = "12345678";

  private static DatabaseConnection instance;

  private DatabaseConnection() {
  }

  public static DatabaseConnection getInstance() {
    if (instance == null) {
      instance = new DatabaseConnection();
    }
    return instance;
  }

  public Connection getConnection() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
      return conn;
    } catch (ClassNotFoundException e) {
      System.err.println("[DB ERROR] Driver not found: " + e.getMessage());
      return null;
    } catch (SQLException e) {
      System.err.println("[DB ERROR] Connection failed: " + e.getMessage());
      return null;
    }
  }
}
