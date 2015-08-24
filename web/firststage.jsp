<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.text.ParseException,java.lang.*,java.sql.*, java.util.*,java.util.Date,java.text.*,java.text.SimpleDateFormat,java.util.concurrent.TimeUnit"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>s h a r e &nbsp;y o u  r &nbsp; I d e a s &nbsp; &amp; &nbsp; T h o u g h t s</title>
        <link href="css/style-ind.css" rel="stylesheet" type="text/css" />
        <style>
            a
            {

                color:#CF3;
                text-decoration:none;
            }
            a:hover
            {

                text-decoration:underline;
                color:#FFF;

            }
        </style>
        <script type="text/javascript">
            function validate()
            {

                var fup = document.getElementById('image_file');
                var fileName = fup.value;
                if (fileName == "")
                {
                    alert("Please upload your Profile Picture..!");
                    document.productForm.image_file.focus();
                    return false;
                }


                var extensions = new Array("jpg", "jpeg", "gif", "png", "bmp");

                var image_file = document.productForm.image_file.value;

                var image_length = document.productForm.image_file.value.length;

                var pos = image_file.lastIndexOf('.') + 1;

                var ext = image_file.substring(pos, image_length);

                var final_ext = ext.toLowerCase();

                for (i = 0; i < extensions.length; i++)
                {
                    if (extensions[i] == final_ext)
                    {
                        return true;
                    }
                }

                alert("You must upload an image file with one of the following extensions: " + extensions.join(', ') + ".");
                return false;
            }
        </script>
    </head>
    <body>
        <%
            String uname = (String) session.getAttribute("uname");
        %>
        

            <!-- Header -->
            <div id="hdr" style="margin:0 auto;"> 
                <div id="logo"> <a href="#"></a> </div>
                <!-- Slogan -->

                <div style="margin-top:-130px;float:right;height:30px;width:400px;margin-right:-50px;"> 
                    <p align="right" style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;padding-top:5px;"> 
                        <span style="margin-right:30px;">Welcome &nbsp;<font style="color:#900;">
                                Admin
                            </font> </span> <span style="margin-right:15px;font-family:'Palatino Linotype','Book Antiqua', Palatino, serif;font-size:24px;font-size:24px;
                                              padding-top:5px;"><a href="adminlogin.jsp" title="you want to logout">Back</a></span> 
                    </p>
                </div>
            </div>

            <!--    <marquee behavior="scroll" direction="left" scrollamount="4" style="font-size:22px;color:#0FF;margin-top:-10px;" >www.chennaisunday.com</marquee>
            -->
            


                    <form name="form" action="" method="post" onsubmit="return validation()">


                        <table bgcolor="" cellpadding="5" cellspacing="5" width="925" border="0">
                            <tr  bgcolor="#3300FF"> 
                                <tr> 
                                    <td colspan="2" align="center"><font size="2"><b> 
                                                <%
                                                    String message = request.getParameter("message");
                                                    if (message != null && message.equalsIgnoreCase("success")) {
                                                        out.println("<font color='Green'>Near Duplicate Page is Deleted.!</font>");
                                                    }
                                                    if (message != null && message.equalsIgnoreCase("fail")) {
                                                        out.println("<font color='red'>Action is Failure!</font>");
                                                    }
                                                %>
                                            </b></font></td>
                                </tr>

                                <tr bgcolor="#ff9900"> 
                                    <td align="center"><font color="#110022"><strong>ID</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>Name</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>Username</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>Password</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>Email</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>DOB</strong></font></td>
                                    <td align="center"><font color="#110022"><strong>Gender</strong></font></td>
                                    <td align="center"> <font color="#110022"><strong>Age</strong></font></td>
                                    <td align="center"> <font color="#110022"><strong>Growth</strong></font></td>

                                </tr>






                                <%
                                    Connection con = null;
                                    PreparedStatement psmt1 = null;
                                    ResultSet rs;
                                    String t = "p";

                                    try {
                                        con = databasecon.getconnection();
                                        psmt1 = con.prepareStatement("select * from user_details");
                                        rs = psmt1.executeQuery();
                                        while (rs.next()) {

                                            String inputString1 = rs.getString(7);
                                            String[] split = inputString1.split("/");
                                            Calendar now = Calendar.getInstance();
                                            Calendar dob = Calendar.getInstance();
                                            Integer day1 = 0;
                                            Integer day2 = 0;
                                            dob.set(Integer.parseInt(split[0]), Integer.parseInt(split[1]), Integer.parseInt(split[2]));
                                            int year1 = now.get(Calendar.YEAR);
                                            int year2 = dob.get(Calendar.YEAR);
                                            Integer age = year1 - year2;
                                            Integer month1 = now.get(Calendar.MONTH);
                                            Integer month2 = dob.get(Calendar.MONTH);
                                            if (month2 > month1) {
                                                age--;
                                            } else if (month1 == month2) {
                                                day1 = now.get(Calendar.DAY_OF_MONTH);
                                                day2 = dob.get(Calendar.DAY_OF_MONTH);
                                                if (day2 > day1) {
                                                    age--;
                                                }
                                            }
                                            String finalAge = age.toString() + " years";
                                            if (age == 0) {
                                                Integer m = month1 - month2;
                                                finalAge = m.toString() + " months";
                                                if (m == 0) {
                                                    Integer d = day1 - day2;
                                                    finalAge = d.toString() + " days";

                                                }
                                            }
                                %>

                                <tr bgcolor="#e0e0e0"> 
                                    <td align="center"> <strong><font color="#00ccff"> <%=rs.getString(1)%> </font></strong></td>
                                    <td align="center"> <strong><font color="#00cc66"> <%=rs.getString(2)%> </font></strong></td>
                                    <td align="center"><strong><font color="#ff0000"> <%=rs.getString(4)%> </font></strong></td>
                                    <td align="center"><strong><font color="#00cc66"> <%=rs.getString(3)%> </font></strong></td>
                                    <td align="center"><strong><font color="#FF3300"> <%=rs.getString(6)%> </font></strong></td>
                                    <td align="center"><strong><font color="#FF3300"> <%=rs.getString(7)%> </font></strong></td>
                                    <td align="center"><strong><font color="#FF3300"> <%=rs.getString(8)%> </font></strong></td>


                                    <td align="center"><strong><font color="#FF3300"> <%=finalAge%> </font></strong></td>
                                    <%
                                        if(rs.getInt("status")==1){%>
                                            <td align="center"><strong><font color="Red">Blocked</font></strong></td>
                                        <%}
                                        else{
                                            Connection con1= null;
                                            try{
                                                con1 = databasecon.getconnection();
                                                String s = rs.getString("uname");
                                                PreparedStatement ps1 = con.prepareStatement("select count(*) from request_status where userfrom='"+s+"' and status='rejected';");
                                                ResultSet rs1 = ps1.executeQuery();
                                                if(rs1.next() && rs1.getInt(1)>=3){%>
                                                   <td align="center"><strong><a href="growth.jsp?q=<%=rs.getString(4)%>"><font color="#dd00ff">Growth</font></a></strong></td>
                                                <%}
                                                else{%>
                                                    <td align="center"><strong><font color="Green">Normal</font></strong></td>
                                                <%}
                                            }
                                            catch(Exception e){
                                                
                                            }
                                            finally{
                                                con1.close();
                                            }
                                        }
                                        
                                    %>
                                    

                                    <%}

                                        } catch (Exception ee) {
                                            out.println(ee.getMessage());
                                        }

                                    %>





                                    </table>







                                    </form>






                                    






                                    </body>

                                    </html>