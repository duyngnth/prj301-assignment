/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContextAttendance;
import dal.DBContextGroup;
import dal.DBContextLecturer;
import dal.DBContextSession;
import dal.DBContextStudent;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Attendance;
import model.Group;
import model.Session;
import model.Student;

/**
 *
 * @author duyng
 */
public class AttendanceTakingController extends BaseRequiredAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date date = new Date(System.currentTimeMillis());
        Time now = Time.valueOf((new Time(System.currentTimeMillis()).toString()));

        // Fake current time
        //Date date = Date.valueOf("2022-07-15");
        // now = Time.valueOf("15:00:00");

        String SessionID = request.getParameter("SessionID");

        if (SessionID == null || SessionID.length() == 0) {
            DBContextSession dbss = new DBContextSession();
            ArrayList<Session> sessions = dbss.list(date, getCurrentSession(request).getUsername());

            ArrayList<Boolean> takePermissions = new ArrayList<>();
            for (int i = 0; i < sessions.size(); i++) {
                Boolean takePermission = true;
                if (now.before(sessions.get(i).getTimeslot().getStart())) {
                    takePermission = false;
                }
                DBContextAttendance dbat = new DBContextAttendance();
                if (!dbat.list(sessions.get(i).getId()).isEmpty()) {
                    takePermission = false;
                }
                takePermissions.add(takePermission);

            }

            ArrayList<Boolean> editPermissions = new ArrayList<>();
            for (int i = 0; i < sessions.size(); i++) {
                boolean editPermission = false;
                DBContextAttendance dbat = new DBContextAttendance();
                if (!dbat.list(sessions.get(i).getId()).isEmpty()) {
                    editPermission = true;
                }
                editPermissions.add(editPermission);
            }

            request.setAttribute("today", date);
            request.setAttribute("sessions", sessions);
            request.setAttribute("takePermissions", takePermissions);
            request.setAttribute("editPermissions", editPermissions);
            request.getRequestDispatcher("view/AttendanceTaking.jsp").forward(request, response);
        } else {
            String action = request.getParameter("action");
            int sessionID = Integer.parseInt(request.getParameter("SessionID"));
            DBContextSession dbss = new DBContextSession();
            Session session = dbss.get(sessionID);

            if (action.equals("Take")) {
                DBContextGroup dbg = new DBContextGroup();
                Group group = dbg.getBySession(sessionID);

                request.setAttribute("session", session);
                request.setAttribute("group", group);
                request.getRequestDispatcher("view/TakeAttendance.jsp").forward(request, response);
            } else {
                DBContextAttendance dbat = new DBContextAttendance();
                ArrayList<Attendance> atds = dbat.list(sessionID);
                request.setAttribute("session", session);
                request.setAttribute("atds", atds);
                request.getRequestDispatcher("view/EditAttendance.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("Take")) {
            takeAttendance(request, response);
        } else {
            editAttendance(request, response);
        }
    }

    protected void takeAttendance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sessionID = Integer.parseInt(request.getParameter("SessionID"));
        DBContextSession dbss = new DBContextSession();
        Session session = dbss.get(sessionID);

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        ArrayList<Attendance> atds = new ArrayList<>();
        for (int i = 0; i < session.getGroup().getStudents().size(); i++) {
            Student student = session.getGroup().getStudents().get(i);
            Attendance atd = new Attendance();
            DBContextStudent dbst = new DBContextStudent();
            atd.setStudent(dbst.get(student.getId()));
            atd.setSession(session);
            atd.setStatus(request.getParameter("status" + student.getId()));
            atd.setRecordTime(timestamp);
            atd.setDescription(request.getParameter("comment" + student.getId()));
            DBContextLecturer dbl = new DBContextLecturer();
            atd.setTakenBy(dbl.get("sonnt5"));
            atds.add(atd);
        }

        DBContextAttendance dbat = new DBContextAttendance();
        dbat.add(atds);
        request.setAttribute("action", "Attendance taked");
        request.getRequestDispatcher("view/Confirm.jsp").forward(request, response);
    }

    protected void editAttendance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sessionID = Integer.parseInt(request.getParameter("SessionID"));
        DBContextSession dbss = new DBContextSession();
        Session session = dbss.get(sessionID);

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        ArrayList<Attendance> atds = new ArrayList<>();
        for (int i = 0; i < session.getGroup().getStudents().size(); i++) {
            Student student = session.getGroup().getStudents().get(i);
            Attendance atd = new Attendance();
            DBContextStudent dbst = new DBContextStudent();
            atd.setStudent(dbst.get(student.getId()));
            atd.setSession(session);
            atd.setStatus(request.getParameter("status" + student.getId()));
            atd.setRecordTime(timestamp);
            atd.setDescription(request.getParameter("comment" + student.getId()));
            DBContextLecturer dbl = new DBContextLecturer();
            atd.setTakenBy(dbl.get("sonnt5"));
            atds.add(atd);
        }

        DBContextAttendance dbat = new DBContextAttendance();
        dbat.update(atds);
        request.setAttribute("action", "Attendance edited");
        request.getRequestDispatcher("view/Confirm.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
