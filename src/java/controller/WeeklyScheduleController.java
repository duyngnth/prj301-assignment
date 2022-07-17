/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContextSession;
import dal.DBContextTimeSlot;
import dal.WeekContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import model.Session;
import model.TimeSlot;
import model.Week;

/**
 *
 * @author duyng
 */
public class WeeklyScheduleController extends BaseRequiredAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        int year = calendar.get(Calendar.YEAR);
        
        Date date = new Date(System.currentTimeMillis());
        Time now = Time.valueOf((new Time(System.currentTimeMillis()).toString()));

        // Fake current time
        //Date date = Date.valueOf("2022-07-01");
        //Time now = Time.valueOf("15:00:00");
        
        WeekContext wctx = new WeekContext();
        ArrayList<Week> weeks = wctx.list(year);
        int index = 0;
        Week selectedWeek = weeks.get(index);
        for (int i = 1; i < weeks.size(); i++) {
            if (weeks.get(i).getStart().before(date) || weeks.get(i).getStart().toString().equals(date.toString()))
                if (weeks.get(i).getEnd().after(date) || weeks.get(i).getEnd().toString().equals(date.toString())) {
                    index = i;
                    selectedWeek = weeks.get(index);
                }
        }
        DBContextTimeSlot dbts = new DBContextTimeSlot();
        ArrayList<TimeSlot> slots = dbts.list();

        DBContextSession dbs = new DBContextSession();
        ArrayList<Session> sessions = dbs.list(selectedWeek, getCurrentSession(request).getUsername());
        request.setAttribute("year", year);
        request.setAttribute("weeks", weeks);
        request.setAttribute("selectedWeekStr", selectedWeek.dateListString());
        request.setAttribute("selectedWeek", selectedWeek.dateList());
        request.setAttribute("today", date);
        request.setAttribute("now", now);
        request.setAttribute("index", index);
        request.setAttribute("slots", slots);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("view/WeeklySchedule.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        Date date = new Date(System.currentTimeMillis());
        int year = Integer.parseInt(request.getParameter("year"));
        Time now = Time.valueOf((new Time(System.currentTimeMillis()).toString()));

        // Fake current time
//        Date date = Date.valueOf("2022-07-13");
//        Time now = Time.valueOf("15:00:00");
        WeekContext wctx = new WeekContext();
        ArrayList<Week> weeks = wctx.list(year);
        Week selectedWeek = weeks.get(index);
        DBContextTimeSlot dbts = new DBContextTimeSlot();
        ArrayList<TimeSlot> slots = dbts.list();

        DBContextSession dbs = new DBContextSession();
        ArrayList<Session> sessions = dbs.list(selectedWeek, getCurrentSession(request).getUsername());
        request.setAttribute("year", year);
        request.setAttribute("weeks", weeks);
        request.setAttribute("selectedWeekStr", selectedWeek.dateListString());
        request.setAttribute("selectedWeek", selectedWeek.dateList());
        request.setAttribute("today", date);
        request.setAttribute("now", now);
        request.setAttribute("index", index);
        request.setAttribute("slots", slots);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("view/WeeklySchedule.jsp").forward(request, response);
    }

}
