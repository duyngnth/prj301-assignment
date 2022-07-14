/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Lecturer;

/**
 *
 * @author duyng
 */
public class DBContextLecturer extends DBContext<Lecturer> {

    @Override
    public ArrayList<Lecturer> list() {
        ArrayList<Lecturer> lecturers = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [LecturerID], [LecturerName], [Email] FROM Lecturer";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("LecturerID");
                String name = rs.getNString("LecturerName");
                String email = rs.getString("Email");
                lecturers.add(new Lecturer(id, name, email));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return lecturers;
    }

    @Override
    public Lecturer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(String id) {
        Lecturer lecturer = null;
        connection = getConnection();
        try {
            String sql = "SELECT [LecturerName], [Email] FROM Lecturer\n"
                    + "WHERE [LecturerID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getNString("LecturerName");
                String email = rs.getString("Email");
                lecturer = new Lecturer(id, name, email);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return lecturer;
    }

    @Override
    public void add(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
