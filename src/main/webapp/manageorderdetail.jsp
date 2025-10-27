<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <style>
            body {
                padding: 30px;
            }
            table {
                background-color: white;
            }
            .table-title {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <h2><b>Order Details</b> for Order ID: ${param.oid}</h2>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Order ID</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price ($)</th>
                            <th>Total ($)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="od" items="${listOD}">
                            <tr>
                                <td>${od.id}</td>
                                <td>${od.oid}</td>
                                <td>${od.pid}</td>
                                <td>${od.pname}</td>
                                <td>${od.quantity}</td>
                                <td>${od.price}</td>
                                <td>${od.quantity * od.price}</td>
                                <c:set var="grandTotal" value="${grandTotal + od.quantity * od.price}" />
                            </tr>
                        </c:forEach>
                        <tr style="font-weight: bold; background-color: #f9f9f9;">
                            <td colspan="6" style="text-align: right;">Grand Total ($):</td>
                            <td>${grandTotal}</td>
                        </tr>
                    </tbody>
                </table>
                        
                <a href="ManageOrder" class="btn btn-primary">Back to Orders</a>
            </div>
        </div>
    </body>
</html>
