<%-- 
    Document   : GroupAttendanceReport
    Created on : 17-Jul-2022, 20:48:29
    Author     : duyng
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group attendance report</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br/>
        <div class="container">
            <div class="timetable-img text-center">
                <img src="img/content/timetable.png" alt="">
            </div>
            <p>Attendance report for <b>${group.name}</b> in <b>${group.course.id}</b> course with lecturer 
                <b>${group.lecturer.name}<b></p>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-orange">
                            <th rowspan="2" class="text-uppercase text-white text-center">
                                ROLLNUMBER
                            </th>
                            <th rowspan="2" class="text-uppercase text-white text-center">
                                STUDENT NAME
                            </th>
                            <th rowspan="2" class="text-uppercase text-white text-center">
                                ABSENT(%) SO FAR
                            </th>
                            <c:forEach items="${sessions}" var="ss" varStatus="ss_loop">
                                <td class="text-white text-center">
                                    <fmt:formatDate pattern = "dd/MM" value="${ss.date}"/>
                                </td>
                            </c:forEach>
                        </tr>
                        <tr class="bg-orange">
                            <c:forEach items="${sessions}" var="ss" varStatus="ss_loop">
                                <td class="text-white text-center">
                                    ${ss.sessionNumber}
                                </td>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${students}" var="st" varStatus="st_loop">
                            <tr style="text-decoration: none">
                                <td class="text-center">${st.id}</td>
                                <td class="text-left" nowrap>${st.getFullname()}</td>
                                <td class="text-center">${percents.get(st_loop.index)}%</td>
                                <c:forEach items="${sessions}" var="ss" varStatus="ss_loop">
                                    <c:forEach items="${atds}" var="atd" varStatus="atd_loop">
                                        <c:if test="${atd.student.id eq st.id && atd.session.id eq ss.id}">
                                            <c:if test="${atd.status == 'Attended'}">
                                                <td class="text-center" style="color: green">P</td>
                                            </c:if>
                                            <c:if test="${atd.status == 'Absent'}">
                                                <td class="text-center" style="color: red">A</td>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
