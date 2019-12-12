<%-- 
    Document   : OutputFilm
    Created on : Nov 6, 2019, 8:03:28 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="control.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Film</title>
    </head>
    <body>
        <table width="667" height="150" border="0" align="center">
            <thead>
                <tr align="center">
                    <td colspan="6"><h3>Data Film</h3></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Kode Film</th>
                    <th>Nama Film</th>
                    <th>Genre</th>
                    <th>Harga</th>
                    <th>Stok</th>
                    <th>Pilihan</th>
                </tr>
                <%
                    String kd,nama,genre,harga,stok;
                    ResultSet rs=null;
                    
                    Koneksi k=new Koneksi();
                    rs=k.st.executeQuery("SELECT * FROM tb_film ORDER BY kd asc");
                    while(rs.next()){
                    kd=rs.getString("kd");
                    nama=rs.getString(2);
                    genre=rs.getString(3);
                    harga=rs.getString(4);
                    stok=rs.getString(5);
                %>
                <tr>
                    <td align="center"><% out.println(kd); %></td>
                    <td><% out.println(nama); %></td>
                    <td align="center"><% out.println(genre); %></td>
                    <td align="center"><% out.println(harga); %></td>
                    <td align="center"><% out.println(stok); %></td>
                    <td>
                        <a href="editFilm.jsp?kd=<% out.print(kd); %>">Edit</a> || 
                        <a href="filmServlet?aksi=Delete&kd=<% out.print(kd); %> ">Hapus</a>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="6" align="center"><h3><a href="index.jsp?hal=InputFilm">Tambah Data</a></h3></td>
                </tr>
            </tbody>
        </table>
      <%k.close(); %>
    </body>
</html>

