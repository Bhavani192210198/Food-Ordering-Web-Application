package com.foodapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.CartDAO;
import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Cart;
import com.foodapp.model.Menu;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO;
    private MenuDAO menuDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        menuDAO = new MenuDAO();

        System.out.println("CartServlet initialized successfully.");
    }

    // Display cart with complete food details
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        List<Cart> cartItems;

        if (user != null) {

            // Retrieve logged-in user's cart from database
            cartItems = cartDAO.getCartByUserId(user.getId());

        } else {

            // Retrieve guest cart from session
            cartItems = (List<Cart>) session.getAttribute("guestCart");

            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }
        }

        // Populate missing food details using menu ID
        for (Cart cart : cartItems) {

            Menu food = menuDAO.getMenuById(cart.getMenuId());

            if (food != null) {

                cart.setItemName(food.getItemName());

                cart.setDescription(food.getDescription());

                cart.setCategory(food.getCategory());

                cart.setPrice(food.getPrice());

                cart.setImage(food.getImage());

            } else {

                System.out.println(
                    "Food item not found for menu ID: "
                    + cart.getMenuId()
                );
            }
        }

        request.setAttribute("cartItems", cartItems);

        request.getRequestDispatcher("/cart.jsp")
               .forward(request, response);
    }

    // Add item to cart
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {

            int menuId = Integer.parseInt(
                request.getParameter("menuId")
            );

            int quantity = Integer.parseInt(
                request.getParameter("quantity")
            );

            int restaurantId = Integer.parseInt(
                request.getParameter("restaurantId")
            );

            if (menuId <= 0 || quantity <= 0 || restaurantId <= 0) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid cart details."
                );

                return;
            }

            // Verify that the food item exists
            Menu food = menuDAO.getMenuById(menuId);

            if (food == null) {

                response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Food item not found."
                );

                return;
            }

            User user = (User) session.getAttribute("user");

            if (user != null) {

                // Logged-in user: save in database
                Cart cart = new Cart();

                cart.setUserId(user.getId());
                cart.setMenuId(menuId);
                cart.setQuantity(quantity);

                boolean added = cartDAO.addToCart(cart);

                if (!added) {

                    response.sendError(
                        HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Unable to add item to cart."
                    );

                    return;
                }

            } else {

                // Guest user: save in session
                List<Cart> guestCart =
                    (List<Cart>) session.getAttribute("guestCart");

                if (guestCart == null) {
                    guestCart = new ArrayList<>();
                }

                boolean itemExists = false;

                for (Cart item : guestCart) {

                    if (item.getMenuId() == menuId) {

                        item.setQuantity(
                            item.getQuantity() + quantity
                        );

                        itemExists = true;
                        break;
                    }
                }

                if (!itemExists) {

                    Cart cart = new Cart();

                    cart.setMenuId(menuId);
                    cart.setQuantity(quantity);

                    guestCart.add(cart);
                }

                session.setAttribute("guestCart", guestCart);
            }

            // Return to the same restaurant menu page
            response.sendRedirect(
                request.getContextPath()
                + "/menu?restaurantId=" + restaurantId
                + "&added=1"
            );

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid menu or restaurant ID."
            );
        }
    }
}