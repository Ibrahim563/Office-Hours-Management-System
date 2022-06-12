<%-- 
    Document   : students
    Created on : Jan 12, 2021, 11:06:03 AM
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="staff.css" rel="stylesheet" type="text/css" >
    </head>
    <body>

        <% String name = session.getAttribute("studentName").toString();%>
        <div class="container">
            <div class="header">
                <h2>Welcome <%=name%>!</h2>
            </div>
            <form action="ChangeStudentInformation.jsp"  id="form" class="form" method="post">
                <button  type="submit">Change your information</button>
            </form>
            <form action="seeStaff.jsp"  id="form" class="form" method="post">
                <button>view Staff Members </button>
            </form>
            <form id="form2" class="form2" action="seeContact.jsp" method="post">
                <button type="submit">View Staff Contacts</button>
            </form>
            <form action="seeOfficeHours.jsp"  id="form" class="form" method="post">
                <button>View office Hours of Staff Members </button>
            </form>
            <form action="reserveAppointment.jsp"  id="form" class="form" method="post">
                <button>Reserve Appointment</button>
            </form>
            <form action="cancelReservation.jsp"  id="form" class="form" method="post">
                <button>Cancel Reservation</button>
            </form>
            <form action="messageStaff.jsp"  id="form" class="form" method="post">
                <button>Message Staff</button>
            </form>
            <form action="index.html"   id="form" class="form" method="post">
                <button>Sign Out</button>
            </form>

        </div>
                <script>
            setInterval(checkForNotifications, 86400000);

            function checkForNotifications() {
                var c;
                var xmlhttp = new XMLHttpRequest();
                var emailError = document.getElementById("emailError");
                xmlhttp.open("GET", "checkNotification", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        c = xmlhttp.responseText.toString();
                        if (c.localeCompare("1") === 0) {
                            sendNotification();
                        }
                    }

                };
            }
            //////////////////////////////////////////////////////////////////////
            function sendNotification() {
                var c;
                var xmlhttp = new XMLHttpRequest();
                var emailError = document.getElementById("emailError");
                xmlhttp.open("GET", "sendNotification", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                       xmlhttp.responseText;
                       
                    }

                };
            }

        </script>
    </body>
</html>
