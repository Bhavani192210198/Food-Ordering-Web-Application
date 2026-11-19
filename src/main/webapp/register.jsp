
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodApp - Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-card">

            <h1>FoodApp</h1>
            <h2>Create Account</h2>
            <p>Join us and enjoy delicious food!</p>

            <% if ("empty".equals(request.getParameter("error"))) { %>
                <p class="error">Please fill in all required fields.</p>
            <% } else if ("failed".equals(request.getParameter("error"))) { %>
                <p class="error">Registration failed. Please check your details or try another email.</p>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post">

                <label>Full Name</label>
                <input type="text" name="name"
                       placeholder="Enter your full name" required>

                <label>Email Address</label>
                <input type="email" name="email"
                       placeholder="Enter your email" required>

                <label>Password</label>
                <input type="password" name="password"
                       placeholder="Create a password" required>

                <label>Phone Number</label>
                <input type="tel" name="phone"
                       placeholder="Enter your phone number">

                <label>Address</label>
                <textarea name="address"
                          placeholder="Enter your delivery address"></textarea>

                <button type="submit">Create Account</button>

            </form>

            <p class="auth-link">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
            </p>

        </div>
    </div>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>
</html>
