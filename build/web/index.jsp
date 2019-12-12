<%-- 
    Document   : index
    Created on : Nov 15, 2019, 9:10:42 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>R3 Film Rental 1.0</title>
        <link rel="stylesheet" type="text/css" href="config/style.css">
    </head>
    <body>
        <ul>
            <li><a>Home</a></li>
            <li><a>Master</a>
                <ul>
                    <li><a>Data Film</a></li>
                    <li><a>Data Pelanggan</a></li>
                </ul>
            </li>
            
            <li><a>Transaksi</a>
                <ul>
                    <li><a>Kas Keluar</a></li>
                    <li><a>Kas Masuk</a></li>
                </ul>
            </li>
            
            <li><a>Laporan</a>
                <ul>
                    <li><a>Laporan Master</a></li>
                    <li><a>Laporan Pinjam</a></li>
                </ul>
            </li>
            
            <li><a>About Us</a></li>
            
            
        </ul>
                <div>
                    <table>
                        <tr>
                            <td>
                                <%--<%@include file="home.jsp" %> --%>
                            </td>
                            <td>
                               <c:choose>
                                    <c:when test="${param.hal=='home'}">
                                       <%@include file="home.jsp" %>
                                   </c:when>
                                   <c:when test="${param.hal=='OutputFilm'}">
                                       <%@include file="OutputFilm.jsp" %>
                                   </c:when>
                                   <c:when test="${param.hal=='editFilm'}">
                                       <%@include file="editFilm.jsp" %>
                                   </c:when>
                                   <c:when test="${param.hal=='InputFilm'}">
                                       <%@include file="InputFilm.jsp" %>
                                   </c:when>
                                   <c:when test="${param.hal=='OutputPelanggan'}">
                                       <%@include file="OutputPelanggan.jsp" %>
                                   </c:when>
                                    <c:when test="${param.hal=='editPelanggan'}">
                                       <%@include file="editPelanggan.jsp" %>
                                   </c:when>
                                    <c:when test="${param.hal=='InputPelanggan'}">
                                       <%@include file="InputPelanggan.jsp" %>
                                   </c:when>
                                   <c:otherwise>
                                        <%@include file="home.jsp" %>
                                   </c:otherwise>
                               </c:choose>
                        </tr>
                    </table>
                            
                </div>
                <div style="clear: both;"></div>
            </div>
        </div>
    </body>
</html>
