/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Attendance;

/**
 *
 * @author duyng
 */
public class DBContextAttendance extends DBContext<Attendance> {

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Attendance> list(int sessionID) {
        ArrayList<Attendance> atds = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [StudentID], [Status],\n"
                    + "[RecordTime], [Description], [TakenBy]\n"
                    + "FROM [Attendance]\n"
                    + "WHERE [SessionID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, sessionID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Attendance atd = new Attendance();
                DBContextStudent dbst = new DBContextStudent();
                atd.setStudent(dbst.get(rs.getString("StudentID")));
                atd.setStatus(rs.getString("Status"));
                atd.setRecordTime(rs.getTimestamp("RecordTime"));
                String description = rs.getNString("Description");
                if (description == null) {
                    description = "";
                }
                atd.setDescription(description);
                DBContextLecturer dbl = new DBContextLecturer();
                atd.setTakenBy(dbl.get(rs.getString("TakenBy")));
                DBContextSession dbss = new DBContextSession();
                atd.setSession(dbss.get(sessionID));
                atds.add(atd);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return atds;
    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Attendance get(int sessionID, String studentID) {
        Attendance atd = null;
        connection = getConnection();
        try {
            String sql = "SELECT [Status], [RecordTime],\n"
                    + "[Description] FROM [Attendance]\n"
                    + "WHERE [SessionID] = ?\n"
                    + "AND [StudentID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, sessionID);
            stmt.setString(2, studentID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                atd = new Attendance();
                DBContextSession dbss = new DBContextSession();
                atd.setSession(dbss.get(sessionID));
                DBContextStudent dbst = new DBContextStudent();
                atd.setStudent(dbst.get(studentID));
                atd.setStatus(rs.getString("Status"));
                atd.setRecordTime(rs.getTimestamp("RecordTime"));
                String description = rs.getNString("Description");
                if (description == null) {
                    description = "";
                }
                atd.setDescription(description);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return atd;
    }

    @Override
    public void add(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void add(ArrayList<Attendance> models) {
        connection = getConnection();
        try {
            String sql = "INSERT INTO [Attendance] VALUES\n";
            for (int i = 0; i < models.size(); i++) {
                Attendance a = models.get(i);
                sql += "('" + a.getStudent().getId() + "', " + a.getSession().getId()
                        + ", '" + a.getStatus() + "', '" + a.getRecordTime().toString()
                        + "', '" + a.getDescription() + "')";
                if (i != (models.size() - 1)) {
                    sql += ",\n";
                }
            }
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
    }

    @Override
    public void update(Attendance model) {
        connection = getConnection();
        try {
            String sql = "UPDATE [Attendance]\n"
                    + "SET [Status] = ?, [RecordTime] = ?, [Description] = ?\n"
                    + "WHERE [SessionID] = ? AND [StudentID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getStatus());
            stmt.setTimestamp(2, model.getRecordTime());
            stmt.setNString(3, model.getDescription());
            stmt.setInt(4, model.getSession().getId());
            stmt.setString(5, model.getStudent().getId());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
    }

    public void update(ArrayList<Attendance> models) {
        connection = getConnection();
        for (int i = 0; i < models.size(); i++) {
            DBContextAttendance dbat = new DBContextAttendance();
            Attendance model1 = models.get(i);
            Attendance model2 = dbat.get(model1.getSession().getId(), model1.getStudent().getId());
            if (!model1.getStatus().equals(model2.getStatus())
                    || !model1.getDescription().equals(model2.getDescription()))
                update(model1);
        }
    }

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
