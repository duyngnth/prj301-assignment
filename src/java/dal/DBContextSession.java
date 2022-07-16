/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.TimeSlot;
import model.Week;

/**
 *
 * @author duyng
 */
public class DBContextSession extends DBContext<Session> {

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Session> list(Week week, String lecturerID) {
        ArrayList<Session> sessions = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [SessionID], [LecturerID], [SessionNumber],\n"
                    + "[SessionDescription], [RoomID], [Date], \n"
                    + "[TimeSlotID], [GroupID], [Semester] FROM [Session]\n"
                    + "WHERE [LecturerID] = ?\n"
                    + "AND [Date] BETWEEN ? AND ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, lecturerID);
            stmt.setDate(2, week.getStart());
            stmt.setDate(3, week.getEnd());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("SessionID");
                DBContextLecturer dbl = new DBContextLecturer();
                Lecturer lecturer = dbl.get(rs.getString("LecturerID"));
                int number = rs.getInt("SessionNumber");
                String description = rs.getString("SessionDescription");
                if (description == null)
                    description = "";
                DBContextRoom dbr = new DBContextRoom();
                Room room = dbr.get(rs.getString("RoomID"));
                Date date = rs.getDate("Date");
                DBContextTimeSlot dbts = new DBContextTimeSlot();
                TimeSlot timeslot = dbts.get(rs.getString("TimeSlotID"));
                DBContextGroup dbg = new DBContextGroup();
                Group group = dbg.getBySession(id);
                String semester = rs.getString("Semester");
                Session session = new Session(id, lecturer, number, description, room, date, timeslot, group, semester);
                sessions.add(session);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return sessions;
    }

    @Override
    public Session get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
