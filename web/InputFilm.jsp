<%-- 
    Document   : InputFilm
    Created on : Nov 6, 2019, 7:23:34 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>From Input Data Film</title>
    </head>
    <body>
       <center>
        <form action="filmServlet" method="POST">
            <table width="667" border="0" height="150" align="center">
                <tbody>
                    <tr><th colspan="3">Roulet Rental</th></tr>
                    <tr>
                        <td>kode Film</td>
                        <td>:</td>
                        <td><input type="text" name="kd" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nama Film</td>
                        <td>:</td>
                        <td><input type="text" name="nama" value="" /></td>
                    </tr>
                    <tr>
                        <td>Genre</td>
                        <td>:</td>
                        <td><select name="genre">
                                <option value="pilih">-Pilih-</option>
                                <option value="Horror">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="Action">Action</option>
                                <option value="Fantasi">Fantasi</option>
                                <option value="Comedy">Comedy</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Harga</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="harga" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>Stok</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="stok" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">.
                            <input type="submit" value="Simpan" name="aksi"  />
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