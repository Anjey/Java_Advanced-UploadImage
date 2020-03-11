<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Welcome</title>
    <link rel="stylesheet" href="css/homeStyle.css">
    <link rel="stylesheet" href="css/ownSubmissionStyle.css">
</head>
<body>
<div class="wrapper">
    <input id="check" type="checkbox"/>
    <label for="check">
        <svg viewbox="0 0 30 30" width="30" height="30" xmlns="http://www.w3.org/2000/svg">
            <path id="one" d="M4 10 H 26 M26 10" stroke="#fff" stroke-width="2" stroke-linecap="round"></path>
            <path id="two" d="M4 20 H 26 M26 20" stroke="#fff" stroke-width="2" stroke-linecap="round"></path>
        </svg>Click me
    </label>
    <aside>
        <div class="top">
            <h2>Menu</h2>
            <ul>
                <li><a href="/home">HOME</a></li>
                <li><a href="/university-control">UNIVERSITY CONTROL</a></li>
                <li><a href="/specialityControl">SPECIALITY CONTROL</a></li>
                <li><a href="/examsResult">EXAMS RESULTS</a></li>
                <li><a href="/getSpecialitiesForSubmission">SUBMISSION APPLY</a></li>
                <li><a href="/ownSubmission">YOUR SUBMISSION</a></li>
                <li><a href="/submissionOnSpeciality">SPECIALITY SUBMISSION</a></li>
                <li><a onclick="document.forms['logoutForm'].submit()">EXIT</a></li>
            </ul>
        </div>
    </aside>

    <div class="main-content">

        <div class="container">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:if>

            <table id="customers">
                <tr>
                    <th>Number</th>
                    <th>Priority</th>
                    <th>Name Surname</th>
                    <th>Speciality</th>
                    <th>University</th>
                    <th>Average mark</th>
                </tr>
            <c:if test="${not empty submissions}">
                <c:forEach items="${submissions}" var="currentSubmission">
                <tr>
                    <td>${currentSubmission.place}</td>
                    <td>${currentSubmission.priority}</td>
                    <td>${currentSubmission.user.firstName}  ${currentSubmission.user.lastName}</td>
                    <td>${currentSubmission.speciality.name}</td>
                    <td>${currentSubmission.speciality.university.name}</td>
                    <td>${currentSubmission.averageMark}</td>
                </tr>
                </c:forEach>
            </c:if>
            </table>
        </div>
    </div>
</div>
</body>
