
document.addEventListener("DOMContentLoaded", function () {

    // Registration form validation
    const registerForm = document.querySelector(
        'form[action$="/register"]'
    );

    if (registerForm) {
        registerForm.addEventListener("submit", function (event) {

            const password = registerForm.querySelector(
                'input[name="password"]'
            );

            if (password && password.value.length < 8) {
                event.preventDefault();
                alert("Password must contain at least 8 characters.");
                password.focus();
            }
        });
    }

    // Quantity validation
    const quantityInputs = document.querySelectorAll(
        'input[name="quantity"]'
    );

    quantityInputs.forEach(function (input) {

        input.addEventListener("change", function () {

            const quantity = parseInt(input.value, 10);

            if (isNaN(quantity) || quantity < 1) {
                input.value = 1;
                alert("Quantity must be at least 1.");
            }
        });
    });

    // Logout confirmation
    const logoutLinks = document.querySelectorAll(
        'a[href$="/logout"]'
    );

    logoutLinks.forEach(function (link) {

        link.addEventListener("click", function (event) {

            const confirmed = confirm(
                "Are you sure you want to logout?"
            );

            if (!confirmed) {
                event.preventDefault();
            }
        });
    });

});
