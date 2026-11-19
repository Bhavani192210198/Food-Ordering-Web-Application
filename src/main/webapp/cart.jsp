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

<title>FoodApp - My Cart</title>

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
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.logo {
    color: #e6533d;
    font-size: 27px;
    font-weight: bold;
    margin: 0;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    margin-left: 22px;
    font-weight: bold;
}

.nav-links a:hover {
    color: #e6533d;
}

/* Main section */
.cart-container {
    max-width: 1150px;
    margin: 40px auto;
    padding: 20px;
}

.page-title {
    font-size: 29px;
    margin-bottom: 25px;
}

/* Cart layout */
.cart-layout {
    display: grid;
    grid-template-columns: 1.7fr 1fr;
    gap: 25px;
    align-items: start;
}

/* Cart items */
.cart-items {
    display: flex;
    flex-direction: column;
    gap: 18px;
}

.cart-item {
    background: white;
    border-radius: 12px;
    padding: 18px;
    display: flex;
    align-items: center;
    gap: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.07);
}

/* Food image */
.food-image {
    width: 145px;
    height: 125px;
    object-fit: cover;
    object-position: center;
    border-radius: 9px;
    flex-shrink: 0;
    background: #f0f0f0;
}

.food-placeholder {
    width: 145px;
    height: 125px;
    border-radius: 9px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fff0df;
    font-size: 45px;
}

/* Item details */
.item-details {
    flex: 1;
    min-width: 0;
}

.item-details h3 {
    margin: 0 0 9px;
    font-size: 20px;
}

.item-details p {
    color: #777;
    margin: 6px 0;
    font-size: 14px;
}

.item-price {
    color: #e6533d !important;
    font-size: 17px !important;
    font-weight: bold;
}

.item-total {
    font-weight: bold;
    font-size: 16px;
    margin-top: 10px;
}

/* Summary */
.cart-summary {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.07);
    height: fit-content;
}

.cart-summary h3 {
    margin-top: 0;
    font-size: 22px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin: 17px 0;
    gap: 10px;
}

.summary-total {
    border-top: 1px solid #ddd;
    padding-top: 18px;
    margin-top: 20px;
    font-size: 21px;
    font-weight: bold;
}

.total-price {
    color: #e6533d;
}

/* Checkout button */
.checkout-btn {
    display: block;
    width: 100%;
    text-align: center;
    background: #e6533d;
    color: white;
    padding: 15px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    margin-top: 22px;
    border: none;
    cursor: pointer;
}

.checkout-btn:hover {
    background: #cf402d;
}

/* Continue shopping */
.continue-shopping {
    display: block;
    text-align: center;
    color: #e6533d;
    text-decoration: none;
    margin-top: 18px;
    font-weight: bold;
}

/* Empty cart */
.empty-cart {
    background: white;
    text-align: center;
    padding: 65px 20px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.06);
}

.empty-cart .empty-icon {
    font-size: 65px;
}

.empty-cart h2 {
    margin-bottom: 10px;
}

.empty-cart p {
    color: #777;
}

.shop-btn {
    display: inline-block;
    background: #e6533d;
    color: white;
    padding: 13px 25px;
    text-decoration: none;
    border-radius: 7px;
    margin-top: 15px;
}

/* Responsive */
@media (max-width: 800px) {

    .cart-layout {
        grid-template-columns: 1fr;
    }

    .cart-summary {
        width: 100%;
    }
}

@media (max-width: 550px) {

    .navbar {
        flex-direction: column;
        gap: 15px;
    }

    .nav-links a {
        margin: 0 8px;
        font-size: 13px;
    }

    .cart-container {
        padding: 15px;
        margin-top: 20px;
    }

    .cart-item {
        align-items: flex-start;
        gap: 12px;
        padding: 12px;
    }

    .food-image,
    .food-placeholder {
        width: 105px;
        height: 105px;
    }

    .item-details h3 {
        font-size: 16px;
    }

    .item-details p {
        font-size: 13px;
    }
}

