<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Cards</title>
</head>
<body>
<table style="width:100%">
    <c:forEach var="card" items="${message}" >
        <tr>
            <th>${card.id}</th>
            <th>${card.status}</th>
            <th>${card.cardId}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>