<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.foodapp.model.Menu" %>
<%@ page import="com.foodapp.util.ImagePathUtil" %>

<%
    Menu foodItem = (Menu) request.getAttribute("foodItem");

    if (foodItem == null) {
        response.sendRedirect(request.getContextPath() + "/restaurants");
        return;
    }

    String foodImage = ImagePathUtil.resolveImageUrl(
        application,
        request.getContextPath(),
        foodItem.getImage(),
        foodItem.getItemName()
    );
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><%= foodItem.getItemName() %> - FoodApp</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f7f7f7;
}

.navbar {
    background: white;
    padding: 18px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px #ddd;
}

.navbar h2 {
    color: #ff6b00;
}

.navbar a {
    text-decoration: none;
    color: #333;
    margin-left: 20px;
}

.details-container {
    max-width: 1000px;
    margin: 55px auto;
    padding: 20px;
}

.back-link {
    display: inline-block;
    margin-bottom: 20px;
    text-decoration: none;
    color: #ff6b00;
}

.details-card {
    display: grid;
    grid-template-columns: 1fr 1fr;
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 5px 20px #ddd;
}

.food-image {
    width: 100%;
    height: 100%;
    min-height: 390px;
    object-fit: cover;
    display: block;
}

.food-placeholder {
    min-height: 390px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fff0df;
    font-size: 100px;
}

.food-content {
    padding: 35px;
}

.food-content h1 {
    font-size: 30px;
    margin-bottom: 15px;
}

.category {
    color: #888;
}

.description {
    color: #666;
    line-height: 1.7;
    margin: 22px 0;
}

.price {
    color: #ff6b00;
    font-size: 28px;
    font-weight: bold;
}

.quantity-box {
    margin-top: 25px;
}

.quantity-box input {
    width: 90px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 7px;
    font-size: 16px;
}

.add-cart-btn {
    display: block;
    width: 100%;
    margin-top: 25px;
    padding: 15px;
    border: none;
    border-radius: 8px;
    background: #ff6b00;
    color: white;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
}

.add-cart-btn:hover {
    background: #e65f00;
}

@media(max-width: 700px) {
    .details-card {
        grid-template-columns: 1fr;
    }

    .food-image,
    .food-placeholder {
        min-height: 250px;
        height: 250px;
    }

    .food-content {
        padding: 22px;
    }
}
</style>
</head>

<body>

<header class="navbar">
    <h2>🍔 FoodApp</h2>

    <nav>
        <a href="<%= request.getContextPath() %>/restaurants">Home</a>
        <a href="<%= request.getContextPath() %>/cart">🛒 My Cart</a>
    </nav>
</header>

<main class="details-container">

    <a class="back-link"
       href="<%= request.getContextPath() %>/menu?restaurantId=<%= foodItem.getRestaurantId() %>">
        ← Back to Menu
    </a>

    <div class="details-card">

        <div>
            <% if (foodImage != null && !foodImage.trim().isEmpty()) { %>

                <img class="food-image"
                     src="<%= foodImage %>"
                     alt="<%= foodItem.getItemName() %>"
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
        </div>

        <div class="food-content">

            <h1><%= foodItem.getItemName() %></h1>

            <p class="category">
                Category: <%= foodItem.getCategory() %>
            </p>

            <p class="description">
                <%= foodItem.getDescription() %>
            </p>

            <p class="price">
                ₹<%= foodItem.getPrice() %>
            </p>

            <form action="<%= request.getContextPath() %>/cart"
                  method="post">

                <input type="hidden"
                       name="menuId"
                       value="<%= foodItem.getMenuId() %>">

                <input type="hidden"
                       name="restaurantId"
                       value="<%= foodItem.getRestaurantId() %>">

                <div class="quantity-box">

                    <label for="quantity">Quantity</label>
                    <br><br>

                    <input type="number"
                           id="quantity"
                           name="quantity"
                           value="1"
                           min="1"
                           max="20"
                           required>
                </div>

                <button type="submit" class="add-cart-btn">
                    Add to Cart
                </button>

            </form>

        </div>
    </div>

</main>

</body>
</html>