/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Course;

/**
 *
 * @author duyng
 */
public class DBContextCourse extends DBContext<Course> {

    @Override
    public ArrayList<Course> list() {
        ArrayList<Course> courses = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [CourseID], [CourseName] FROM Course";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("CourseID");
                String name = rs.getString("CourseName");
                courses.add(new Course(id, name));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return courses;
    }

    @Override
    public Course get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Course get(String id) {
        Course course = null;
        connection = getConnection();
        try {
            String sql = "SELECT [CourseName] FROM Course\n"
                    + "WHERE [CourseID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("CourseName");
                course = new Course(id, name);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return course;
    }

    @Override
    public void add(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
