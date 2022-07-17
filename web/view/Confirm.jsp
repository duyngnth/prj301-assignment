<%-- 
    Document   : Confirm
    Created on : 17-Jul-2022, 15:49:34
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var count = 3;
            function redirect()
            {
                count --;
                document.getElementById('timer').innerHTML = count;
                if(count == 0)
                    window.location.href = 'Home';
            }
            setInterval(redirect, 1000);
        </script>
    </head>
    <body>
        ${requestScope.action} successfully!<br/>
        Redirect to Homepage after <span id="timer">3</span> seconds
    </body>
</html>
