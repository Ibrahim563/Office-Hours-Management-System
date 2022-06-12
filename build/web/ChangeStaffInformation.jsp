<%-- 
    Document   : ChangeStaffInformation
    Created on : Jan 13, 2021, 6:55:02 PM
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Staff Information</title>
        <link href="signup.css" rel="stylesheet" type="text/css" > 

    </head>
    <body>
        <% 
                String name = session.getAttribute("staffName").toString();
        %>
        <form class="container" onsubmit="return checkForm(this);" method="POST" >
            <table class="table-control"  >
                <div class="header">
                    <h2>Welcome <%=name%></h2>
                </div>
                <tr>
                    <td class="tdlabel">Username:</td>
                    <td class="inputF"><input type="text" name="username" > 
                        <label id="usernameError" class="error"></label></td>
                </tr>
                <tr>
                    <td class="tdlabel">New Password:</td>
                    <td><input type="password" name="pw1" id="pw1">
                    <label id="passwordError" class="error"></label></td>
                </tr>
                <tr>
                    <td class="tdlabel">Confirm Password:</td>
                    <td><input type="password" name="pw2" id="pw2">
                    <label id="confirmPasswordError" class="error"></label></td>
                </tr>
                <tr>
                    <td class="tdlabel">Current Subject</td>
                    <td><input type="text" name="currentsubject" id="currentsubject">
                    <label id="currentSubjectError" class="error"></label></td>
                </tr>
                <tr>
                    <th>Change your department</th>
                </tr>
                <tr>
                    <td>CS: </td>
                    <td> <input type="radio" value="CS" name="department"></td>
                </tr>
                <tr>
                    <td>IS: </td>
                    <td><input type="radio" value="IS" name="department"></td>
                </tr>
                <tr>
                    <td>IT: </td>
                    <td><input type="radio" value="IT" name="department"></td>
                </tr>
                <tr>
                    <td>DS: </td>
                    <td><input type="radio" value="DS" name="department"></td>
                </tr>
                <tr>
                    <td>AI: </td>
                    <td><input type="radio" value="AI" name="department">
                     <label id="departmentError" class="error"></label></td>
                </tr>
                <tr>
                    <td><label id="captcha"></label> </td>
                    <td><input type="text"  id="captchaInput">
                        <label id="captchaError" ></label></td>                    
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Sign-up"></td>
                </tr>
            </table>
        </form>
        <script>
            var captcha = document.getElementById("captcha");
            var no = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var x = no[Math.floor(Math.random() * no.length)];
            for (var i = 0; i < 6; i++) {
                x = x + no[Math.floor(Math.random() * no.length)];
            }
            captcha.innerHTML = x;
            var res = false;

            function checkForm(form) {
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var captchaInput = document.getElementById("captchaInput").value;
                if (form.username.value === '') {
                    var userName = document.getElementById("usernameError");
                    userName.innerHTML = "Error: Username cannot be blank";
                    userName.style.color = "red";
                    form.username.focus();
                    return false;
                } else if (form.pw1.value === '') {
                    var passwordError = document.getElementById("passwordError");
                    passwordError.innerHTML = "Error: Password cannot be blank!";
                    passwordError.style.color = "red";
                    form.email.focus();
                    return false;
                } else if (form.pw2.value === '') {
                    var confirmPasswordError = document.getElementById("confirmPasswordError");
                    confirmPasswordError.innerHTML = "Error: Password cannot be blank!";
                    confirmPasswordError.style.color = "red";
                    form.email.focus();
                    return false;
                }else if (form.pw1.value !== form.pw2.value) {
                    var confirmPasswordError = document.getElementById("confirmPasswordError");
                    confirmPasswordError.innerHTML = "Error: Confirm Password is not equal to Password!";
                    confirmPasswordError.style.color = "red";
                    form.email.focus();
                    return false;
                }else if (form.currentsubject.value === '') {
                    var currentSubjectError = document.getElementById("currentSubjectError");
                    currentSubjectError.innerHTML = "Error: Current subject cannot be blank!";
                    currentSubjectError.style.color = "red";
                    form.email.focus();
                    return false;
                }  else if(form.department.value  === ''){
                    var departmentError = document.getElementById("departmentError");
                    departmentError.innerHTML = "Error: You have to choose a department";
                    departmentError.style.color = "red";
                    form.email.focus();
                    return false;
                } else if (captchaInput!==captcha.innerHTML) {
                    var captchaError = document.getElementById("captchaError");
                    captchaError.innerHTML = "Wrong captcha";
                    captchaError.style.color = "red";
                    return false;
                }
                checkEmail(form.username.value, form.pw1.value, form.currentsubject.value, form.department.value);
                return false;

            }
            function checkEmail(username, pw1, currentsubject, department) {
                var c;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.open("GET", "updateStaffInformation?username=" + username + "&pw1=" + pw1 + "&currentsubject=" + currentsubject + "&department=" + department, true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        alert(xmlhttp.responseText.toString());
                            window.location.href = "staff.jsp";
                        
                    }

                };
            }
        </script>
    </body>
</html>
