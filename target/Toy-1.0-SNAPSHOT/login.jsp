<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap & FontAwesome -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" rel="stylesheet"/>

        <style>
            body {
                background: #f5f6fa;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                font-family: 'Segoe UI', sans-serif;
            }

            #logreg-forms {
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 400px;
            }

            .form-control {
                border-radius: 30px;
            }

            .btn-block {
                border-radius: 30px;
            }

            .form-signup {
                display: none;
            }

            .text-danger {
                text-align: center;
                font-size: 14px;
            }

            .toggle-link {
                display: block;
                margin-top: 10px;
                text-align: center;
                font-size: 14px;
            }

            .toggle-link a {
                color: #007bff;
                text-decoration: none;
            }

            .toggle-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <div id="logreg-forms">
            <!-- Login Form -->
            <form id="loginForm" class="form-signin" action="LoginServlet" method="post">
                <h4 class="text-center mb-4">Sign in</h4>
                <p class="text-danger">${mess}</p>
                <input name="user" type="text" class="form-control mb-2" placeholder="Username" required autofocus>
                <input name="pass" type="password" class="form-control mb-2" placeholder="Password" required>

                <div class="form-check mb-3">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>

                <button class="btn btn-success btn-block" type="submit">
                    <i class="fas fa-sign-in-alt"></i> Sign in
                </button>

                <div class="toggle-link">
                    <a href="#" id="btn-signup">Don't have an account? Sign up</a>
                </div>
            </form>

            <!-- Signup Form -->
            <form action="SignupServlet" method="post" class="form-signup">
                <h4 class="text-center mb-4">Sign up</h4>

                <input name="user" type="text" class="form-control mb-2" placeholder="Username" required autofocus>
                <input name="pass" type="password" class="form-control mb-2" placeholder="Password" required>
                <input name="repass" type="password" class="form-control mb-2" placeholder="Repeat Password" required>

                <button class="btn btn-primary btn-block" type="submit">
                    <i class="fas fa-user-plus"></i> Sign Up
                </button>

                <div class="toggle-link">
                    <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back to login</a>
                </div>
            </form>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(function () {
                $('#btn-signup').click(function (e) {
                    e.preventDefault();
                    $('.form-signin').hide();
                    $('.form-signup').show();
                });

                $('#cancel_signup').click(function (e) {
                    e.preventDefault();
                    $('.form-signup').hide();
                    $('.form-signin').show();
                });
            });


            document.getElementById("loginForm").addEventListener("submit", function (e) {
                const username = document.querySelector("input[name='user']");
                const password = document.querySelector("input[name='pass']");

                // Xóa class lỗi cũ nếu có
                username.classList.remove("is-invalid");
                password.classList.remove("is-invalid");

                let valid = true;

                if (username.value.trim() === "") {
                    username.classList.add("is-invalid");
                    valid = false;
                }

                if (password.value.trim() === "") {
                    password.classList.add("is-invalid");
                    valid = false;
                }

                if (!valid) {
                    e.preventDefault(); // Ngăn form submit nếu có lỗi
                }
            });


        </script>
    </body>
</html>
