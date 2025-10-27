<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Manage Accounts</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Manage Accounts</b></h2>
                        </div>
                    </div>
                </div>

                <!-- Form Delete -->
                <form action="DeleteSelectedAccounts" method="post" id="deleteForm">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Is Seller</th>
                                <th>Is Admin</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listA}" var="a">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" name="selectedIds" value="${a.uid}" class="account-checkbox">
                                            <label></label>
                                        </span>
                                    </td>
                                    <td>${a.uid}</td>
                                    <td>${a.username}</td>
                                    <td>${a.password}</td>
                                    <td><c:choose>
                                            <c:when test="${a.isSeller}">Yes</c:when>
                                            <c:otherwise>No</c:otherwise>
                                        </c:choose></td>
                                    <td><c:choose>
                                            <c:when test="${a.isAdmin}">Yes</c:when>
                                            <c:otherwise>No</c:otherwise>
                                        </c:choose></td>
                                    <td>
                                        <a href="EditAccount?uid=${a.uid}" class="edit" title="Edit"><i class="material-icons">&#xE254;</i></a>
                                        <a href="DeleteAccount?uid=${a.uid}" class="delete" title="Delete"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <hr style="margin: 30px 0;">

                    <div class="row" style="display: flex; justify-content: space-between; align-items: center;">
                        <!-- Delete -->
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Delete all selected accounts?')">
                            Delete Selected
                        </button>

                        <!-- Add -->
                        <a href="#addAccountModal" class="btn btn-success btn-sm" data-toggle="modal" style="min-width: 140px;">
                            <i class="material-icons">&#xE147;</i> <span>Add</span>
                        </a>

                        <!-- Back -->
                        <a href="AdminDashboard">
                            <button type="button" class="btn btn-primary btn-sm">Back</button>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Add Account Modal -->
        <div id="addAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddAccount" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Username</label>
                                <input name="username" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input name="password" type="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Is Seller</label>
                                <select name="isSeller" class="form-control" required>
                                    <option value="" selected disabled>-- Select --</option>
                                    <option value="true">Yes</option>
                                    <option value="false">No</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Is Admin</label>
                                <select name="isAdmin" class="form-control" required>
                                    <option value="" selected disabled>-- Select --</option>
                                    <option value="true">Yes</option>
                                    <option value="false">No</option>
                                </select>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $("#selectAll").click(function () {
                    $('tbody input[type="checkbox"]').prop('checked', this.checked);
                });

                $('tbody input[type="checkbox"]').click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop('checked', false);
                    }
                    if ($('tbody input[type="checkbox"]:checked').length === $('tbody input[type="checkbox"]').length) {
                        $("#selectAll").prop('checked', true);
                    }
                });
            });
        </script>
    </body>
</html>
