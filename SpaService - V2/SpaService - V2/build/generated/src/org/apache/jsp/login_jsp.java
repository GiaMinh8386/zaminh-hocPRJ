package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Login - Your App Name</title>\n");
      out.write("    <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <script>\n");
      out.write("        tailwind.config = {\n");
      out.write("            theme: {\n");
      out.write("                extend: {\n");
      out.write("                    fontFamily: {\n");
      out.write("                        sans: ['Poppins', 'sans-serif'],\n");
      out.write("                    },\n");
      out.write("                    colors: {\n");
      out.write("                        primary: '#6366F1',\n");
      out.write("                        secondary: '#F472B6',\n");
      out.write("                    },\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body class=\"bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500 min-h-screen flex items-center justify-center p-4\">\n");
      out.write("    <div class=\"bg-white w-full max-w-md rounded-3xl shadow-2xl overflow-hidden\">\n");
      out.write("        <div class=\"p-8\">\n");
      out.write("            <h2 class=\"text-4xl font-bold text-center mb-6 text-gray-800\">Welcome Back</h2>\n");
      out.write("            <form action=\"MainController\" method=\"post\" class=\"space-y-6\">\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"userId\" class=\"text-sm font-medium text-gray-700 block mb-1\">User ID</label>\n");
      out.write("                    <input type=\"text\" id=\"userId\" name=\"userId\" required\n");
      out.write("                           class=\"w-full px-4 py-3 rounded-lg bg-gray-100 border-transparent focus:border-primary focus:bg-white focus:ring-0 text-sm\">\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"password\" class=\"text-sm font-medium text-gray-700 block mb-1\">Password</label>\n");
      out.write("                    <input type=\"password\" id=\"password\" name=\"password\" required\n");
      out.write("                           class=\"w-full px-4 py-3 rounded-lg bg-gray-100 border-transparent focus:border-primary focus:bg-white focus:ring-0 text-sm\">\n");
      out.write("                </div>\n");
      out.write("                <input type=\"hidden\" name=\"action\" value=\"Login\">\n");
      out.write("                <input type=\"hidden\" name=\"function\" value=\"login\">\n");
      out.write("                <button type=\"submit\" \n");
      out.write("                        class=\"w-full py-3 font-semibold rounded-lg bg-gradient-to-r from-primary to-secondary text-white hover:opacity-90 transition duration-300\">\n");
      out.write("                    Sign In\n");
      out.write("                </button>\n");
      out.write("            </form>\n");
      out.write("            <p class=\"text-center mt-8 text-sm text-gray-600\">\n");
      out.write("                Don't have an account? <a href=\"register.jsp\" class=\"font-semibold text-primary hover:text-secondary\">Create one</a>\n");
      out.write("            </p>\n");
      out.write("            ");
 String error = request.getParameter("error");
               if ("invalid".equals(error)) { 
      out.write("\n");
      out.write("                <p class=\"text-red-500 text-center mt-4 text-sm font-medium\">Invalid username or password</p>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>");
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
