<%-- 
    Document   : editFilm
    Created on : Nov 6, 2019, 7:23:34 PM
    Author     : USER
--%>

<%@page import="control.Koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Edit Data Pelanggan</title>
    </head>
    <%
        String nik, nama=null, jk=null, telp=null, alamat=null;
        nik=request.getParameter("nik");
        ResultSet rs = null;

        Koneksi k=new Koneksi();
        rs = k.st.executeQuery("SELECT * FROM tb_pelanggan WHERE nik='"+ nik +"'");
        if (rs.next()) { 
            nik = rs.getString("nik");
            nama = rs.getString(2);
            jk = rs.getString(3);
            telp = rs.getString(4);
            alamat = rs.getString(5);    
        }
    %>
    <body>
       <center>
        <form action="plgnServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr><th colspan="0">Rental Film Edy</th></tr>
                    <tr>
                        <td>NIK</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="nik" value="<%=nik %>" readonly />
                            <input type="hidden" name="nik" value="<%=nik %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>Nama Film</td>
                        <td>:</td>
                        <td><input type="text" name="nama" value="<%=nama %>" /></td>
                    </tr>
                    <tr>
                        <td>Jenis Kelamin</td>
                        <td>:</td>
                        <td>
                           <%
                              if(jk.equalsIgnoreCase("laki-laki")){  
                            %>
                            <input type="radio" name="jk" value="laki-laki" checked="checked" />Laki Laki
                            <input type="radio" name="jk" value="perempuan" />Perempuan
                            <%}else{%>
                            <input type="radio" name="jk" value="laki-laki"  />Laki Laki
                            <input type="radio" name="jk" value="perempuan" checked="checked" />Perempuan
                            <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td>No.Telp</td>
                        <td>:</td>
                        <td><input type="text" name="telp" value="<%=telp %>" /></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>:</td>
                        <td>
                            <textarea name="alamat" rows="4" cols="20"><%=alamat %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <input type="submit" value="Update" name="aksi" />
                            <input type="reset" value="Batal" name="reset" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <a href="index.jsp?hal=OutputPelanggan">[Lihat Data]</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
    </body>
</html>