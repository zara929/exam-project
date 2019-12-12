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
import model.Film;

/**
 *
 * @author USER
 */
public class filmServlet extends HttpServlet {

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

        Film film = new Film();
        Koneksi k = new Koneksi();
        PreparedStatement pst = null;
        int result = 0;

        try (PrintWriter out = response.getWriter()) {
            String aksi = request.getParameter("aksi");
        if (aksi != null) {
                film.setKd(request.getParameter("kd"));
                film.setNama(request.getParameter("nama"));
                film.setGenre(request.getParameter("genre"));
                film.setHarga(request.getParameter("harga"));
                film.setStok(request.getParameter("stok"));
                switch (aksi) {
                    case "Simpan":
                        pst = k.cn.prepareStatement("INSERT INTO tb_film VALUES('"
                                + film.getKd() + "','"
                                + film.getNama() + "','"
                                + film.getGenre() + "','"
                                + film.getHarga() + "','"
                                + film.getStok() + "')");
                        result = pst.executeUpdate();
                            
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data berhasil disimpan');"
                                    + "document.location='index.jsp?hal=InputFilm'"
                                    + "</script>");
                        }
                        break;
                    case "Delete":
                        pst = k.cn.prepareStatement("DELETE FROM tb_film WHERE kd='"
                                + film.getKd() + "'");
                        result = pst.executeUpdate();
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data telah dihapus');"
                                    + "document.location='index.jsp?hal=OutputFilm'"
                                    + "</script>");
                        }
                        break;
                    case "Update":
                        pst = k.cn.prepareStatement("UPDATE tb_film SET nama='"
                                + film.getNama() + "',genre='"
                                + film.getGenre() + "',stok='"
                                + film.getStok() + "',harga='"
                                + film.getHarga() + "'WHERE kd='"
                                + film.getKd() + "'");
                        result = pst.executeUpdate();
                        if (result > 0) {
                            out.println("<script> "
                                    + "alert('Data Telah Diubah');"
                                    + "document.location='index.jsp?hal=OutputFilm'"
                                    + "</script>");
                        }
                    default:
                        break;
                }
            } else {
                /* TODO output your page here. You may use following sample code. */
                out.println("<script> "
                        + "alert('Gagal Proses');"
                        + "document.location='index.jsp?hal.InputFilm'"
                        + "</script>");
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
           Logger.getLogger(filmServlet.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(filmServlet.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(filmServlet.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(filmServlet.class.getName()).log(Level.SEVERE, null, ex);
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