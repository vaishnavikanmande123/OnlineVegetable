<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Vegetables - Your Online Vegetable Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        header {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('header-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 3rem;
            text-align: center;
            height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        nav {
            background-color: #4CAF50;
            padding: 1rem;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 4px;
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #4CAF50;
            color: white;
        }

        .search-nav {
            flex-grow: 1;
            max-width: 400px;
            position: relative;
        }

        .search-nav input {
            width: 100%;
            padding: 0.5rem 2.5rem 0.5rem 1rem;
            border-radius: 20px;
            border: none;
            font-size: 0.9rem;
        }

        .search-nav button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #4CAF50;
            cursor: pointer;
        }

        .nav-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #45a049;
        }

        .cart-icon {
            position: relative;
            padding: 0.5rem;
        }

        .cart-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: #ff4444;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
        }

        .categories-nav {
            background-color: #f1f1f1;
            padding: 1rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .categories-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            gap: 2rem;
        }

        .category-link {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s;
        }

        .category-link:hover {
            background-color: #4CAF50;
            color: white;
        }

        .section-title {
            margin: 2rem 0;
            text-align: center;
            color: #333;
            font-size: 2rem;
        }

        .category-section {
            padding: 2rem;
            background-color: #f9f9f9;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .product-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            width: 100%;
            height: 200px;
            position: relative;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-info {
            padding: 1rem;
        }

        .add-to-cart {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 0.5rem;
            width: 100%;
            transition: background-color 0.3s;
        }

        .add-to-cart:hover {
            background-color: #45a049;
        }

        .price {
            color: #4CAF50;
            font-weight: bold;
            font-size: 1.2rem;
            margin: 0.5rem 0;
        }

        .logout-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        .logout-btn:hover {
            background-color: green;
        }

        footer {
            background-color: #333;
            color: white;
            padding: 2rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-container">
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#products">Products</a></li>
                <li class="dropdown">
                    <a href="#menu">Menu</a>
                    <div class="dropdown-content">
                        <a href="#orders">Orders</a>
                        <a href="#account">Account</a>
                        <a href="#buy-again">Buy Again</a>
                    </div>
                </li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <div class="search-nav">
                <input type="text" placeholder="Search for vegetables...">
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
            <div class="nav-actions">
                <a href="#cart" class="cart-icon">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="cart-count">0</span>
                </a>
                <button class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>
    </nav>


    <header style="text-align: center; padding: 20px; background-color: #f8f8f8; background-size: cover;">
         <h1>Fresh Vegetables</h1>
         <p>Fresh Vegetables Delivered to Your Doorstep</p>
    </header>



    <div class="categories-nav">
        <div class="categories-container">
            <a href="#leafy" class="category-link">Leafy Greens</a>
            <a href="#root" class="category-link">Root Vegetables</a>
            <a href="#seasonal" class="category-link">Seasonal</a>
            <a href="#organic" class="category-link">Organic</a>
        </div>
    </div>

    <section class="category-section" id="leafy">
        <h2 class="section-title">Leafy Greens</h2>
        <div class="products-grid">
            <div class="product-card">
                <div class="product-image">
                 <s:url var="url_bg" value="/static/images/spinach.png"/>
                 <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Fresh Spinach</h3>
                    <p>Organic, locally grown</p>
                    <p class="price">₹89/bunch</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                <s:url var="url_bg" value="/static/images/lettuce.png"/>
                <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Iceberg Lettuce</h3>
                    <p>Crisp and fresh</p>
                    <p class="price">₹75/head</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                <s:url var="url_bg" value="/static/images/coriander.png"/>
                <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Fresh Coriander</h3>
                    <p>Rich in nutrients</p>
                    <p class="price">₹129/bunch</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="category-section" id="root">
        <h2 class="section-title">Root Vegetables</h2>
        <div class="products-grid">
            <div class="product-card">
                <div class="product-image">
                <s:url var="url_bg" value="/static/images/carrot.png"/>
                 <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Fresh Carrots</h3>
                    <p>Sweet and crunchy</p>
                    <p class="price">₹49/kg</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                 <s:url var="url_bg" value="/static/images/onion.png"/>
                 <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3> Onions</h3>
                    <p>Essential cooking staple</p>
                    <p class="price">₹65/kg</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                 <s:url var="url_bg" value="/static/images/beetroot.png"/>
                 <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Fresh Beets</h3>
                    <p>Vibrant and nutrient-rich</p>
                    <p class="price">₹79/bunch</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="category-section" id="seasonal">
        <h2 class="section-title">Seasonal Vegetables</h2>
        <div class="products-grid">
            <div class="product-card">
                <div class="product-image">
                <s:url var="url_bg" value="/static/images/radish.png"/>
                <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Fresh Radish</h3>
                    <p>Perfect for fall recipes</p>
                    <p class="price">₹149/piece</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                 <s:url var="url_bg" value="/static/images/asparagus.png"/>
                 <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Asparagus</h3>
                    <p>Spring favorite</p>
                    <p class="price">₹199/bunch</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                <s:url var="url_bg" value="/static/images/corn.png"/>
                <img src=${url_bg}/>
                </div>
                <div class="product-info">
                    <h3>Sweet Corn</h3>
                    <p>Summer special</p>
                    <p class="price">₹25/piece</p>
                    <button class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="category-section" id="Organic">
           <h2 class="section-title">Oraganic Vegetables</h2>
           <div class="products-grid">
               <div class="product-card">
                   <div class="product-image">
                   <s:url var="url_bg" value="/static/images/tomato.png"/>
                   <img src=${url_bg}/>
                   </div>
                   <div class="product-info">
                       <h3>Fresh Tomatoes</h3>
                       <p>Pesticide-free, naturally grown</p>
                       <p class="price">₹149/piece</p>
                       <button class="add-to-cart">
                           <i class="fas fa-cart-plus"></i> Add to Cart
                       </button>
                   </div>
               </div>
               <div class="product-card">
                   <div class="product-image">
                    <s:url var="url_bg" value="/static/images/okra.png"/>
                    <img src=${url_bg}/>
                   </div>
                   <div class="product-info">
                       <h3>lady finger</h3>
                       <p>Spring favorite</p>
                       <p class="price">₹199/bunch</p>
                       <button class="add-to-cart">
                           <i class="fas fa-cart-plus"></i> Add to Cart
                       </button>
                   </div>
               </div>
               <div class="product-card">
                   <div class="product-image">
                   <s:url var="url_bg" value="/static/images/garlic.png"/>
                   <img src=${url_bg}/>
                   </div>
                   <div class="product-info">
                       <h3>Garlic</h3>
                       <p>Summer special</p>
                       <p class="price">₹25/piece</p>
                       <button class="add-to-cart">
                           <i class="fas fa-cart-plus"></i> Add to Cart
                       </button>
                   </div>
               </div>
           </div>
      </section>

    <footer>
        <p>© 2024 Fresh Vegetables. All rights reserved.</p>
        <p>Contact us: info@freshvegetables.com</p>
        <p>Address: 123 Farmer's Market Street, Garden City</p>
    </footer>
</body>
</html>