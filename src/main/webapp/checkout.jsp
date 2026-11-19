<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.User" %>
<%@ page import="com.foodapp.util.ImagePathUtil" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodApp - Checkout</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f7f7f7;
    color: #333;
}

/* Navigation */
.navbar {
    background: white;
    padding: 18px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px #ddd;
}

.navbar h1 {
    color: #e6533d;
    margin: 0;
}

.navbar a {
    text-decoration: none;
    color: #333;
    margin-left: 20px;
    font-weight: bold;
}

/* Main container */
.checkout-container {
    max-width: 1100px;
    margin: 35px auto;
    padding: 20px;
}

.checkout-container h2 {
    margin-bottom: 25px;
}

/* Layout */
.checkout-layout {
    display: grid;
    grid-template-columns: 1.5fr 1fr;
    gap: 25px;
}

/* Sections */
.checkout-section {
    background: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 22px;
    box-shadow: 0 2px 10px #e5e5e5;
}

.checkout-section h3 {
    margin-top: 0;
    margin-bottom: 20px;
}

/* Form */
.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 13px;
    border: 1px solid #ccc;
    border-radius: 7px;
    font-size: 15px;
    font-family: Arial, sans-serif;
}

.form-group textarea {
    resize: vertical;
    min-height: 100px;
}

/* Payment methods */
.payment-option {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 12px;
    cursor: pointer;
}

.payment-option:hover {
    border-color: #e6533d;
    background: #fff8f6;
}

.payment-option input {
    accent-color: #e6533d;
    width: 18px;
    height: 18px;
}

.payment-option span {
    font-weight: 500;
}

/* Order summary */
.order-summary {
    background: white;
    padding: 25px;
    border-radius: 12px;
    height: fit-content;
    box-shadow: 0 2px 10px #e5e5e5;
}

.order-summary h3 {
    margin-top: 0;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    margin: 15px 0;
    font-size: 14px;
}

.total-row {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid #ddd;
    padding-top: 20px;
    margin-top: 20px;
    font-size: 20px;
    font-weight: bold;
}

.total-amount {
    color: #e6533d;
}

/* Place order button */
.place-order-btn {
    width: 100%;
    background: #e6533d;
    color: white;
    padding: 15px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    margin-top: 22px;
    cursor: pointer;
}

.place-order-btn:hover {
    background: #cf402d;
}

.back-link {
    display: inline-block;
    color: #e6533d;
    text-decoration: none;
    margin-top: 20px;
    font-weight: bold;
}

.demo-note {
    background: #fff4e5;
    color: #805000;
    padding: 13px;
    border-radius: 7px;
    font-size: 13px;
    line-height: 1.5;
    margin-top: 15px;
}

/* Responsive */
@media(max-width: 750px) {

    .checkout-layout {
        grid-template-columns: 1fr;
    }

    .navbar {
        flex-direction: column;
        gap: 15px;
    }

    .checkout-container {
        padding: 15px;
    }
}

</style>
</head>

<body>

<%
    User user = (User) request.getAttribute("checkoutUser");

    List<Cart> cartItems =
        (List<Cart>) request.getAttribute("cartItems");

    BigDecimal grandTotal =
        (BigDecimal) request.getAttribute("grandTotal");
%>

<!-- Navigation -->
<header class="navbar">

    <h1>FoodApp</h1>

    <nav>
        <a href="${pageContext.request.contextPath}/restaurants">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/cart">
            My Cart
        </a>

        <a href="${pageContext.request.contextPath}/orders">
            My Orders
        </a>
    </nav>

</header>

<main class="checkout-container">

    <h2>🛒 Checkout <small style="font-size:12px;color:#999;">build 5</small></h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="demo-note">Sorry, your order could not be saved. Please try again. (build 5)<br>
            <% if (request.getAttribute("checkoutError") != null) { %>
                <small>Reason: <%= request.getAttribute("checkoutError") %></small>
            <% } %></div>
    <% } %>

    <div class="checkout-layout">

        <!-- Customer details and payment -->
        <section>

            <div class="checkout-section">

                <h3>📍 Delivery Details</h3>

                <div class="form-group">

                    <label>Customer Name</label>

                    <input type="text"
                           value="<%= user.getName() %>"
                           readonly>

                </div>

                <div class="form-group">

                    <label>Email Address</label>

                    <input type="email"
                           value="<%= user.getEmail() %>"
                           readonly>

                </div>

                <div class="form-group">

                    <label>Phone Number</label>

                    <input type="tel"
                           id="phone"
                           name="phone"
                           form="orderForm"
                           value="<%= user.getPhone() == null ? "" : user.getPhone() %>"
                           placeholder="Enter your phone number"
                           maxlength="15"
                           required>

                </div>

                <div class="form-group">

                    <label>Delivery Address</label>

                    <textarea id="address"
                              name="address"
                              form="orderForm"
                              placeholder="Enter your complete delivery address"
                              required><%= user.getAddress() == null ? "" : user.getAddress() %></textarea>

                </div>

            </div>

            <div class="checkout-section">

                <h3>💳 Select Payment Method</h3>

                <label class="payment-option">
                    <input type="radio" name="paymentMethod" form="orderForm"
                           value="UPI">
                    <span>📱 UPI</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="paymentMethod" form="orderForm"
                           value="Debit Card">
                    <span>💳 Debit Card</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="paymentMethod" form="orderForm"
                           value="Credit Card">
                    <span>💳 Credit Card</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="paymentMethod" form="orderForm"
                           value="Cash on Delivery" checked>
                    <span>💵 Cash on Delivery</span>
                </label>

                <div class="demo-note">
                    No online payment is taken. Choose how you want to
                    pay, then click "Confirm Order" to place your order.
                </div>

            </div>

        </section>

        <!-- Order summary -->
        <aside class="order-summary">

            <h3>Order Summary</h3>

            <p>
                Total Products: <strong><%= cartItems.size() %></strong>
            </p>

            <hr>

            <% for (Cart item : cartItems) { %>

                <div class="summary-item">

                    <span>
                        <%= item.getItemName() %>
                        × <%= item.getQuantity() %>
                    </span>

                    <strong>
                        ₹<%= item.getTotalPrice() %>
                    </strong>

                </div>

            <% } %>

            <div class="total-row">

                <span>Total Amount</span>

                <span class="total-amount">
                    ₹<%= grandTotal %>
                </span>

            </div>

            <form id="orderForm" method="post"
                  action="${pageContext.request.contextPath}/checkout">

                <button type="button"
                        class="place-order-btn"
                        onclick="confirmOrder()">

                    Confirm Order

                </button>

            </form>

            <a class="back-link"
               href="${pageContext.request.contextPath}/cart">

                ← Back to Cart

            </a>

        </aside>

    </div>

</main>

<script>

function confirmOrder() {

    const phone = document.getElementById("phone").value.trim();

    const address = document.getElementById("address").value.trim();

    if (phone === "") {
        alert("Please enter your phone number.");
        return;
    }

    if (!/^[0-9+\-\s]{7,15}$/.test(phone)) {
        alert("Please enter a valid phone number.");
        return;
    }

    if (address.length < 10) {
        alert("Please enter your complete delivery address.");
        return;
    }

    document.getElementById("orderForm").submit();
}

</script>

</body>
</html>