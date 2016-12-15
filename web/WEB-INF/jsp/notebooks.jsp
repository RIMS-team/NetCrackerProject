<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> --%>
<%@page contentType="text/html; charset=Windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Notebooks</title>
</head>
<body>
<table style="width:100%">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Location</th>
        <th>Memory type</th>
        <th>Model</th>
        <th>Additional finance number</th>
        <th>Serial number</th>
        <th>Status</th>
    </tr>
    <c:forEach var="note" items="${noteList}" >
        <tr>
            <td align = center>${note.id}</td>
            <td align = center>${note.name}</td>
            <td align = center>${note.location}</td>
            <td align = center>${note.memoryType}</td>
            <td align = center>${note.model}</td>
            <td align = center>${note.additionalFinanceNumber}</td>
            <td align = center>${note.serialNumber}</td>
            <td align = center>${note.status}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
