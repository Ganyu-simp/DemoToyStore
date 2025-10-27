<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Manage Product</b></h2>
                        </div>

                    </div>
                </div>
                <form action="DeleteSelected" method="post" id="deleteForm">
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
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Quantity</th> <!-- ✅ Thêm dòng này -->
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" name="selectedIds" value="${o.id}" class="product-checkbox">
                                            <label></label>
                                        </span>
                                    </td>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td><img src="${o.image}"></td>
                                    <td>${o.price} $</td>
                                    <td>${o.quantity}</td> 
                                    <td>
                                        <a href="EditProduct?pid=${o.id}" class="edit" data-toggle="modal"><i class="material-icons" title="Edit">&#xE254;</i></a>
                                        <a href="DeleteProduct?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <hr style="margin: 30px 0;">

                    <!-- Hàng chứa Delete - Add - Back -->
                    <div class="row" style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">

                        <!-- Nút Delete -->
                        <form action="DeleteSelected" method="post" id="deleteForm" style="margin: 0;">
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Xóa tất cả sản phẩm đã chọn?')">
                                Delete Selected
                            </button>
                        </form>

                        <!-- Nút Add (ở giữa) -->
                        <a href="#addEmployeeModal" class="btn btn-success btn-sm" data-toggle="modal" style="min-width: 140px; text-align: center;">
                            <i class="material-icons" style="vertical-align: middle; font-size: 16px;">&#xE147;</i>
                            <span style="vertical-align: middle;">Add</span>
                        </a>

                        <!-- Nút Back -->
                        <a href="ProductServlet">
                            <button type="button" class="btn btn-primary btn-sm">
                                Back to home
                            </button>
                        </a>

                    </div>


                </form>

            </div>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="number" class="form-control" min="0" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                                $(document).ready(function () {
                                    // Khi checkbox "Select All" thay đổi trạng thái
                                    $("#selectAll").click(function () {
                                        $('tbody input[type="checkbox"]').prop('checked', this.checked);
                                    });

                                    // Nếu một checkbox con bị bỏ chọn, bỏ chọn luôn "Select All"
                                    $('tbody input[type="checkbox"]').click(function () {
                                        if (!this.checked) {
                                            $("#selectAll").prop('checked', false);
                                        }

                                        // Nếu tất cả checkbox con đều được chọn, tích lại "Select All"
                                        if ($('tbody input[type="checkbox"]:checked').length === $('tbody input[type="checkbox"]').length) {
                                            $("#selectAll").prop('checked', true);
                                        }
                                    });
                                });
        </script>

    </body>
</html>