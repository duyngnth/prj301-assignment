/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContextAttendance;
import dal.DBContextGroup;
import dal.DBContextSession;
import dal.DBContextStudent;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attendance;
import model.Group;
import model.Session;
import model.Student;

/**
 *
 * @author duyng
 */
public class AttendanceReportController extends BaseRequiredAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String GroupID = request.getParameter("GroupID");

        if (GroupID == null) {
            DBContextGroup dbg = new DBContextGroup();
            ArrayList<Group> groups = dbg.list(getCurrentSession(request).getUsername());

            request.setAttribute("groups", groups);
            request.getRequestDispatcher("view/AttendanceReport.jsp").forward(request, response);
        } else {
            String Session = request.getParameter("Session");
            int groupID = Integer.parseInt(GroupID);
            DBContextGroup dbg = new DBContextGroup();
            Group group = dbg.get(groupID);

            if (Session == null) {
                DBContextSession dbss = new DBContextSession();
                ArrayList<Session> sessions = dbss.listByGroup(groupID);
                
                request.setAttribute("group", group);
                request.setAttribute("sessions", sessions);
                request.getRequestDispatcher("view/GroupAttendance.jsp").forward(request, response);
            } else {
                if (Session.equals("All")) {
                    DBContextStudent dbst = new DBContextStudent();
                    ArrayList<Student> students = dbst.listByGroup(group.getName(), group.getCourse().getId());
                    DBContextSession dbss = new DBContextSession();
                    ArrayList<Session> sessions = dbss.listByGroup(groupID);

                    DBContextAttendance dba = new DBContextAttendance();
                    ArrayList<Attendance> atds = dba.listByGroup(groupID);

                    ArrayList<Integer> percents = new ArrayList<>();
                    for (int i = 0; i < students.size(); i++) {
                        int absent = 0;
                        int total = atds.size() / students.size();
                        for (int j = 0; j < atds.size(); j++) {
                            if (atds.get(j).getStudent().getId().equals(students.get(i).getId()) && atds.get(j).getStatus().equals("Absent")) {
                                absent++;
                            }
                        }
                        percents.add((int) (Math.ceil(absent * 100.0 / total)));
                    }

                    request.setAttribute("group", group);
                    request.setAttribute("students", students);
                    request.setAttribute("sessions", sessions);
                    request.setAttribute("atds", atds);
                    request.setAttribute("percents", percents);
                    request.getRequestDispatcher("view/GroupAttendanceReport.jsp").forward(request, response);
                } else {
                    int sessionID = Integer.parseInt(Session);
                    DBContextSession dbss = new DBContextSession();
                    Session session = dbss.get(sessionID);
                    
                    DBContextAttendance dbat = new DBContextAttendance();
                    ArrayList<Attendance> atds = dbat.list(sessionID);
                    request.setAttribute("session", session);
                    request.setAttribute("atds", atds);
                    request.getRequestDispatcher("view/SessionAttendanceReport.jsp").forward(request, response);
                }
            }

        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
