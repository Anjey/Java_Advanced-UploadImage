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
</head>
<body>
<div class="wrapper">
    <input id="check" type="checkbox"/>
    <label for="check">
        <svg viewbox="0 0 30 30" width="30" height="30" xmlns="http://www.w3.org/2000/svg">
            <path id="one" d="M4 10 H 26 M26 10" stroke="#fff" stroke-width="2" stroke-linecap="round"></path>
            <path id="two" d="M4 20 H 26 M26 20" stroke="#fff" stroke-width="2" stroke-linecap="round"></path>
        </svg>
        Click me
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

                <h2>Welcome ${pageContext.request.userPrincipal.name}</h2>

            </c:if>

            <c:if test="${not empty user}">
                <form:form action="${contextPath}/stopSubmission" method="post">
                    <input type="submit" value="submit">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form:form>
            </c:if>


            <c:if test="${not empty exams}">
                <table id="customers">
                    <tr>
                        <th>Name Surname</th>
                        <th>Speciality</th>
                        <th>University</th>
                        <th>Average mark</th>
                        <th>Accept</th>
                        <th>Refuse</th>
                    </tr>
                    <c:forEach items="${exams}" var="currentExam">
                        <form:form action="${contextPath}/aRApply" method="post">
                            <tr>
                                <td>${currentExam.user.firstName} ${currentExam.user.lastName}</td>
                                <td>${currentExam.subject}</td>
                                <td>${currentExam.mark}</td>
                                <td><img src="data:image/jpg;base64, ${currentExam.user.encodedImage}"></td>

                                <td><input id="${currentExam.user.email}A" type="submit" onclick="setParameter(this.id)"
                                           value="Accept"></td>
                                <td><input id="${currentExam.user.email}R" type="submit" onclick="setParameter(this.id)"
                                           value="Refuse"></td>

                                <input type="hidden" id="${currentExam.user.email}">
                            </tr>
                        </form:form>
                    </c:forEach>
                </table>
            </c:if>


        </div>
    </div>
</div>

<script>
    function setParameter(id) {
        var value = document.getElementById(id).getAttribute("value");
        console.log(value);

        debugger;
        var stringLength = id.length;
        if (stringLength > 1) {
            var userEmail = id.slice(0, stringLength - 1);
            document.getElementById(id).setAttribute("name", "email");
            document.getElementById(id).setAttribute("value", userEmail);


            document.getElementById(userEmail).setAttribute("name", "button");
            document.getElementById(userEmail).setAttribute("value", value);
        }
    }
</script>

</body>
</html>