
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodApp - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-card">

            <h1>FoodApp</h1>
            <h2>Welcome Back!</h2>
            <p>Login to order your favourite food.</p>

            <% if ("empty".equals(request.getParameter("error"))) { %>
                <p class="error">Please enter your email and password.</p>
            <% } else if ("invalid".equals(request.getParameter("error"))) { %>
                <p class="error">Invalid email or password.</p>
            <% } %>

            <% if ("registered".equals(request.getParameter("success"))) { %>
                <p class="success">Registration successful! Please log in.</p>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">

                <label>Email Address</label>
                <input type="email" name="email"
                       placeholder="Enter your email" required>

                <label>Password</label>
                <input type="password" name="password"
                       placeholder="Enter your password" required>

                <button type="submit">Login</button>

            </form>

            <p class="auth-link">
                Don't have an account?
                <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
            </p>

        </div>
    </div>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>
</html>
