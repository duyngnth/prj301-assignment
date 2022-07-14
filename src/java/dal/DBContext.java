/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duyng
 * @param <T>
 */
public abstract class DBContext<T> {
    Connection connection;

    public DBContext() {
    }
    
    public Connection getConnection() {
        Connection connection = null;
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_Assignment";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return connection;
    }
    
    public abstract ArrayList<T> list();
    
    public abstract T get(int id);
    
    public abstract T get(String id);
    
    public abstract void add(T model);
    
    public abstract void update(T model);
    
    public abstract void delete(T model);
} 
