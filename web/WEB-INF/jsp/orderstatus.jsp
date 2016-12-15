<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 08-Dec-16
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@page contentType="text/html; charset=Windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Order statuses</title>
</head>
<body>
<table style="width:100%">
    <c:forEach var="item" items="${orderstatusList}" >
        <tr>
            <th>${item.id}</th>
            <th>${item.code}</th>
            <th>${item.name}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
