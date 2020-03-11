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
    <link rel="stylesheet" href="css/submissionStyle.css">
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



           <form:form method="POST" action="${contextPath}/submissionDocuments"> <%--modelAttribute="speciality">--%>
<%--            <div class="speciality-data">--%>

                <c:if test="${not empty specialities}">
                    <c:forEach items="${specialities}" var="currentSpeciality">
                        <div class="card">
                            <div class="left-side">
                                <div class="top">
                                    <h3>${currentSpeciality.name}</h3>
                                </div>
                                <div class="bottom">
                                    <c:forEach items="${currentSpeciality.subjectsAndValue}" var="currentSubject">
                                    <div class="subject-and-value">
                                        <div class="subject">
                                            <h4>${currentSubject.subjects}</h4>
                                        </div>
                                        <div class="value">
                                            <h4>${currentSubject.value}</h4>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="right-side">
                                <div class="top-university-info">
                                    <h3>${currentSpeciality.university.name}</h3>

                                    <h4>Free places: ${currentSpeciality.numberOfStudentsForEntering}</h4>
                                </div>

                                <div class="submissionApply">
                                    <input id="${currentSpeciality.id}" type="submit" name="" onclick="setName(this.id)" value="Apply">
<%--                                    <input id="sendId" type="text" hidden>--%>
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}"/>
                                </div>


                            </div>
                        </div>
<%--                        <script>--%>
<%--                            document.getElementById('speciality').innerHTML +=--%>
<%--                                "<option value=\"${currentSpeciality.subjectsAndValue}\"> ${currentSpeciality.name} </option>"--%>

<%--                        </script>--%>
                    </c:forEach>
                </c:if>
<%--            </div>--%>

<%--            <div class="send-speciality-data">--%>
<%--                <input type="submit" value="Apply" id="submitBtn">--%>
<%--                <input type="hidden" name="${_csrf.parameterName}"--%>
<%--                       value="${_csrf.token}"/>--%>
<%--            </div>--%>
            </form:form>
        </div>
    </div>
</div>

<script>
    function setName(id) {
        // var id = document.getElementById("button").getAttribute("name");
        document.getElementById(id).setAttribute("name", "chosen-speciality");
        document.getElementById(id).setAttribute("value", id);
        // document.getElemen
    }
</script>
</body>
