<%-- 
    Document   : history.jsp
    Created on : Jan 16, 2021, 5:44:41 PM
    Author     : Tam Dang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>History</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Yellowtail:regular" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Stencil+Text:100,300,regular,500,600,700,800,900" rel="stylesheet" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body style="background: url('https://image.freepik.com/free-vector/watercolor-background_91008-33.jpg'); background-size: cover">
        <div class="header-container">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: darksalmon;">
                <a class="navbar-brand" href="MainController?pageIndex=1" style="font-size: 2rem;"><i class="fa fa-birthday-cake"
                                                                                                      aria-hidden="true"></i>HanaShop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <ul class="navbar-contact" style="margin-left: 10%">
                    <li class="contact-item"><i class="fa fa-phone" aria-hidden="true"></i>0774-839-222</li>
                    <li class="contact-item"><i class="fa fa-google" aria-hidden="true"></i>Hanashop@gmail.com</li>
                    <li class="contact-item"><i class="fa fa-map" aria-hidden="true"></i>Sky9 Apartment, District 9, HCM City
                    </li>
                </ul>
                <div class="collapse navbar-collapse" id="navbarNav" style="margin-left: 2%;">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="MainController?pageIndex=1">Home <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <c:if test="${not empty sessionScope.ACCOUNT}">
                        <div class="user">
                            <i class="fa fa-user-circle"></i> Welcome, ${sessionScope.ACCOUNT.name}
                        </div>
                        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'false'}">
                            <div class="cart">
                                <a href="cart.jsp"><button type="button" class="btn btn-primary logout" style="margin-left: 5px;background: transparent;margin-top: 30px;border: 2px solid black;border-radius: 10%;padding: 5px;font-weight: bold;font-family: monospace; color: black">
                                        <c:set var="cartSize" value="${sessionScope.CART.items.values().size()}"/>
                                        <i class="fa fa-shopping-cart"></i> Your Cart (<c:if test="${empty cartSize}">0</c:if><c:if test="${not empty cartSize}">${cartSize}</c:if>)
                                            <span class="sr-only">Products in your cart</span>
                                        </button></a>
                                </div>
                        </c:if>
                        <form action="MainController">
                            <div class="logout">
                                <button class="logout-button" name="btAction" value="logout"><i class="fa fa-sign-out"></i> Sign out</button>
                            </div>
                        </form>
                        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'false'}">
                            <div class="logout">
                                <a href="MainController?btAction=load_history"><button class="logout-button"><i class="fa fa-book"></i> History</button></a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                            <div class="logout">
                                <a href="history.jsp"><button class="logout-button"><i class="fa fa-book"></i> History</button></a>
                            </div>
                        </c:if>

                    </c:if>
                </div>
            </nav>
        </div>
        <div class="banner-store" style="margin-top: 1%">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 10%;">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="https://www.dineout.co.in/blog/wp-content/uploads/2016/12/blog-1400x400.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="https://www.dineout.co.in/blog/wp-content/uploads/2017/02/blog-Banner-1400x400.jpg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="https://www.dineout.co.in/blog/wp-content/uploads/2016/12/Blog-banner-1400x400.jpg" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="toolbar">
            <div class="row">
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">
                    <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                        <form class="form-inline" action="MainController" style="margin:30px; justify-content: flex-end">
                            <input class="form-control mr-sm-2" type="search" placeholder="Please input to search" aria-label="Search" name="searchName" value="${param.searchName}">
                            <c:set var="searchName" value = "${param.searchName}"></c:set>
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                        name="btAction" value="search_history_by_name" style="font-weight:bold"
                                        ><i class="fa fa-search"></i>
                                </button>
                            <c:if test="${not empty searchName}">
                                <a class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                   href="history.jsp" style="margin-left: 5px;"
                                   >All
                                </a>
                            </c:if>
                        </form>
                    </c:if>
                </div>
                <div class="col-sm-4">
                    <div>
                        <div class="dropdown show">
                            <a class="btn btn-secondary dropdown-toggle" style="background-color: white; border-color: rgb(5, 163, 5);color: rgb(5, 163, 5);" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Month
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="MainController?btAction=load_history" style="font-weight:bold;">All</a>
                                <c:forEach var="month" begin="1" end="12" step="1" >
                                    <form action="MainController">
                                        <input type="hidden" name="month" value="${month}" />
                                        <button class="dropdown-item" name="btAction" value="search_history_by_month">${month}</button>
                                    </form>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="history">
            <div class="banner" style="margin: 30px; text-align: center;
                 background: mistyrose;
                 font-size: 30px;
                 font-weight: bold;
                 font-family: monospace;
                 opacity: 0.5;">---HISTORY---
            </div>
            <c:if test ="${empty month}">
                <c:forEach items="${requestScope.BILLS_HISTORY}" var="bill">
                    <div style="margin-left:10%;margin-right:10%;margin-bottom:2%;margin-top:2%;">
                        <div style="font-weight: bold">ID: ${bill.fullname} - 00${bill.billID}</div>
                        <div style="font-weight: bold">DATE: ${bill.date_checkOut}</div>
                        <table class="table" border="3">
                            <thead style="border: 3px solid black">
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Unit Price($)</th>
                                    <th>Quantity</th>
                                    <th>Total($)</th>
                                </tr>
                            </thead>
                            <tbody style="border: 3px solid black">
                                <c:forEach items="${requestScope.BILLS_DETAIL_HISTORY.billDetail.get(bill.billID)}" var="dto" varStatus="counter" >
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${dto.name}</td>
                                        <td><img src="${dto.img}" width="100px"></td>
                                        <td>${dto.price}</td>
                                        <td>${dto.quantity}</td>
                                        <td>${Math.floor((dto.price * dto.quantity)*100)/100}</td>
                                    </tr>

                                </c:forEach>
                                <tr>
                                    <td colspan="5" style="font-weight: bold"> Total($)</td>
                                    <td colspan="1" style="font-weight: bold"> ${bill.totalPrice}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${not empty month}">
                <c:forEach items="${requestScope.BILLS_HISTORY}" var="bill">
                    <div style="margin-left:10%;margin-right:10%;margin-bottom:2%;margin-top:2%;">
                        <div style="font-weight: bold">ID: ${bill.fullname} - 00${bill.billID}</div>
                        <div style="font-weight: bold">DATE: ${bill.date_checkOut}</div>
                        <table class="table" border="3">
                            <thead style="border: 3px solid black">
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Unit Price($)</th>
                                    <th>Quantity</th>
                                    <th>Total($)</th>
                                </tr>
                            </thead>
                            <tbody style="border: 3px solid black">
                                <c:forEach items="${requestScope.BILLS_DETAIL_HISTORY.billDetail.get(bill.billID)}" var="dto" varStatus="counter" >
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${dto.name}</td>
                                        <td><img src="${dto.img}" width="100px"></td>
                                        <td>${dto.price}</td>
                                        <td>${dto.quantity}</td>
                                        <td>${Math.floor((dto.price * dto.quantity)*100)/100}</td>
                                    </tr>

                                </c:forEach>
                                <tr>
                                    <td colspan="5" style="font-weight: bold"> Total($)</td>
                                    <td colspan="1" style="font-weight: bold"> ${bill.totalPrice}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${not empty searchName}">
                
            </c:if>
            <c:if test="${empty searchName}">
                <!--RESET TRANG-->
            </c:if>
        </div>
        <style>
            .navbar-brand {
                font-weight: bold;
                font-family: 'Yellowtail';
                color: black;
                letter-spacing: 5px;
                border: 1px dotted antiquewhite;
                border-radius: 10%;
                padding: 1%;
                background-color: antiquewhite;
                box-shadow: 5px 5px 20px 5px black;
                margin-left: 5%;
            }
            .banner-store .carousel-inner img {
                border-radius: 10%;
                border: 10px dotted darksalmon;
                padding: 10px;
            }
            .table{
                background: bisque;
                text-align: center;
            }
        </style>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>