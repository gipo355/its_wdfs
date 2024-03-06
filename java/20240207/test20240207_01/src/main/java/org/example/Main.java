package org.example;

// table nome desccrizione prezzo giacenza aliquota

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

import java.sql.DriverManager;
import java.sql.SQLException;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
  public static void main(String[] args) {
    // TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the
    // highlighted text
    // to see how IntelliJ IDEA suggests fixing it.

    try {
      System.out.println("connecting to server");
      System.out.println("registering driver");
      // DriverManager.registerDriver(new
      // com.microsoft.sqlserver.jdbc.SQLServerDriver());
      DriverManager.registerDriver(new SQLServerDriver());

      System.out.println("driver registered");

      // dotenv
      // https://www.twilio.com/en-us/blog/working-with-environment-variables-in-java
      var url = "jdbc:sqlserver://localhost:1433;databaseName=master;user=sa;password=Admin123456;encrypt=true;trustServerCertificate=true";

      System.out.println("connecting to server");
      var conn = DriverManager.getConnection(url);

      System.out.println("connected to server");
      var statement = conn.createStatement();

      System.out.println("creating statement");

      // create table
      // var createTableSQL = "CREATE TABLE Products (ProductName varchar(255), Price
      // int)";
      //
      // System.out.println("executing statement");
      // statement.executeQuery(createTableSQL);

      // insert data
      var insertSQL = "INSERT INTO Products (ProductName, Price) VALUES ('Bike', 200)";
      System.out.println("executing statement");
      statement.execute(insertSQL);

      // insert data with params
      var insertSQL2 = "INSERT INTO Products (ProductName, Price) VALUES (?, ?);";
      var preparedStatement = conn.prepareStatement(insertSQL2);
      preparedStatement.setString(1, "Car");
      preparedStatement.setInt(2, 1000);
      System.out.println("executing statement");
      preparedStatement.executeUpdate();

      var readAllSql = "select * from Products";

      System.out.println("executing statement");
      var results = statement.executeQuery(readAllSql);

      System.out.println("results:");
      while (results.next()) {
        System.out.println("Product: " + results.getString(1));
      }

    } catch (SQLException e) {
      System.out.println("SQLException: " + e.getMessage());
    }
  }
}
