<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Fresh Picks - Your Online Vegetable Market</title>
    <s:url var="url_css" value="/static/css/style.css" />
    <link href="${url_css}" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2ecc71;
            --secondary-color: #27ae60;
            --accent-color: #f1c40f;
            --text-color: #2c3e50;
            --light-gray: #ecf0f1;
            --white: #ffffff;
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
        }

        .logo i {
            font-size: 2rem;
        }

        .logo h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        nav ul {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        nav a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background: var(--secondary-color);
        }

        /* Main Content Styles */
        main {
            padding: 3rem 0;
        }

        .login-container {
            max-width: 450px;
            margin: 0 auto;
            background: var(--white);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            color: var(--primary-color);
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: #666;
        }

        .alert {
            padding: 1rem;
            border-radius: 5px;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .alert-danger {
            background-color: #ffe5e5;
            color: #d63031;
            border: 1px solid #fab1a0;
        }

        .alert-success {
            background-color: #e8f5e9;
            color: #2ecc71;
            border: 1px solid #a8e6cf;
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
            transition: border-color 0.3s ease;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
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
            margin-bottom: 1rem;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .btn-link {
            color: var(--primary-color);
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .btn-link:hover {
            color: var(--secondary-color);
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
            .header-content {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            nav ul {
                flex-direction: column;
                gap: 0.5rem;
                text-align: center;
            }

            .login-container {
                margin: 0 1rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-leaf"></i>
                    <h1>Fresh Picks</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                        <li><a href="#"><i class="fas fa-store"></i> Shop</a></li>
                        <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
                        <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="login-container">
                <div class="login-header">
                    <h2>Welcome!</h2>
                    <p>Please login to your account</p>
                </div>

                <c:if test="${err != null}">
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle"></i> ${err}
                    </div>
                </c:if>

                <c:if test="${param.act eq 'lo'}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> Logout Successful! Thanks for using Fresh Picks.
                    </div>
                </c:if>

                <c:if test="${param.act eq 'reg'}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> Registration Successful. Please login.
                    </div>
                </c:if>

                <s:url var="url_login" value="/login" />
                <f:form action="${url_login}" modelAttribute="command">
                    <div class="form-group">
                        <label for="loginName">Username</label>
                        <f:input path="loginName" cssClass="form-control" placeholder="Enter your username" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <f:password path="password" cssClass="form-control" placeholder="Enter your password" />
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </button>
                        <a href="<s:url value="/reg_form"/>" class="btn btn-link">
                            <i class="fas fa-user-plus"></i> New User Registration
                        </a>
                    </div>
                </f:form>
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