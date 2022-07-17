<%-- 
    Document   : AttendanceTaking
    Created on : 17-Jul-2022, 12:07:47
    Author     : duyng
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance taking</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <br>
        <div class="container text-center">
            <h4>Attendance taking sessions of <fmt:formatDate pattern = "dd/MM/yyyy" value ="${today}"/></h4>
            <table style="margin-left: auto; margin-right: auto" cellpadding="4">
                <c:forEach items="${sessions}" var="ss" varStatus="ss_loop">
                    <form action="AttendanceTaking" method="GET">
                        <tr>
                            <input type="hidden" name="SessionID" value="${ss.id}">
                            <td style="text-align: left">${ss.group.name} | ${ss.group.course.name}</td>
                            <td>
                                <input type="submit" name="action" value="Take"
                                       <c:if test="${takePermissions.get(ss_loop.index) eq false}">
                                           disabled="disabled"
                                       </c:if>
                                       >
                            </td>
                            <td>
                                <input type="submit" name="action" value="Edit"
                                       <c:if test="${editPermissions.get(ss_loop.index) eq false}">
                                           disabled="disabled"
                                       </c:if>
                                       >
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
