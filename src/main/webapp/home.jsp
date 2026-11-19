<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.util.ImagePathUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>FoodApp - Order Food Online</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .home-hero {
            padding: 55px 7%;
            background: linear-gradient(120deg, #fff0e5, #ffe0c2);
            text-align: center;
        }

        .home-hero h2 {
            font-size: 36px;
            color: #282828;
            margin-bottom: 12px;
        }

        .home-hero p {
            color: #666;
            margin-bottom: 25px;
        }

        .search-box {
            max-width: 600px;
            margin: auto;
            display: flex;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .search-box input {
            flex: 1;
            min-width: 0;
            padding: 16px;
            border: none;
            outline: none;
            font-size: 15px;
        }

        .search-box button {
            padding: 0 25px;
            background: #ff6b00;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .home-content {
            padding: 35px 7%;
        }

        .section-heading {
            margin-bottom: 20px;
            font-size: 25px;
        }

        .category-list {
            display: flex;
            gap: 25px;
            overflow-x: auto;
            padding: 10px 0 25px;
        }

        .category-item {
            min-width: 105px;
            text-align: center;
        }

        .category-icon {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            background: #fff0df;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: auto auto 10px;
            font-size: 38px;
        }

        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(
                auto-fit,
                minmax(240px, 1fr)
            );
            gap: 22px;
        }

        .restaurant-card {
            width: 100%;
            margin: 0;
            border-radius: 14px;
            overflow: hidden;
            background: white;
            box-shadow: 0 3px 12px rgba(0,0,0,0.10);
            transition: transform 0.2s;
        }

        .restaurant-card:hover {
            transform: translateY(-5px);
        }

        .restaurant-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            display: block;
        }

        .restaurant-placeholder {
            height: 180px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0df;
            font-size: 55px;
        }

        .restaurant-info {
            padding: 18px;
        }

        .restaurant-info h3 {
            font-size: 19px;
        }

        .restaurant-info p {
            margin: 9px 0;
        }

        .restaurant-meta {
            color: #555;
            font-size: 14px;
        }

        .view-menu-btn {
            display: block;
            text-align: center;
            text-decoration: none;
            padding: 12px;
            background: #ff6b00;
            color: white;
            border-radius: 7px;
            margin-top: 15px;
        }

        .view-menu-btn:hover {
            background: #e85d00;
        }

        .home-footer {
            background: #242424;
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 40px;
        }

        .no-results {
            text-align: center;
            padding: 35px;
            color: #777;
        }

        @media(max-width: 600px) {
            .home-hero h2 {
                font-size: 27px;
            }

            .home-content {
                padding: 25px 5%;
            }

            .navbar nav {
                gap: 12px;
                font-size: 13px;
            }
        }
    </style>
</head>

<body>

<header class="navbar">

    <h1>🍔 FoodApp</h1>

    <nav>
        <a href="${pageContext.request.contextPath}/restaurants">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/login.jsp">
            Login
        </a>

        <a href="${pageContext.request.contextPath}/register.jsp">
            Register
        </a>

        <a href="${pageContext.request.contextPath}/cart">
            🛒 Cart
        </a>
    </nav>

</header>

<section class="home-hero">

    <h2>Delicious Food, Delivered To Your Door!</h2>

    <p>
        Discover the best restaurants and enjoy your favourite meals.
    </p>

    <div class="search-box">

        <input
            type="text"
            id="restaurantSearch"
            placeholder="Search restaurants or cuisine..."
        >

        <button type="button" onclick="searchRestaurants()">
            Search
        </button>

    </div>

</section>

<section class="home-content">

    <h2 class="section-heading">
        What's on your mind?
    </h2>

    <div class="category-list">

        <div class="category-item">
            <div class="category-icon">🍕</div>
            <p>Pizza</p>
        </div>

        <div class="category-item">
            <div class="category-icon">🍔</div>
            <p>Burger</p>
        </div>

        <div class="category-item">
            <div class="category-icon">🍗</div>
            <p>Biryani</p>
        </div>

        <div class="category-item">
            <div class="category-icon">🥗</div>
            <p>Healthy Food</p>
        </div>

        <div class="category-item">
            <div class="category-icon">🍜</div>
            <p>Noodles</p>
        </div>

        <div class="category-item">
            <div class="category-icon">🍰</div>
            <p>Desserts</p>
        </div>

    </div>

</section>

<section class="home-content">

    <h2 class="section-heading">
        Popular Restaurants Near You
    </h2>

    <div class="restaurant-grid" id="restaurantGrid">

        <%
            List<Restaurant> restaurants =
                (List<Restaurant>) request.getAttribute("restaurants");

            if (restaurants != null && !restaurants.isEmpty()) {

                for (Restaurant restaurant : restaurants) {

                    String imageUrl =
                        ImagePathUtil.resolveImageUrl(
                            application,
                            request.getContextPath(),
                            restaurant.getImage(),
                            restaurant.getName()
                        );
        %>

        <div class="restaurant-card">

            <% if (imageUrl != null && !imageUrl.isEmpty()) { %>

                <img
                    src="<%= imageUrl %>"
                    alt="<%= restaurant.getName() %>"
                    onerror="
                        this.style.display='none';
                        this.nextElementSibling.style.display='flex';
                    "
                >

                <div class="restaurant-placeholder"
                     style="display:none;">
                    🍽️
                </div>

            <% } else { %>

                <div class="restaurant-placeholder">
                    🍽️
                </div>

            <% } %>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    <%= restaurant.getName() %>
                </h3>

                <p class="restaurant-meta">
                    <%= restaurant.getCuisineType() %>
                </p>

                <p class="restaurant-meta">
                    ⭐ <%= restaurant.getRating() %>
                </p>

                <p class="restaurant-meta">
                    🕒 <%= restaurant.getDeliveryTime() %> mins
                </p>

                <a
                    class="view-menu-btn"
                    href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurant.getRestaurantId() %>"
                >
                    View Menu
                </a>

            </div>

        </div>

        <%
                }

            } else {
        %>

            <div class="no-results">

                <h3>No restaurants available right now.</h3>

                <p>Please check again later.</p>

            </div>

        <%
            }
        %>

    </div>

    <p id="searchMessage" class="no-results"></p>

</section>

<footer class="home-footer">

    <h2>🍔 FoodApp</h2>

    <p>Good food. Great mood. Delivered with love.</p>

    <p>© 2026 FoodApp. All rights reserved.</p>

</footer>

<script src="${pageContext.request.contextPath}/js/app.js"></script>

<script>

    function searchRestaurants() {

        const searchValue = document
            .getElementById("restaurantSearch")
            .value.toLowerCase().trim();

        const cards = document.querySelectorAll(".restaurant-card");

        let visibleCount = 0;

        cards.forEach(function(card) {

            const restaurantName = card
                .querySelector(".restaurant-name")
                .textContent.toLowerCase();

            const restaurantInfo = card
                .querySelector(".restaurant-info")
                .textContent.toLowerCase();

            const matches =
                restaurantName.includes(searchValue) ||
                restaurantInfo.includes(searchValue);

            card.style.display = matches ? "" : "none";

            if (matches) {
                visibleCount++;
            }

        });

        document.getElementById("searchMessage").textContent =
            visibleCount === 0
                ? "No matching restaurants found."
                : "";

    }

    document.getElementById("restaurantSearch")
        .addEventListener("input", searchRestaurants);

</script>

</body>
</html>