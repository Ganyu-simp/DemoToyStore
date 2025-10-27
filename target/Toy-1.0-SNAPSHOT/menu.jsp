<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="ProductServlet">SKIBIDITOYS</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.isAdmin}">
                    <li class="nav-item">
                        <a class="nav-link" href="ManageAccount">Manager Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ManageProduct">Manager Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ManageOrder">Manager Order</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc.isSeller}">
                    <li class="nav-item">
                        <a class="nav-link" href="ManageProduct">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome ${sessionScope.acc.username}</a>
                    </li>
                    <!-- Hiển thị logout -->
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </c:if>


            </ul>
            <%
            String cart = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
            for (Cookie c : cookies) {
            if (c.getName().equals("cart")) {
            cart = c.getValue();
            break;
            }
            }
            }
            java.util.Set<String> productSet = new java.util.HashSet<>();
            if (cart != null && !cart.trim().isEmpty()) {
            String[] pidList = cart.split("-");
            for (String pid : pidList) {
            productSet.add(pid);
            }
            }
            int cartCount = productSet.size();
            request.setAttribute("cartCount", cartCount);
            %>
            
            <form action="SearchServlet" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${sValue}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="ManageCart">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">${cartCount}</span>

                </a>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">SKIBIDI TOYS</h1>
        <p class="lead text-muted mb-0">Play. Learn. Grow.</p>
    </div>
</section>


<!--end of menu-->
