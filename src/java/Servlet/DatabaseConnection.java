/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Pc
 */
public class DatabaseConnection {
     public String url;
    public String user;
    public String password;
    public Connection Con;
    public Statement Stmt;

    public ResultSet RS;

    public DatabaseConnection() {
        url = "jdbc:mysql://localhost:3306/college";
        user = "root";
        password = "waleedkamal";
        Con = null;
        Stmt = null;
        RS = null;
    }

    public void getConnection() throws SQLException {
        Con = DriverManager.getConnection(url, user, password);
    }

    public void createStatement() throws SQLException {
        Stmt = Con.createStatement();
    }
}
