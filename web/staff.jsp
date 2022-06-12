<%-- 
    Document   : staff
    Created on : Jan 6, 2021, 11:14:55 PM
    Author     : Pc
--%>

<%@page import="Servlet.DatabaseConnection"%>
<%@page import="java.time.OffsetDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff</title>
        <link href="staff.css" rel="stylesheet" type="text/css" >
    </head>

    <body>

        <% String name = session.getAttribute("staffName").toString();%>

        <div class="container">
            <div class="header">
                <h2>Welcome <%=name%>!</h2>
            </div>
            <form action="ChangeStaffInformation.jsp"  id="form" class="form" method="post">
                <button  type="submit">Change your information</button>
            </form>
            <form action="AllStaffMessages.jsp"  id="form" class="form" method="post">
                <button>View All Messages</button>
            </form>
            <form id="form2" class="form2" action="SendMessage.html" method="post">
                <button type="submit">Message A specific Student or Staff Member</button>
            </form>
            <form action="MessageSubjectTeam.html"  id="form" class="form" method="post">
                <button>Message subject team</button>
            </form>
            <form action="SearchStudent.html"  id="form" class="form" method="post">
                <button>Search for a student</button>
            </form>
            <form action="OfficeHoursSlots.html"  id="form" class="form" method="post">
                <button>View Reservation on a specific office hours slot</button>
            </form>
            <form action="CancelReservation.html"  id="form" class="form" method="post">
                <button>Cancel slot reservations</button>
            </form>
            <form action="ReservationHistory.html"  id="form" class="form" method="post">
                <button>View History of reservations</button>
            </form>
            <form action="OfficeHoursSlots_1.html"  id="form" class="form" method="post">
                <button>Manage Office Hours</button>
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
