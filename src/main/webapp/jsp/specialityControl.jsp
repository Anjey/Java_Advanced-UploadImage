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
    <link rel="stylesheet" href="css/specialityControl.css">
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
            </c:if>

            <form:form method="POST" action="${contextPath}/addSpeciality" modelAttribute="speciality">
            <div class="speciality-data">

                <c:if test="${not empty universities}">
                    <select id="university" name="university"> </select>
                    <c:forEach items="${universities}" var="currentUniversity">
                        <script>
                            document.getElementById('university').innerHTML +=
                                "<option value=\"${currentUniversity.id}\"> ${currentUniversity.name} </option>"
                        </script>
                    </c:forEach>
                    <form:input path="name" id="speciality-name" type="text" name="speciality-name" placeholder="Speciality name"/>
                    <form:input path="numberOfStudentsForEntering" id="number-of-students" type="text" name="number-of-students"
                           placeholder="Number of students"/>
                </c:if>

            </div>

            <div class="subject-data">
                <c:if test="${not empty subjects}">
                    <div class="subject">
                        <div class="subject-name">
                            <select id="subject1" name="subject1"></select>
                        </div>
                        <div class="percent">
                            <input type="text" name="subjectValue1"> %
                        </div>
                    </div>

                    <div class="subject">
                        <div class="subject-name">
                            <select id="subject2" name="subject2"></select>
                        </div>
                        <div class="percent">
                            <input type="text" name="subjectValue2"> %
                        </div>
                    </div>

                    <div class="subject">
                        <div class="subject-name">
                            <select id="subject3" name="subject3"></select>
                        </div>
                        <div class="percent">
                            <input type="text" name="subjectValue3"> %
                        </div>
                    </div>

                    <div class="subject">
                        <div class="subject-name">
                            <select id="subject4" name="subject4"></select>
                        </div>
                        <div class="percent">
                            <input type="text" name="subjectValue4"> %
                        </div>
                    </div>


                    <div class="subject">
                        <div class="subject-name">
                            <select id="subject5" name="subject5">
                                <option value="CERTIFICATE">CERTIFICATE</option>
                            </select>
                        </div>
                        <div class="percent">
                            <input type="text" name="subjectValue5"> %
                        </div>
                    </div>
                    <c:forEach items="${subjects}" var="currentSubject">
                        <script>
                            var tag = "<option value=\"${currentSubject}\">${currentSubject}</option>"
                            document.getElementById('subject1').innerHTML += tag;
                            document.getElementById('subject2').innerHTML += tag;
                            document.getElementById('subject3').innerHTML += tag;
                            document.getElementById('subject4').innerHTML += tag;
                        </script>
                    </c:forEach>

                </c:if>
            </div>



<%--                <form:input path="name" id="hiden-name"/>--%>
<%--                <form:input path="numberOfStudentsForEntering" id="hiden-number"/>--%>
<%--                <form:input path="university" id="hiden-university" name="hiden-university"/>--%>
<%--                <input id="hiden-university" name="hiden-university"/>--%>
                <%--                <form:input path="name"/>--%>
                <%--                <form:input path="name"/>--%>
                <div class="send-speciality-data">
                    <input type="submit" value="Apply" id="submitBtn">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                </div>
            </form:form>

            <%--           --%>
            <%--                <form:input path="name" value=""/>--%>
            <%--                <form:input path="numberOfStudentsForEntering" />--%>
            <%--                <form:input path="numberOfStudentsForEntering" />--%>

        </div>
    </div>
</div>

<%--<script>--%>
<%--    submitBtn.onclick = function () {--%>
<%--            document.getElementById("hiden-name").value = document.getElementById("speciality-name").value;--%>
<%--            document.getElementById("hiden-number").value = document.getElementById("number-of-students").value;--%>
<%--            document.getElementById("hiden-university").value =--%>
<%--                document.getElementById("university").value + ' ' + document.getElementById("university").innerText;--%>
<%--    };--%>
<%--</script>--%>

</body>
