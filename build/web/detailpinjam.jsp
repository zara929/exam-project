<%-- 
    Document   : detailpinjam
    Created on : Dec 9, 2019, 8:29:16 PM
    Author     : USER
--%>
<%@page import="model.Pinjam"%>
<%@page import="control.Koneksi"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String tgl = null;
    String jml = null;
    String harga = null;
    Pinjam pjm = new Pinjam();
    pjm.setNo_Transaksi(request.getParameter("no_transaksi"));
    ResultSet rs = null;
    Koneksi k = new Koneksi();
    rs = k.st.executeQuery("SELECT * FROM tb_peminjaman where no_transaksi='"+pjm.getNo_Transaksi()+"'");
           if(rs.next())
           {
               tgl=rs.getString("tgl_pinjam");
               jml=rs.getString("jumlah_pinjam");
               harga=rs.getString("harga_pinjam");
           }
%>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3"><h2>Tanggal : <% out.print(tgl);%> || jumlah : <% out.print(jml);%></center></h2></td>
    </tr>
    <tr>
        <td>No. Transaksi</td>
        <td>Kode Film</td>
    </tr>
    <%
        rs=k.st.executeQuery("SELECT pinjam_detail.no_transaksi, pinjam_detail.kd, tb_pinjam.nama"
                + "FROM pinjam_detail, tb_film"
                + "where pinjam_detail.kd=tb_film.kd and pinjam_detail.bo_transaksi='"+pjm.getNo_Transaksi()+"'");
        while (rs.next())
        {
            out.println("<tr class=isi>;"
                    + "<td>" + rs.getString("no_transaksi") + "</td>"
                    + "<td>" + rs.getString("kd") + "</td>"
                    +"</tr>");
        }
    %>
    <tr>
        <td colspan="2"><h3><center>Harga Pinjam</center></h3></td>
        <td><h3><center><% out.print(harga); %></center></h3></td>
    </tr>
</table>
