<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodapp.model.User" %>

<%
    User user = (User) request.getAttribute("profileUser");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    String name = user.getName() == null ? "" : user.getName();
    String email = user.getEmail() == null ? "" : user.getEmail();
    String phone = user.getPhone() == null ? "" : user.getPhone();
    String address = user.getAddress() == null ? "" : user.getAddress();
    String role = user.getRole() == null ? "Customer" : user.getRole();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile - FoodApp</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f7f7f7;
            color: #292929;
        }

        header {
            background: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,.07);
        }

        header h2 {
            color: #ff6b00;
        }

        header a {
            text-decoration: none;
            color: #333;
            margin-left: 18px;
            font-weight: bold;
        }

        .container {
            max-width: 850px;
            margin: 45px auto;
            padding: 20px;
        }

        .profile-card {
            background: white;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 5px 22px rgba(0,0,0,.07);
        }

        .profile-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #fff0df;
            color: #ff6b00;
            font-size: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
        }

        .profile-heading h1 {
            font-size: 26px;
            margin-bottom: 8px;
        }

        .profile-heading p {
            color: #777;
        }

        .detail {
            padding: 18px 5px;
            border-bottom: 1px solid #eee;
        }

        .detail:last-child {
            border-bottom: none;
        }

        .detail label {
            display: block;
            color: #888;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .detail p {
            font-size: 16px;
            font-weight: 600;
            overflow-wrap: anywhere;
        }

        .actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .btn {
            flex: 1;
            min-width: 130px;
            padding: 14px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
        }

        .primary {
            background: #ff6b00;
            color: white;
        }

        .secondary {
            background: #fff0df;
            color: #ff6b00;
        }

        .logout {
            background: #fceaea;
            color: #c62828;
        }

        footer {
            text-align: center;
            padding: 25px;
            color: #777;
        }

        @media(max-width: 600px) {
            header {
                padding: 16px 5%;
                flex-wrap: wrap;
                gap: 15px;
            }

            .profile-card {
                padding: 22px;
            }

            .container {
                margin: 20px auto;
            }
        }
    </style>
</head>

<body>

<header>
    <h2>🍔 FoodApp</h2>

    <nav>
        <a href="<%= request.getContextPath() %>/restaurants">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/orders">
            My Orders
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>
    </nav>
</header>

<div class="container">

    <div class="profile-card">

        <div class="profile-heading">

            <div class="avatar">👤</div>

            <h1><%= name %></h1>

            <p>Welcome to your FoodApp profile!</p>

        </div>

        <div class="detail">
            <label>Customer Name</label>
            <p><%= name %></p>
        </div>

        <div class="detail">
            <label>Email Address</label>
            <p><%= email %></p>
        </div>

        <div class="detail">
            <label>Phone Number</label>
            <p><%= phone.isEmpty() ? "Not provided" : phone %></p>
        </div>

        <div class="detail">
            <label>Delivery Address</label>
            <p><%= address.isEmpty() ? "Not provided" : address %></p>
        </div>

        <div class="detail">
            <label>Account Type</label>
            <p><%= role %></p>
        </div>

        <div class="actions">

            <a class="btn primary"
               href="<%= request.getContextPath() %>/restaurants">
                Continue Shopping
            </a>

            <a class="btn secondary"
               href="<%= request.getContextPath() %>/orders">
                My Orders
            </a>

            <a class="btn logout"
               href="<%= request.getContextPath() %>/logout">
                Logout
            </a>

        </div>

    </div>

</div>

<footer>
    © 2026 FoodApp. All rights reserved.
</footer>

</body>
</html>