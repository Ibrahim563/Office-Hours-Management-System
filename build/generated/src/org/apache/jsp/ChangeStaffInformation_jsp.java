package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ChangeStaffInformation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Change Staff Information</title>\n");
      out.write("        <link href=\"signup.css\" rel=\"stylesheet\" type=\"text/css\" > \n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 
                String name = session.getAttribute("staffName").toString();
        
      out.write("\n");
      out.write("        <form class=\"container\" onsubmit=\"return checkForm(this);\" method=\"POST\" >\n");
      out.write("            <table class=\"table-control\"  >\n");
      out.write("                <div class=\"header\">\n");
      out.write("                    <h2>Welcome ");
      out.print(name);
      out.write("</h2>\n");
      out.write("                </div>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"tdlabel\">Username:</td>\n");
      out.write("                    <td class=\"inputF\"><input type=\"text\" name=\"username\" > \n");
      out.write("                        <label id=\"usernameError\" class=\"error\"></label></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"tdlabel\">Password:</td>\n");
      out.write("                    <td><input type=\"password\" name=\"pw1\" id=\"pw1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"tdlabel\">Confirm Password:</td>\n");
      out.write("                    <td><input type=\"password\" name=\"pw2\" id=\"pw2\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"tdlabel\">Current Subject</td>\n");
      out.write("                    <td><input type=\"password\" name=\"pw2\" id=\"pw2\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Change your department</th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>CS: </td>\n");
      out.write("                    <td> <input type=\"radio\" value=\"CS\" name=\"department\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>IS: </td>\n");
      out.write("                    <td><input type=\"radio\" value=\"IS\" name=\"department\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>IT: </td>\n");
      out.write("                    <td><input type=\"radio\" value=\"IT\" name=\"department\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>DS: </td>\n");
      out.write("                    <td><input type=\"radio\" value=\"DS\" name=\"department\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>AI: </td>\n");
      out.write("                    <td><input type=\"radio\" value=\"AI\" name=\"department\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><label id=\"captcha\"></label> </td>\n");
      out.write("                    <td><input type=\"text\"  id=\"captchaInput\">\n");
      out.write("                        <label id=\"captchaError\" ></label></td>                    \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\"><input type=\"submit\" value=\"Sign-up\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <script>\n");
      out.write("            var captcha = document.getElementById(\"captcha\");\n");
      out.write("            var no = \"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\";\n");
      out.write("            var x = no[Math.floor(Math.random() * no.length)];\n");
      out.write("            for (var i = 0; i < 6; i++) {\n");
      out.write("                x = x + no[Math.floor(Math.random() * no.length)];\n");
      out.write("            }\n");
      out.write("            captcha.innerHTML = x;\n");
      out.write("            var res = false;\n");
      out.write("\n");
      out.write("            function checkForm(form) {\n");
      out.write("                var re = /^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$/;\n");
      out.write("                var captchaInput = document.getElementById(\"captchaInput\").value;\n");
      out.write("                if (form.username.value === '') {\n");
      out.write("                    var userName = document.getElementById(\"usernameError\");\n");
      out.write("                    userName.innerHTML = \"Error: Username cannot be blank\";\n");
      out.write("                    userName.style.color = \"red\";\n");
      out.write("                    form.username.focus();\n");
      out.write("                    return false;\n");
      out.write("                } else if (form.email.value === '') {\n");
      out.write("                    var emailError = document.getElementById(\"emailError\");\n");
      out.write("                    emailError.innerHTML = \"Error: Password cannot be blank!\";\n");
      out.write("                    emailError.style.color = \"red\";\n");
      out.write("                    form.email.focus();\n");
      out.write("                    return false;\n");
      out.write("                } else if (form.username.value.length < 6) {\n");
      out.write("                    var usernameError = document.getElementById(\"usernameError\");\n");
      out.write("                    usernameError.innerHTML = \"Error: Username must contain at least six characters!\";\n");
      out.write("                    usernameError.style.color = \"red\";\n");
      out.write("                    form.username.focus();\n");
      out.write("                    return false;\n");
      out.write("                } else if (form.email.value === form.username.value) {\n");
      out.write("                    var usernameError = document.getElementById(\"usernameError\");\n");
      out.write("                    usernameError.innerHTML = \"Error: Username must be different from Email!\";\n");
      out.write("                    usernameError.style.color = \"red\";\n");
      out.write("                    form.username.focus();\n");
      out.write("                    return false;\n");
      out.write("                } else if (!re.test(form.email.value)) {\n");
      out.write("                    var emailError = document.getElementById(\"emailError\");\n");
      out.write("                    emailError.innerHTML = \"Error: Email must contain at least one number (0-9)!\";\n");
      out.write("                    emailError.style.color = \"red\";\n");
      out.write("                    form.email.focus();\n");
      out.write("                    return false;\n");
      out.write("                } else if (captchaInput!==captcha.innerHTML) {\n");
      out.write("                    var captchaError = document.getElementById(\"captchaError\");\n");
      out.write("                    captchaError.innerHTML = \"Wrong captcha\";\n");
      out.write("                    captchaError.style.color = \"red\";\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                checkEmail(form.email.value, form.username.value, form.role.value, form.department.value);\n");
      out.write("                return false;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            function checkEmail(email, username, role, department) {\n");
      out.write("                var c;\n");
      out.write("                var xmlhttp = new XMLHttpRequest();\n");
      out.write("                var emailError = document.getElementById(\"emailError\");\n");
      out.write("                xmlhttp.open(\"GET\", \"createuser?email=\" + email + \"&username=\" + username + \"&role=\" + role + \"&department=\" + department, true);\n");
      out.write("                xmlhttp.send();\n");
      out.write("                xmlhttp.onreadystatechange = function () {\n");
      out.write("                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)\n");
      out.write("                    {\n");
      out.write("                        c = xmlhttp.responseText.toString();\n");
      out.write("                        if (c.localeCompare(\"1\") === 0) {\n");
      out.write("                            emailError.innerHTML = \"This email is already registered\";\n");
      out.write("                            emailError.style.color = \"red\";\n");
      out.write("                        } else {\n");
      out.write("                            window.location.href = \"index.html\";\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                };\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
