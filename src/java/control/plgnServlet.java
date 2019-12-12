/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pelanggan;

/**
 *
 * @author USER
 */
public class plgnServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");

        Pelanggan plgn = new Pelanggan();
        Koneksi k = new Koneksi();
        PreparedStatement pst = null;
        int result = 0;

        try (PrintWriter out = response.getWriter()) {
            String aksi = request.getParameter("aksi");
            if (aksi != null) {
                plgn.setNik(request.getParameter("nik"));
                plgn.setNama(request.getParameter("nama"));
                plgn.setAlamat(request.getParameter("alamat"));
                plgn.setJk(request.getParameter("jk"));
                plgn.setTelp(request.getParameter("telp"));
                switch (aksi) {
                    case "Simpan":
                        pst = k.cn.prepareStatement("INSERT INTO tb_pelanggan VALUES('"
                                + plgn.getNik() + "','"
                                + plgn.getNama() + "','"
                                + plgn.getJk() + "','"
                                + plgn.getTelp() + "','"
                                + plgn.getAlamat() + "')");
                        result = pst.executeUpdate();
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data berhasil disimpan');"
                                    + "document.location='index.jsp?hal=InputPelanggan'"
                                    + "</script>");
                        }
                        break;
                    case "Delete":
                        pst = k.cn.prepareStatement("DELETE FROM tb_pelanggan WHERE nik='"
                                + plgn.getNik() + "'");
                        result = pst.executeUpdate();
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data telah dihapus');"
                                    + "document.location='index.jsp?hal=OutputPelanggan'"
                                    + "</script>");
                        }
                        break;
                   case "Update":
                        pst = k.cn.prepareStatement("UPDATE tb_pelanggan SET nama='"
                                + plgn.getNama() + "',jk='"
                                + plgn.getJk() + "',telp='"
                                + plgn.getTelp() + "',alamat='"
                                + plgn.getAlamat() + "'WHERE nik='"
                                + plgn.getNik() + "'");
                        result = pst.executeUpdate();
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data Telah Diubah');"
                                    + "document.location='index.jsp?hal=OutputPelanggan'"
                                    + "</script>");
                        }
                    default:
                        break;
                }
            } else {
                /* TODO output your page here. You may use following sample code. */
                out.println("<script>");
                out.println("<alert('Gagal Proses')>");
                out.println("document.localtion='index?hal=InputPelanggan'");
                out.println("</script>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (SQLException ex) {
           Logger.getLogger(plgnServlet.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(plgnServlet.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (SQLException ex) {
           Logger.getLogger(plgnServlet.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(plgnServlet.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
