/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author duyng
 */
public class DBContextStudent extends DBContext<Student> {

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Student> listByGroup(String groupName, String courseID) {
        ArrayList<Student> students = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [StudentID], [MemberCode], [Surname],\n"
                    + "[MiddleName], [GivenName] FROM [Student]\n"
                    + "WHERE [StudentID] IN\n"
                    + "(SELECT [StudentID] FROM [StudentGroup]\n"
                    + "WHERE [GroupID] IN \n"
                    + "(SELECT [GroupID] FROM [Group]\n"
                    + "WHERE [GroupName] = ?\n"
                    + "AND [CourseID] = ?))";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, groupName);
            stmt.setString(2, courseID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("StudentID");
                String code = rs.getString("MemberCode");
                String surname = rs.getNString("Surname");
                String middleName = rs.getNString("MiddleName");
                String givenName = rs.getNString("GivenName");
                students.add(new Student(id, code, surname, middleName, givenName));
            }
        } catch (SQLException e) {
        }
        return students;
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(String id) {
        Student student = null;
        connection = getConnection();
        try {
            String sql = "SELECT [StudentID], [MemberCode], [Surname],\n"
                    + "[MiddleName], [GivenName] FROM [Student]\n"
                    + "WHERE [StudentID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String code = rs.getString("MemberCode");
                String surname = rs.getNString("Surname");
                String middleName = rs.getNString("MiddleName");
                String givenName = rs.getNString("GivenName");
                student = new Student(id, code, surname, middleName, givenName);
            }
        } catch (SQLException e) {
        }
        return student;
    }

    @Override
    public void add(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
