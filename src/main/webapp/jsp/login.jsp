<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Log in with your account</title>
    <link rel="stylesheet" href="css/loginStyle1.css">
</head>

<body>

<form method="POST" action="${contextPath}/login" class="box">
    <h1>Login</h1>

    <div class="form-group ${error != null ? 'has-error' : ''}">
        <span class="massage">${message}</span>
        <input name="email" type="text" placeholder="Email"
               autofocus="true"/>
        <input name="password" type="password" placeholder="Password"/>
        <span class="error">${error}</span>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <input name="" type="Submit"/>
        <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
    </div>

</form>

</div>
</body>
</html>