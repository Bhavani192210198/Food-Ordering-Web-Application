
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodApp - My Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <header class="navbar">
        <h1>FoodApp</h1>

        <nav>
            <a href="${pageContext.request.contextPath}/restaurants">Home</a>
            <a href="${pageContext.request.contextPath}/cart">My Cart</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </nav>
    </header>

    <main class="orders-section">

        <h2>My Orders</h2>

        <% if (request.getParameter("placed") != null) { %>
            <div class="order-success">✅ Your order has been confirmed!</div>
        <% } %>

        <p>Track your previous food orders.</p>

        <%
            List<Order> orders =
                (List<Order>) request.getAttribute("orders");

            if (orders != null && !orders.isEmpty()) {
        %>

            <table class="orders-table">

                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Restaurant ID</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Payment</th>
                    </tr>
                </thead>

                <tbody>

                    <% for (Order order : orders) { %>

                        <tr>
                            <td><%= order.getOrderId() %></td>
                            <td><%= order.getRestaurantId() %></td>
                            <td><%= order.getOrderDate() %></td>
                            <td>₹<%= order.getTotalAmount() %></td>
                            <td>
                                <span class="order-status">
                                    <%= order.getStatus() %>
                                </span>
                            </td>
                            <td><%= order.getPaymentMethod() %></td>
                        </tr>

                    <% } %>

                </tbody>

            </table>

        <%
            } else {
        %>

            <div class="empty-orders">
                <h3>No orders yet!</h3>
                <p>Your food orders will appear here.</p>

                <a href="${pageContext.request.contextPath}/restaurants">
                    Order Food
                </a>
            </div>

        <%
            }
        %>

    </main>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>
</html>
