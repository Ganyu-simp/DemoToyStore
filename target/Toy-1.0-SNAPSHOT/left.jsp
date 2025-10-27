

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listC}" var="o">
                <li class="list-group-item ${tag == o.cid ? "active" : ""}"><a class="${tag == o.cid ? 'text-white' : 'text-black'}" href="CategoryServlet?cid=${o.cid}">${o.cname}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Latest product</div>
        <div class="card flex-fill">
            <img class="card-img-top fixed-image" src="${lastP.image}" alt="Card image cap">
            <div class="card-body">
                <h4 class="card-title show_txt"><a href="DetailServlet?id=${lastP.id}" title="View Product">${lastP.name}</a></h4>
                <p class="card-text show_txt flex-grow-1">${lastP.title}</p>
                <div class="row">
                    <div class="col">
                        <p class="btn btn-danger btn-block">
                        <fmt:formatNumber value="${lastP.price}" type="number" maxFractionDigits="0" groupingUsed="true" /> $
                        </p>
                    </div>
                    <div class="col">
                        <form action="AddToCart" method="post">
                            <input type="hidden" name="id" value="${lastP.id}"/>
                            <button class="btn btn-primary btn-block" type="submit">
                                <i class="fas fa-user-plus"></i> Add to cart
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>