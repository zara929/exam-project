<%-- 
    Document   : InputPelanggan
    Created on : Nov 7, 2019, 6:37:43 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>From Input Data Pelanggan</title>
    </head>
    <body>
        <center>
        <form action="plgnServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <th colspan="3">Data Pelaggan</th>
                    </tr>
                    <tr>
                        <td>NIK</td>
                        <td>:</td>
                        <td><input type="text" name="nik" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nama Lengkap</td>
                        <td>:</td>
                        <td><input type="text" name="nama" value="" /></td>
                    </tr>
                    <tr>
                        <td>Jenis Kelamin</td>
                        <td>:</td>
                        <td>
                            <input type="radio" name="jk" value="laki-laki" />Laki-Laki
                            <input type="radio" name="jk" value="perempuan" />Perempuan
                        </td>
                    </tr>
                    <tr>
                        <td>No.Telp</td>
                        <td>:</td>
                        <td><input type="text" name="telp" value="" /></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>:</td>
                        <td>
                            <textarea name="alamat" rows="4" cols="20"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <input type="submit" value="Simpan" name="aksi" />
                            <input type="reset" value="Batal" name="reset" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <a href="index.jsp?hal=OutputPelanggan">[Lihat data]</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
    </body>
</html>