</style>

</head>

<body>

<%
    List<Cart> cartItems =
        (List<Cart>) request.getAttribute("cartItems");

    BigDecimal grandTotal = BigDecimal.ZERO;

    if (cartItems != null) {
        for (Cart item : cartItems) {
            if (item.getTotalPrice() != null) {
                grandTotal = grandTotal.add(item.getTotalPrice());
            }
        }
    }
%>

<!-- Navigation -->
<header class="navbar">

    <h1 class="logo">🍔 FoodApp</h1>

    <nav class="nav-links">

        <a href="${pageContext.request.contextPath}/restaurants">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/restaurants">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/orders">
            My Orders
        </a>

    </nav>

</header>

<main class="cart-container">

    <h2 class="page-title">🛒 My Shopping Cart</h2>

    <% if (cartItems != null && !cartItems.isEmpty()) { %>

        <div class="cart-layout">

            <!-- Cart Items -->
            <section class="cart-items">

                <% for (Cart item : cartItems) {

                    String imageUrl = ImagePathUtil.resolveImageUrl(
                        application,
                        request.getContextPath(),
                        item.getImage(),
                        item.getItemName()
                    );

                    String itemName = item.getItemName() == null
                        ? "Food Item"
                        : item.getItemName();

                %>

                    <div class="cart-item">

                        <!-- Food Image -->
                        <% if (imageUrl != null &&
                               !imageUrl.trim().isEmpty()) { %>

                            <img
                                class="food-image"
                                src="<%= imageUrl %>"
                                alt="<%= itemName %>"
                                onerror="this.style.display='none';
                                this.nextElementSibling.style.display='flex';">

                            <div class="food-placeholder"
                                 style="display:none;">
                                🍽️
                            </div>

                        <% } else { %>

                            <div class="food-placeholder">
                                🍽️
                            </div>

                        <% } %>

                        <!-- Item Information -->
                        <div class="item-details">

                            <h3><%= itemName %></h3>

                            <p>
                                <%= item.getDescription() == null
                                    ? ""
                                    : item.getDescription() %>
                            </p>

                            <p class="item-price">
                                ₹<%= item.getPrice() %>
                            </p>

                            <p>
                                Quantity:
                                <strong><%= item.getQuantity() %></strong>
                            </p>

                            <p class="item-total">
                                Subtotal: ₹<%= item.getTotalPrice() %>
                            </p>

                        </div>

                    </div>

                <% } %>

            </section>

            <!-- Order Summary -->
            <aside class="cart-summary">

                <h3>Order Summary</h3>

                <div class="summary-row">

                    <span>Total Items</span>

                    <strong><%= cartItems.size() %></strong>

                </div>

                <div class="summary-row">

                    <span>Delivery Fee</span>

                    <strong>₹0.00</strong>

                </div>

                <div class="summary-row">

                    <span>Discount</span>

                    <strong>₹0.00</strong>

                </div>

                <div class="summary-row summary-total">

                    <span>Grand Total</span>

                    <span class="total-price">
                        ₹<%= grandTotal %>
                    </span>

                </div>

                <!-- Checkout Connection -->
                <a href="${pageContext.request.contextPath}/checkout"
                   class="checkout-btn">

                    Proceed to Checkout →

                </a>

                <a href="${pageContext.request.contextPath}/restaurants"
                   class="continue-shopping">

                    ← Continue Shopping

                </a>

            </aside>

        </div>

    <% } else { %>

        <!-- Empty Cart -->
        <div class="empty-cart">

            <div class="empty-icon">🛒</div>

            <h2>Your Cart is Empty!</h2>

            <p>
                Looks like you haven't added any delicious food yet.
            </p>

            <a href="${pageContext.request.contextPath}/restaurants"
               class="shop-btn">

                Explore Restaurants

            </a>

        </div>

    <% } %>

</main>

</body>
</html>