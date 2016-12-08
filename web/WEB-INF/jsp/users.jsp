<%@page contentType="text/html; charset=Windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Users</title>
</head>
<body>
<table style="width:100%">
    <c:forEach var="user" items="${userList}" >
        <tr>
            <th>${user.id}</th>
            <th>${user.phoneNumber}</th>
            <th>${user.fullName}</th>
            <th>${user.eMail}</th>
            <th>${user.password}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>