<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>User</title>
</head>
<body>
<table style="width:100%">
    <c:forEach var="user" items="${message}" >
    <tr>
        <th>${user.id}</th>
        <th>${user.phoneNumber}</th>
        <th>${user.fullName}</th>
        <th>${user.eMail}</th>
    </tr>
    </c:forEach>
</table>
</body>
</html>