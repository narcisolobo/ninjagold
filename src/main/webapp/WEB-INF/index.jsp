<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css">
    <title>Ninja Gold</title>
</head>
<body class="bg-dark">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
        <div class="container">
            <span class="navbar-brand mb-0 h1">NINJA GOLD</span>
            <strong class="navbar-text ms-auto text-light">Your Gold: ${gold}</strong>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h4 class="card-title">Farm</h4>
                        <i class="fa-solid fa-cow fa-4x"></i>
                        <p>(earns 10-20 gold)</p>
                        <form action="/calculate" method="post">
                            <input type="hidden" name="location" value="farm">
                            <input type="submit" value="Find Gold!" class="btn btn-dark">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h4 class="card-title">Cave</h4>
                        <i class="fa-solid fa-mountain fa-4x"></i>
                        <p>(earns 5-10 gold)</p>
                        <form action="/calculate" method="post">
                            <input type="hidden" name="location" value="cave">
                            <input type="submit" value="Find Gold!" class="btn btn-dark">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h4 class="card-title">House</h4>
                        <i class="fa-solid fa-house-chimney-window fa-4x"></i>
                        <p>(earns 2-5 gold)</p>
                        <form action="/calculate" method="post">
                            <input type="hidden" name="location" value="house">
                            <input type="submit" value="Find Gold!" class="btn btn-dark">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h4 class="card-title">Quest</h4>
                        <i class="fa-solid fa-dragon fa-4x"></i>
                        <p>(earns/takes 0-50 gold)</p>
                        <form action="/calculate" method="post">
                            <input type="hidden" name="location" value="quest">
                            <input type="submit" value="Find Gold!" class="btn btn-dark">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h3 class="text-light">Activities:</h3>
                <div class="card">
                    <div class="card-body activities">
                        <c:forEach var="activity" items="${activities}">
                            ${activity}
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/ffd2134fa2.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>