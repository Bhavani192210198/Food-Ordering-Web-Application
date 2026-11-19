<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.foodapp.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    Integer orderId = (Integer) session.getAttribute("lastOrderId");
    BigDecimal total =
        (BigDecimal) session.getAttribute("lastOrderTotal");

    String paymentMethod =
        (String) session.getAttribute("lastPaymentMethod");

    String phone =
        (String) session.getAttribute("lastDeliveryPhone");

    String address =
        (String) session.getAttribute("lastDeliveryAddress");

    if (user == null || orderId == null || total == null) {
        response.sendRedirect(
            request.getContextPath() + "/restaurants"
        );
        return;
    }

    java.util.List<String> orderItems =
        (java.util.List<String>) session.getAttribute("lastOrderItems");

    // Prevent the same confirmation from being displayed again
    session.removeAttribute("lastOrderItems");
    session.removeAttribute("lastOrderId");
    session.removeAttribute("lastOrderTotal");
    session.removeAttribute("lastPaymentMethod");
    session.removeAttribute("lastDeliveryPhone");
    session.removeAttribute("lastDeliveryAddress");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Order Confirmed - FoodApp</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 25px;
    font-family: Arial, sans-serif;
    background: #f7f7f7;
    color: #333;
}

.success-container {
    max-width: 650px;
    margin: 45px auto;
    background: white;
    padding: 40px 30px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 3px 18px #ddd;
}

.success-icon {
    width: 85px;
    height: 85px;
    border-radius: 50%;
    background: #e5f8eb;
    color: #159447;
    font-size: 48px;
    line-height: 85px;
    margin: 0 auto 20px;
}

h1 {
    color: #159447;
    margin-bottom: 10px;
}

.subtitle {
    color: #666;
    line-height: 1.6;
}

.order-details {
    text-align: left;
    background: #fafafa;
    border: 1px solid #eee;
    border-radius: 10px;
    padding: 20px;
    margin-top: 25px;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    gap: 15px;
    padding: 12px 0;
    border-bottom: 1px solid #eee;
}

.detail-row:last-child {
    border-bottom: none;
}

.detail-row strong {
    text-align: right;
    overflow-wrap: anywhere;
}

.total {
    color: #e6533d;
    font-size: 20px;
}

.demo-note {
    background: #fff4e5;
    color: #805000;
    padding: 13px;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 13px;
    line-height: 1.5;
}

.home-btn {
    display: inline-block;
    margin-top: 25px;
    padding: 14px 25px;
    background: #e6533d;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.home-btn:hover {
    background: #cf402d;
}

@media(max-width: 500px) {
    .success-container {
        padding: 30px 18px;
    }

    .detail-row {
        font-size: 14px;
    }
}
</style>
</head>

<body>

<div class="success-container">

    <div class="success-icon">✓</div>

    <h1>Order Confirmed!</h1>

    <p class="subtitle">
        Thank you, <strong><%= user.getName() %></strong>!
        Your order has been successfully placed.
    </p>

    <div class="order-details">

        <div class="detail-row">
            <span>Order ID</span>
            <strong>#<%= orderId %></strong>
        </div>

        <% if (orderItems != null) { for (String line : orderItems) { %>
        <div class="detail-row">
            <span>Item</span>
            <strong><%= line.replace("<","&lt;") %></strong>
        </div>
        <% } } %>

        <div class="detail-row">
            <span>Payment Method</span>
            <strong><%= paymentMethod %></strong>
        </div>

        <div class="detail-row">
            <span>Phone Number</span>
            <strong><%= phone == null ? "" : phone.replace("<","&lt;") %></strong>
        </div>

        <div class="detail-row">
            <span>Delivery Address</span>
            <strong><%= address == null ? "" : address.replace("<","&lt;") %></strong>
        </div>

        <div class="detail-row">
            <span>Order Total</span>
            <strong class="total">₹<%= total %></strong>
        </div>

        <div class="detail-row">
            <span>Order Status</span>
            <strong style="color:#159447;">Confirmed</strong>
        </div>

    </div>

    <div class="demo-note">
        This is a demo payment system. No real money has been
        charged or transferred.
    </div>

    <a class="home-btn"
       href="<%= request.getContextPath() %>/restaurants">
        Continue Shopping
    </a>

</div>

</body>
</html>