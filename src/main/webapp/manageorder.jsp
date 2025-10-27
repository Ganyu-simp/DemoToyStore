<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Orders</title>
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
                    <h2><b>Manage Orders</b></h2>
                </div>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>User ID</th>
                            <th>Customer Name</th>
                            <th>Address</th>
                            <th>Phone Number</th>
                            <th>Order Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${listO}">
                            <tr>
                                <td>${o.oid}</td>
                                <td>${o.uid}</td>
                                <td>${o.customer}</td>
                                <td>${o.address}</td>
                                <td>${o.phonenum}</td>
                                <td>${o.date}</td>
                                <td>
                                    <a href="ManageOrderDetail?oid=${o.oid}" class="btn btn-info btn-sm">
                                        <i class="material-icons" title="View">&#xE8F4;</i> View
                                    </a>
                                    <a href="DeleteOrder?oid=${o.oid}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this order?')">
                                        <i class="material-icons" title="Delete">&#xE872;</i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:forEach var="od" items="${listOD}">
                            <c:set var="totalProfit" value="${totalProfit + od.quantity * od.price}" />
                        </c:forEach>
                        <tr style="font-weight: bold; background-color: #f9f9f9;">
                            <td colspan="6" style="text-align: right;">TOTAL PROFIT ($):</td>
                            <td>${totalProfit}</td>
                        </tr>
                    </tbody>
                </table>

                <a href="ProductServlet" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
    </body>
</html>
