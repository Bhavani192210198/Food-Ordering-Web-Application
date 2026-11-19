<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Menu" %>
<%@ page import="com.foodapp.util.ImagePathUtil" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodApp - Menu</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f8f8f8;
    color: #333;
}

/* Navigation bar */
.navbar {
    background: white;
    padding: 18px 6%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px #ddd;
}

.navbar h1 {
    color: #ff6b00;
    margin: 0;
    font-size: 26px;
}

.navbar a {
    text-decoration: none;
    color: #333;
    margin-left: 20px;
    font-weight: 500;
}

/* Menu section */
.menu-section {
    padding: 35px 6%;
}

.menu-section h2 {
    font-size: 28px;
    margin-bottom: 8px;
}

.menu-section > p {
    color: #777;
    margin-bottom: 25px;
}

/* Food cards layout */
.menu-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 28px;
    margin-top: 25px;
}

/* Individual food card */
.menu-card {
    background: white;
    border-radius: 13px;
    overflow: hidden;
    box-shadow: 0 3px 12px rgba(0,0,0,0.10);
    transition: transform 0.25s, box-shadow 0.25s;
}

.menu-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 7px 20px rgba(0,0,0,0.15);
}

/* Food image - fills entire image area */
.menu-card img {
    width: 100%;
    height: 320px;
    object-fit: cover;
    object-position: center;
    display: block;
    background: #f4f4f4;
}

/* Image fallback */
.food-placeholder {
    width: 100%;
    height: 320px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 65px;
    background: #fff0df;
}

/* Food details */
.menu-info {
    padding: 20px;
}

.menu-info h3 {
    margin: 0 0 12px;
    font-size: 21px;
    color: #222;
}

.description {
    color: #777;
    min-height: 40px;
    line-height: 1.5;
    font-size: 14px;
}

.category {
    color: #666;
    font-size: 14px;
}

.price {
    color: #ff6b00;
    font-size: 21px;
    font-weight: bold;
    margin: 15px 0;
}

/* View details button */
.details-btn {
    display: block;
    text-align: center;
    text-decoration: none;
    background: #ff6b00;
    color: white;
    padding: 13px;
    border-radius: 7px;
    margin-top: 15px;
    font-weight: bold;
}

.details-btn:hover {
    background: #e65f00;
}

/* Empty menu */
.empty-message {
    text-align: center;
    padding: 45px;
    background: white;
    border-radius: 12px;
}

/* Tablet */
@media (max-width: 900px) {
    .menu-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

/* Mobile */
@media (max-width: 600px) {
    .menu-grid {
        grid-template-columns: 1fr;
    }

    .menu-section {
        padding: 25px 5%;
    }

    .navbar {
        padding: 15px 4%;
    }

    .navbar a {
        margin-left: 10px;
        font-size: 13px;
    }

    .menu-card img,
    .food-placeholder {
        height: 280px;
    }
}
</style>
</head>

<body>

<!-- Navigation -->
<header class="navbar">

    <h1>🍔 FoodApp</h1>

    <nav>
        <a href="${pageContext.request.contextPath}/restaurants">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/cart">
            🛒 My Cart
        </a>
    </nav>

</header>

<!-- Menu -->
<main class="menu-section">

    <h2>Explore Our Menu</h2>
    <p>Choose your favourite food.</p>

    <%
        List<Menu> menuItems =
            (List<Menu>) request.getAttribute("menuItems");

        if (menuItems != null && !menuItems.isEmpty()) {
    %>

    <div class="menu-grid">

        <%
            for (Menu item : menuItems) {

                String foodImage = ImagePathUtil.resolveImageUrl(
                    application,
                    request.getContextPath(),
                    item.getImage(),
                    item.getItemName()
                );

                String foodName = item.getItemName() == null
                    ? "Food item"
                    : item.getItemName();
        %>

        <div class="menu-card">

            <% if (foodImage != null && !foodImage.trim().isEmpty()) { %>

                <img
                    src="<%= foodImage %>"
                    alt="<%= foodName %>"
                    onerror="this.style.display='none';
                    this.nextElementSibling.style.display='flex';">

                <div class="food-placeholder" style="display:none;">
                    🍽️
                </div>

            <% } else { %>

                <div class="food-placeholder">
                    🍽️
                </div>

            <% } %>

            <div class="menu-info">

                <h3><%= foodName %></h3>

                <p class="description">
                    <%= item.getDescription() == null
                        ? ""
                        : item.getDescription() %>
                </p>

                <p class="category">
                    Category: <%= item.getCategory() %>
                </p>

                <p class="price">
                    ₹<%= item.getPrice() %>
                </p>

                <a class="details-btn"
                   href="<%= request.getContextPath() %>/food-details?menuId=<%= item.getMenuId() %>">
                    View Details
                </a>

            </div>

        </div>

        <% } %>

    </div>

    <% } else { %>

        <div class="empty-message">
            <h3>No food items available.</h3>
            <p>Please check back later.</p>
            <% if (request.getAttribute("menuError") != null) { %>
                <p style="color:#c0392b;">Database error:
                    <%= request.getAttribute("menuError") %></p>
            <% } else { %>
                <p style="color:#888;font-size:13px;">
                    No menu rows found for restaurant ID
                    <%= request.getAttribute("restaurantId") %>.</p>
            <% } %>
        </div>

    <% } %>

</main>

</body>
</html>