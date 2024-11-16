<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Join Fresh Picks - Registration</title>
    <s:url var="url_css" value="/static/css/style.css" />
    <link href="${url_css}" rel="stylesheet" type="text/css" />
    <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
    <script src="${url_jqlib}"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2ecc71;
            --secondary-color: #27ae60;
            --accent-color: #f1c40f;
            --text-color: #2c3e50;
            --light-gray: #ecf0f1;
            --white: #ffffff;
            --danger: #e74c3c;
            --success: #27ae60;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background: linear-gradient(135deg, #f6f9fc 0%, #eef2f7 100%);
            min-height: 100vh;
            padding-bottom: 60px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        header {
            background: var(--primary-color);
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--white);
            text-decoration: none;
        }

        .logo i {
            font-size: 2rem;
        }

        .logo h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        /* Main Content Styles */
        .registration-container {
            max-width: 600px;
            margin: 2rem auto;
            background: var(--white);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .registration-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .registration-header h2 {
            color: var(--primary-color);
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .registration-header p {
            color: #666;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #ddd;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(46, 204, 113, 0.1);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        .input-group {
            display: flex;
            gap: 10px;
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
            width: 100%;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: var(--light-gray);
            color: var(--text-color);
        }

        .btn-secondary:hover {
            background-color: #dde4e6;
        }

        .text-danger {
            color: var(--danger);
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        #id_res_div {
            margin-top: 0.5rem;
            padding: 0.5rem;
            border-radius: 4px;
            font-size: 0.9rem;
        }

        .availability-success {
            background-color: #d4edda;
            color: var(--success);
            padding: 0.5rem;
            border-radius: 4px;
        }

        .availability-error {
            background-color: #f8d7da;
            color: var(--danger);
            padding: 0.5rem;
            border-radius: 4px;
        }

        /* Footer Styles */
        footer {
            background: var(--text-color);
            color: var(--white);
            padding: 1rem 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .registration-container {
                margin: 1rem;
                padding: 1.5rem;
            }

            .input-group {
                flex-direction: column;
            }

            .btn-secondary {
                width: 100%;
            }
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#id_check_avail").click(function () {
                const username = $("#id_username").val();
                if (!username) {
                    $("#id_res_div").html('<div class="availability-error"><i class="fas fa-exclamation-circle"></i> Please enter a username</div>');
                    return;
                }

                $("#id_res_div").html('<div class="text-primary"><i class="fas fa-spinner fa-spin"></i> Checking availability...</div>');

                $.ajax({
                    url: 'check_avail',
                    data: { username: username },
                    success: function (data) {
                        if (data.includes("available")) {
                            $("#id_res_div").html('<div class="availability-success"><i class="fas fa-check-circle"></i> ' + data + '</div>');
                        } else {
                            $("#id_res_div").html('<div class="availability-error"><i class="fas fa-times-circle"></i> ' + data + '</div>');
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <a href="<s:url value="/"/>" class="logo">
                    <i class="fas fa-leaf"></i>
                    <h1>Fresh Picks</h1>
                </a>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="registration-container">
                <div class="registration-header">
                    <h2>Create Account</h2>
                    <p>Join Fresh Picks and start shopping fresh vegetables today!</p>
                </div>

                <c:if test="${err != null}">
                    <div class="text-danger">
                        <i class="fas fa-exclamation-circle"></i> ${err}
                    </div>
                </c:if>

                <s:url var="url_reg" value="/register" />
                <f:form action="${url_reg}" modelAttribute="command">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i> Full Name</label>
                        <f:input path="user.name" class="form-control" placeholder="Enter your full name" />
                    </div>

                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone"></i> Phone Number</label>
                        <f:input path="user.phone" class="form-control" placeholder="Enter your phone number" />
                    </div>

                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email Address</label>
                        <f:input path="user.email" class="form-control" placeholder="Enter your email address" />
                    </div>

                    <div class="form-group">
                        <label for="address"><i class="fas fa-map-marker-alt"></i> Delivery Address</label>
                        <f:textarea path="user.address" class="form-control" placeholder="Enter your delivery address" />
                    </div>

                    <div class="form-group">
                        <label for="username"><i class="fas fa-user-circle"></i> Username</label>
                        <div class="input-group">
                            <f:input path="user.loginName" class="form-control" id="id_username" placeholder="Choose a username" />
                            <button type="button" class="btn btn-secondary" id="id_check_avail">
                                <i class="fas fa-check-circle"></i> Check Availability
                            </button>
                        </div>
                        <div id="id_res_div"></div>
                    </div>

                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password</label>
                        <f:password path="user.password" class="form-control" placeholder="Create a strong password" />
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-user-plus"></i> Create Account
                        </button>
                    </div>
                </f:form>

                <div class="divider">
                                    <span>or</span>
                                </div>

                                <div class="login-section">
                                    <p>Already have an account?</p>
                                    <a href="<s:url value="/"/>" class="btn btn-outline">
                                        <i class="fas fa-sign-in-alt"></i>
                                        Login Here
                                    </a>
                                </div>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Fresh Picks - Your Online Vegetable Market. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>