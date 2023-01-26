<%-- 
    Document   : StudentRegister
    Created on : 28-Jul-2022, 2:47:40 pm
    Author     : asifk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Register</title>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            String quiz=request.getParameter("quiz");
        %>
        <!--<h1>Hello World!</h1>-->
         <nav style="background-color: #E7717D" class="navbar navbar-expand-lg shadow-lg rounded">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><h5>Quizvee</h5></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        <a class="nav-link active" href="#">About</a>
                        <a class="nav-link active" href="#">Contact us</a>
                        <!--<a class="nav-link disabled">Disabled</a>-->
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row align-items-start">
                <div class="col">
                    
                </div>
                <div class="col">
                    <div  class="card shadow-lg" style="background-color:#D9B08C;width: 30rem;">
                        <div class="card-body">
                            <h5 class="card-title">Fill your details</h5>
                            <form action="StudentRegister">
                                <div class="mb-3">
                                    <label for="formGroupExampleInput" class="form-label">Name</label>
                                    <input style="background-color:#FFCB9A" type="text" class="form-control" id="formGroupExampleInput" name="user_name" placeholder="Enter name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input style="background-color:#FFCB9A" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_email" placeholder="Enter Email" required>
                                    <!--<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>-->
                                </div>
<!--                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input style="background-color:#FFCB9A" type="password" class="form-control" id="exampleInputPassword1" name="user_password"  placeholder="Enter password" required>
                                </div>
                                <div class="mb-3 form-check">
                                    <input style="background-color:#FFCB9A" type="checkbox" class="form-check-input" id="exampleCheck1" value="checked" required>
                                    <label class="form-check-label" for="exampleCheck1">Accept terms & conditions</label>
                                </div>-->
                                 <% out.println("<input type='hidden' name='quiz' value=" + quiz + ">");%>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col">
                    
                </div>
            </div>


        </div>
    </div>
    </body>
</html>
