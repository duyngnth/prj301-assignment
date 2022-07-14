/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import model.TimeSlot;

/**
 *
 * @author duyng
 */
public class DBContextTimeSlot extends DBContext<TimeSlot>{

    @Override
    public ArrayList<TimeSlot> list() {
        ArrayList<TimeSlot> timeslots = new ArrayList<>();
        connection = getConnection();
        try {
            String sql = "SELECT [TimeSlotID], [Start], [End] FROM TimeSlot";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("TimeSlotID");
                Time start = rs.getTime("Start");
                Time end = rs.getTime("End");
                timeslots.add(new TimeSlot(id, start, end));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return timeslots;
    }

    @Override
    public TimeSlot get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public TimeSlot get(String id) {
        TimeSlot timeslot = null;
        connection = getConnection();
        try {
            String sql = "SELECT [Start], [End] FROM TimeSlot\n"
                    + "WHERE [TimeSlotID] = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Time start = rs.getTime("Start");
                Time end = rs.getTime("End");
                timeslot = new TimeSlot(id, start, end);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return timeslot;
    }

    @Override
    public void add(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }  
}
