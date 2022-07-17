/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author duyng
 */
public class Session {
    int id;
    Lecturer lecturer;
    int sessionNumber;
    String sessionDescription;
    Room room;
    Date date;
    TimeSlot timeslot;
    Group group;
    String semester;

    public Session() {
    }
    
    public Session(int id, Lecturer lecturer, int sessionNumber, String sessionDescription, Room room, Date date, TimeSlot timeslot, Group group, String semester) {
        this.id = id;
        this.lecturer = lecturer;
        this.sessionNumber = sessionNumber;
        this.sessionDescription = sessionDescription;
        this.room = room;
        this.date = date;
        this.timeslot = timeslot;
        this.group = group;
        this.semester = semester;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Lecturer getLecturer() {
        return lecturer;
    }

    public void setLecturer(Lecturer lecturer) {
        this.lecturer = lecturer;
    }

    public int getSessionNumber() {
        return sessionNumber;
    }

    public void setSessionNumber(int sessionNumber) {
        this.sessionNumber = sessionNumber;
    }

    public String getSessionDescription() {
        return sessionDescription;
    }

    public void setSessionDescription(String sessionDescription) {
        this.sessionDescription = sessionDescription;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public TimeSlot getTimeslot() {
        return timeslot;
    }

    public void setTimeslot(TimeSlot timeslot) {
        this.timeslot = timeslot;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    @Override
    public String toString() {
        return "Session{" + "id=" + id + ", lecturer=" + lecturer + ", sessionNumber=" + sessionNumber + ", sessionDescription=" + sessionDescription + ", room=" + room + ", date=" + date + ", timeslot=" + timeslot + ", group=" + group + ", semester=" + semester + '}';
    }
    
    
}
