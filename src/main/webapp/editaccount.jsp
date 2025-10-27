<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Edit Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <h2>Edit <b>Account</b></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div id="editAccountModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="EditAccount" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                                <a href="ManageAccount" class="close" aria-hidden="true" style="text-decoration: none;">&times;</a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>User ID</label>
                                    <input type="text" name="uid" value="${detail.uid}" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="username" value="${detail.username}" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="text" name="password" value="${detail.password}" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Is Seller</label>
                                    <input type="checkbox" name="isSeller" <c:if test="${detail.isSeller}">checked</c:if> >
                                    </div>
                                    <div class="form-group">
                                        <label>Is Admin</label>
                                        <input type="checkbox" name="isAdmin" <c:if test="${detail.isAdmin}">checked</c:if> >
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.querySelector('form[action="editaccount"]').addEventListener('submit', function (e) {
                const inputs = this.querySelectorAll('input[type="text"], textarea');
                let isValid = true;

                inputs.forEach(function (input) {
                    if (input.hasAttribute('required') && !input.value.trim()) {
                        isValid = false;
                        input.style.border = '1px solid red';
                    } else {
                        input.style.border = '';
                    }
                });

                if (!isValid) {
                    e.preventDefault();
                    alert('Please fill in all required fields!');
                }
            });
        </script>

    </body>
</html>
