/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DBContextSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import model.Session;

/**
 *
 * @author duyng
 */
public class SessionDetailController extends BaseRequiredAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sID = Integer.parseInt(request.getParameter("ID"));
        DBContextSession dbss = new DBContextSession();
        Session session = dbss.get(sID);
        
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        String dayOfWeek = sdf.format(session.getDate());

        request.setAttribute("session", session);
        request.setAttribute("dayOfWeek", dayOfWeek);
        request.getRequestDispatcher("view/SessionDetail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
