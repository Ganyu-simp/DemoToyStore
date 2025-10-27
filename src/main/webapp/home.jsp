<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <style>

        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <c:if test="${not empty msg}">
            <div class="alert alert-success text-center">
                ${msg}
            </div>
        </c:if>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="ProductServlet">Home</a></li>
                            <li class="breadcrumb-item"><a href="CategoryServlet">Category</a></li>
                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <jsp:include page="left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="row d-flex">
                        <c:choose>
                            <c:when test="${empty listP}">
                                <div class="col-12">
                                    <h4 class="text-center text-muted">No product found.</h4>
                                </div>
                            </c:when> 
                            <c:otherwise>
                                <c:forEach items="${listP}" var="o">
                                    <div class="col-12 col-md-6 col-lg-4 d-flex">
                                        <div class="card flex-fill">
                                            <img class="card-img-top fixed-image" src="${o.image}" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title show_txt"><a href="DetailServlet?id=${o.id}" title="View Product">${o.name}</a></h4>
                                                <p class="card-text show_txt flex-grow-1">${o.title}</p>
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="btn btn-danger btn-block">
                                                            <fmt:formatNumber value="${o.price}" type="number" maxFractionDigits="0" groupingUsed="true" /> $
                                                        </p>
                                                    </div>
                                                    <div class="col">
                                                        <form action="AddToCart" method="post">
                                                            <input type="hidden" name="id" value="${o.id}"/>
                                                            <button class="btn btn-primary btn-block" type="submit">
                                                                <i class="fas fa-user-plus"></i> Add to cart
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

