<%@page contentType="text/html; charset=Windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inventory statuses</title>
</head>
<body>
<table style="width:100%">
    <c:forEach var="item" items="${inventstatusList}" >
        <tr>
            <th>${item.id}</th>
            <th>${item.code}</th>
            <th>${item.name}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>

