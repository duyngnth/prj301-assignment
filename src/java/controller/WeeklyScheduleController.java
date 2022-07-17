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
import java.util.ArrayList;
import java.util.Calendar;
import model.Account;
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
        Date date = new Date(calendar.getTime().getTime());
        int year = calendar.get(Calendar.YEAR);
        
        WeekContext wctx = new WeekContext();
        ArrayList<Week> weeks = wctx.list(year);
        int index = 0;
        Week selectedWeek = weeks.get(index);
        for (int i = 0; i < weeks.size(); i++)
            if (weeks.get(i).getStart().before(date) && weeks.get(i).getEnd().after(date)) {
                index = i;
                selectedWeek = weeks.get(index);
                break;
            }
        DBContextTimeSlot dbts = new DBContextTimeSlot();
        ArrayList<TimeSlot> slots = dbts.list();
        
        DBContextSession dbs = new DBContextSession();
        Account account = (Account) request.getSession().getAttribute("account");
        //ArrayList<Session> sessions = dbs.list(currentWeek, account.getUsername());
        ArrayList<Session> sessions = dbs.list(selectedWeek, "sonnt5");
        request.setAttribute("year", year);
        request.setAttribute("weeks", weeks);
        request.setAttribute("selectedWeekStr", selectedWeek.dateListString());
        request.setAttribute("selectedWeek", selectedWeek.dateList());
        request.setAttribute("currentDate", date);
        request.setAttribute("index", index);
        request.setAttribute("slots", slots);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("view/WeeklySchedule.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        Calendar calendar = Calendar.getInstance();
        Date date = new Date(calendar.getTime().getTime());
        int year = calendar.get(Calendar.YEAR);
        
        WeekContext wctx = new WeekContext();
        ArrayList<Week> weeks = wctx.list(year);
        Week selectedWeek = weeks.get(index);
        DBContextTimeSlot dbts = new DBContextTimeSlot();
        ArrayList<TimeSlot> slots = dbts.list();
        
        DBContextSession dbs = new DBContextSession();
        Account account = (Account) request.getSession().getAttribute("account");
        //ArrayList<Session> sessions = dbs.list(selectedWeek, account.getUsername());
        ArrayList<Session> sessions = dbs.list(selectedWeek, "sonnt5");
        request.setAttribute("year", year);
        request.setAttribute("weeks", weeks);
        request.setAttribute("selectedWeekStr", selectedWeek.dateListString());
        request.setAttribute("selectedWeek", selectedWeek.dateList());
        request.setAttribute("currentDate", date);
        request.setAttribute("index", index);
        request.setAttribute("slots", slots);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("view/WeeklySchedule.jsp").forward(request, response);
    }
    
}
