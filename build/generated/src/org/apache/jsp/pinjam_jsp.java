package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import control.Koneksi;
import java.sql.ResultSet;
import model.Film;
import model.Pelanggan;
import model.Pinjam;

public final class pinjam_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    Pinjam pjm = new Pinjam();
    Film film = new Film();
    Pelanggan plgn = new Pelanggan();
    Koneksi k = new Koneksi();
    ResultSet rs = null;
    ResultSet qryfilm = null;
    ResultSet qryplgn = null;
    ResultSet qrypjm = null;
    
      out.write("\n");
      out.write("    <h1> pinjaman </h1>\n");
      out.write("    <form action=\"pinjamServlet\" method=\"post\">\n");
      out.write("        <table border=\"0\">\n");
      out.write("            <tr>\n");
      out.write("                <td>No. Transaksi</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td>\n");
      out.write("                    ");

                       try {
                           ResultSet not = null;
                           not = k.st.executeQuery("Select max(right(no_transaksi,8)) as no_transaksi FROM tb_peminjaman");
                           while (not.next()) {
                               if(not.first() == false) {
                                   out.println("<input type='hidden' name='no_transaksi' value='PJ00000001'/>");
                                   out.println("<input type='text' disabled='disabled' value='PJ00000001'/>");
                               } else {
                                   not.last();
                                   int autonot = not.getInt(1) + 1;
                                   String nomert = String.valueOf(autonot);
                                   int noLong = nomert.length();
                                   
                                   for (int a = 1; a< 9 - noLong; a++){
                                     nomert = "0" + nomert;  
                                   }
                                   String nomort = "tr" + nomert;
                                   out.println("<input type='hidden' name='no_transaksi' value'" + nomert + "'/>");
                                   out.println("<input type='hidden' disabled='disabled' value'" + nomert + "'/>");
                               }
                           }
                       } catch (Exception e){
                           out.println(e);
                       }
                    
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>NIK</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td>\n");
      out.write("                    <select name='nik'>\n");
      out.write("                        ");

                            qryplgn = k.st.executeQuery("SELECT nik"
                                    + "FROM tb_pelanggan "
                                    + "WHERE left(nik,2) =11");
                            while (qryplgn.next()){
                                pjm.setNik(qryplgn.getString("nik"));
                        
      out.write("\n");
      out.write("                        <option value\"");
      out.print(pjm.getNik());
      out.write('"');
      out.write('>');
      out.print(pjm.getNik());
      out.write("</option>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Kode film</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td>\n");
      out.write("                    <td>\n");
      out.write("                    <select name='kd'>\n");
      out.write("                        ");

                            qryfilm = k.st.executeQuery("SELECT kd"
                                    + "FROM tb_film "
                                    + "WHERE left(film,2) =11");
                            while (qryfilm.next()){
                                pjm.setKd(qryfilm.getString("kd"));
                        
      out.write("\n");
      out.write("                        <option value\"");
      out.print(pjm.getKd());
      out.write('"');
      out.write('>');
      out.print(pjm.getKd());
      out.write("</option>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Jumlah pinjam</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td><input type=\"text\" name=\"jumlah_pinjam\"></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Tanggal pinjam</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td><input type=\"date\" name=\"tgl_pinjam\"/></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Harga pinjam</td>\n");
      out.write("                <td>:</td>\n");
      out.write("                <td align=\"center\" colspan=\"3\"><input type=\"submit\" name=\"aksi\" value=\"insert\" class=\"button\"</td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </form>\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("    ");

        rs = k.st.executeQuery("SELECT *from tb_peminjaman");
        while (rs.next()){
            out.println("<tr class=isi>"
                    +"<td><a href=index.jsp?hal=detailpinjam&no_transaksi=" + rs.getString(1) + " target='_blank'>"+ rs.getString(1) +"</a></td>"
                    +"<td>" + rs.getString(2) + "</td>"
                    +"<td>" + rs.getString(3) + "</td>"
                    +"<td>" + rs.getString(4) + "</td>"
                    +"<td>" + rs.getString(5) + "</td>"
                    +"<td>" + rs.getString(6) + "</td>"
                    +"<td><a href=pinjamServlet?aksi=Delete&no_transaksi" + rs.getString(1) + ">hapus</a></td>"
                    +"</tr>");
        }
    
      out.write("\n");
      out.write("</table>");
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
