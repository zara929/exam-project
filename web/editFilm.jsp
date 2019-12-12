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
        <title> Edit Data Film</title>
    </head>
    <%
        String kd, nama=null, genre=null, harga=null, stok=null;
        kd=request.getParameter("kd");
        ResultSet rs = null;

        Koneksi k=new Koneksi();
        rs = k.st.executeQuery("SELECT * FROM tb_film WHERE kd='"+ kd +"'");
        if (rs.next()) { 
            kd = rs.getString("kd");
            nama = rs.getString(2);
            genre = rs.getString(3);
            harga = rs.getString(4);
            stok = rs.getString(5);    
        }
    %>
    <body>
       <center>
        <form action="filmServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr><th colspan="3">Rental Film Edy<br>Jl. Pasti Bisa No.49A Jakarta</th></tr>
                    <tr>
                        <td>kode Film</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="kd" value="<%=kd %>" readonly />
                            <input type="hidden" name="kd" value="<%=kd %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>Nama Film</td>
                        <td>:</td>
                        <td><input type="text" name="nama" value="<%=nama %>" /></td>
                    </tr>
                    <tr>
                        <td>Genre</td>
                        <td>:</td>
                        <td>
                            <%
                              if(genre.equalsIgnoreCase("Horror")){  
                            %>
                            <select name="genre">
                                <option value="Horror" selected="selected">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="Action">Action</option>
                                <option value="Fantasi">Fantasi</option>
                                <option value="Comedy">Comedy</option>
                            </select>
                            <%}else if(genre.equalsIgnoreCase("Romance")){  
                            %>
                            <select name="genre">
                                <option value="Horror">Horror</option>
                                <option value="Romance" selected="selected">Romance</option>
                                <option value="Action">Action</option>
                                <option value="Thriller">Fantasi</option>
                                <option value="Comedy">Comedy</option>
                            </select>
                            <%}else if(genre.equalsIgnoreCase("Action")){  
                            %>
                            <select name="genre">
                                <option value="Horror">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="Action" selected="selected">Action</option>
                                <option value="Fantasi">Fantasi</option>
                                <option value="Comedy">Comedy</option>
                            </select>
                            <%}else if(genre.equalsIgnoreCase("Fantasi")){  
                            %>
                            <select name="genre">
                                <option value="Horror">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="Action">Action</option>
                                <option value="Fantasi" selected="selected">Fantasi</option>
                                <option value="Comedy">Comedy</option>
                            </select>
                            <%}else{%>
                            <select name="genre">
                                <option value="Horror">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="Action">Action</option>
                                <option value="Fantasi">Fantasi</option>
                                <option value="Comedy" selected="selected">Comedy</option>
                            </select>
                            <%}%>
                        </td>
                    </tr>
                    <tr>
                        <td>Harga</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="harga" value="<%=harga%>" />
                        </td>
                    </tr>
                    <tr>
                        <td>Stok</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="stok" value="<%=stok %>" />
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
                            <a href="index.jsp?hal=OutputFilm">[Lihat Data]</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
    </body>
</html>