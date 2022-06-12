<%-- 
    Document   : seeStaff
    Created on : Jan 13, 2021, 7:47:20 PM
    Author     : boody_laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jquery-3.5.1.min.js"></script>
        <link href="seeStaff.css" rel="stylesheet" type="text/css" >
    </head>
    <body>
        <h1>Here You Can Find The Staff of Each Subject!</h1>
        <select>
            <option selected> Select Subject</option>
            <option value="web"> Web</option>
            <option value="IS" > IS </option>
            <option value="algorithm" >Algorithm </option>
            <option value="Files"> Files</option>
            <option value="ADS">Advanced SoftWare</option>
            <option value="OS">OS</option>
        </select>
        <br>
    <div1> get Results here </div1>
        <script>
            $(document).ready(function(){
            $("select").change(function(){
                var txt = $("select").val();
                    $.get("findStaff.jsp", {suggest: txt}, function(result,status){
                        $("div1").html(result);
                    });
                });
            });
                    
            
        </script>
        
    <form action="students.jsp">
        <input type="submit" value="Back" />
    </form>
    </body>
</html>
