/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author duyng
 */
public class DBContextAccount extends DBContext<Account> {

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(String username) {
        Account account = null;
        connection = getConnection();
        try {
            String sql = "SELECT [DisplayName] FROM [Account]\n"
                    + "WHERE [Username] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setUsername(username);
                account.setDisplayname(rs.getNString("DisplayName"));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return account;
    }

    public Account get(String username, String password) {
        Account account = null;
        connection = getConnection();
        try {
            String sql = "SELECT [DisplayName] FROM [Account]\n"
                    + "WHERE [Username] = ?\n"
                    + "AND [Password] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setUsername(username);
                account.setDisplayname(rs.getNString("DisplayName"));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return account;
    }

    @Override
    public void add(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
