<%-- 
    Document   : OutputPelanggan
    Created on : Oct 31, 2019, 10:248:00 PM
    Author     : USER
--%>

<%@page import="java.sql.*"%>
<%@page import="control.Koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Pelanggan</title>
    </head>
    <body>
        <table width="667" height="150" border="0" align="center">
            <thead>
                <tr align="center">
                    <td colspan="6"><h3>Data Pelanggan</h3></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Nik</th>
                    <th>Nama</th>
                    <th>Jenis Kelamin</th>
                    <th>Telp</th>
                    <th>Alamat</th>
                    <th>Pilihan</th>
                </tr>
                <%
                    String nik,nama,jk,telp,alamat;
                    ResultSet rs=null;
                    
                    Koneksi k=new Koneksi();
                    rs=k.st.executeQuery("SELECT * FROM tb_pelanggan ORDER BY nik");
                    while(rs.next()){
                    nik=rs.getString("nik");
                    nama=rs.getString(2);
                    jk=rs.getString(3);
                    telp=rs.getString(4);
                    alamat=rs.getString(5);
                %>
                <tr>
                    <td align="center"><% out.println(nik); %></td>
                    <td><% out.println(nama); %></td>
                    <td align="center"><% out.println(jk); %></td>
                    <td align="center"><% out.println(telp); %></td>
                    <td><% out.println(alamat); %></td>
                    <td><a href="editPelanggan.jsp?nik=<% out.print(nik);%>">Edit</a> || 
                        <a href="plgnServlet?aksi=Delete&nik=<% out.print(nik);%>">Hapus</a>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="6" align="center"><h3><a href="index.jsp?hal=InputPelanggan">Tambah Data</a></h3></td>
                </tr>
            </tbody>
        </table>
    <%k.close(); %>
    </body>
</html>
