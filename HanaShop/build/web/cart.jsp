<%-- 
    Document   : cart.jsp
    Created on : Jan 13, 2021, 1:32:03 PM
    Author     : Tam Dang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Your Cart</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">
        <!-- Google Font-->
        <link href="https://fonts.googleapis.com/css?family=Yellowtail:regular" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Stencil+Text:100,300,regular,500,600,700,800,900" rel="stylesheet" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>

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
                        <c:if test="${empty sessionScope.ACCOUNT}">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signup.html">Sign Up</a>
                            </li>
                        </c:if>
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
        <c:set var="items" value="${sessionScope.CART.items}" />
        <div class="banner" style="margin: 30px; text-align: center;
             background: mistyrose;
             font-size: 30px;
             font-weight: bold;
             font-family: monospace;
             opacity: 0.5;">---YOUR CART---</div>
        <c:if test="${not empty items}">
            <table border="3" class="table" style="margin-top: 1%;margin: 1% auto;width: 70%;background: ghostwhite;text-align: center; border: #17a2b8;">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Into Money</th>
                        <th>Remove</th>
                    </tr>
                </thead>

                <tbody>
                <form action="MainController">
                    <c:set var="out_of_stock" value="${requestScope.OUT_OF_STOCK}"/>
                    <c:forEach var="dto" items="${items}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.value.name}</td>
                            <td><img src="${dto.value.img}" width="100px"></td>
                            <td><input name ="txtQuantity" id="quantity_${dto.value.proID}" class="col-sm-3 form-control-sm"  min="1" oninput="calc${dto.value.proID}()" value="${dto.value.quantity}"
                                       onchange="
                                               let totalPrice = document.getElementsByName('totalPrice');
                                               let totalPriceCart = 0;
                                               for (var i = 0; i < totalPrice.length; i++) {
                                                   totalPriceCart = totalPriceCart + parseFloat(totalPrice[i].value);
                                               }
                                               document.getElementById('totalPrice').value = totalPriceCart;
                                               document.getElementById('inputTotalPrice').value = totalPriceCart;
                                       "
                                       onkeyup="
                                               let totalPrice = document.getElementsByName('totalPrice');
                                               let totalPriceCart = 0;
                                               for (var i = 0; i < totalPrice.length; i++) {
                                                   totalPriceCart = totalPriceCart + parseFloat(totalPrice[i].value);
                                               }
                                               document.getElementById('totalPrice').value = totalPriceCart;
                                               document.getElementById('inputTotalPrice').value = totalPriceCart;
                                       " onkeypress="return event.charCode >= 48" required type="number" value="${dto.value.quantity}"><br/>
                                <c:if test="${out_of_stock.containsKey(dto.value.proID)}"><div style="color:red; font-weight: bold">This product is only remain ${out_of_stock.get(dto.value.proID)}</div></c:if>
                                </td>
                                <td>${dto.value.price} $
                                <input type="hidden" id="price_${dto.value.proID}" value="${dto.value.price}" />
                            </td>
                            <td><input name="totalPrice" id="total_${dto.value.proID}" readonly class="col-sm-3 form-control-small" style="background:transparent; border:0px; text-align: right" value="${Math.floor((dto.value.quantity * dto.value.price)*100)/100}">$ </td>
                                <c:set var="totalPrice" value="${totalPrice + Math.floor((dto.value.quantity*dto.value.price)*100)/100}"></c:set>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${dto.value.proID.trim()}">
                                    Remove
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="${dto.value.proID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Do you remove ${dto.value.name} from your cart ?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <a href="MainController?btAction=remove_from_cart&pk_remove=${dto.value.proID.trim()}"><button type="button" class="btn btn-primary">Delete</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <script>
                            function calc${dto.value.proID}()
                            {
                                let price = document.getElementById("price_${dto.value.proID}").value;
                                let quantity = document.getElementById("quantity_${dto.value.proID}").value;
                                let total = Math.floor((quantity * price) * 100) / 100;
                                if (!isNaN(total)) {
                                    document.getElementById("total_${dto.value.proID}").value = total;
                                }
                            }
                        </script>
                    </c:forEach>
                    <tr>
                        <td colspan="5" style="font-weight: bold;text-align: center">TOTAL PRICE: </td>
                        <td colspan="1" style="font-weight: bold;text-align: center"><input type="text" readonly class="col-sm-3 form-control-small" style="border:0px;text-align: right; background: transparent; font-weight: bold" id="totalPrice" value="${totalPrice}"> $</input></td>
                    </tr>
                    </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin-left: 70%;margin-right: 15%;width: -webkit-fill-available;">
                Check Out
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirm Checkout</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="inputFullname" class="col-sm-2 col-form-label">Fullname:</label>
                                <div class="col-sm-10">
                                    <input name="txtFullname" type="text" class="form-control" id="inputFullname" placeholder="Fullname" value="" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAddress" class="col-sm-2 col-form-label">Address:</label>
                                <div class="col-sm-10">
                                    <input name="txtAddress" type="text" class="form-control" id="inputAddress" placeholder="Address" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPhone" class="col-sm-2 col-form-label">Phone: </label>
                                <div class="col-sm-10">
                                    <input name="txtPhone" type="text" class="form-control" id="inputPhone" placeholder="0123-456-789" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputTotalPrice" class="col-sm-3 col-form-label">Total Price:</label>
                                <div class="col-sm-2">
                                    <input name="txtTotalPrice" type="text" readonly class="form-control-plaintext" id="inputTotalPrice" value="${totalPrice}" style="font-size: 15px;font-weight: bold">
                                </div>
                                <div class="col-sm-7">
                                    <div style="font-size: 20px; font-weight: bold"> $ </div>
                                </div>
                            </div>
                            <fieldset class="form-group row">
                                <label for="inputPayment" class="col-sm-3 col-form-label">Payment by:</label>
                                <div class="col-sm-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                        <label class="form-check-label" for="gridRadios1">
                                            <i class="fa fa-money" aria-hidden="true"></i> Cash
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input " type="radio" name="gridRadios" id="gridRadios2" value="option2" disabled>
                                        <label class="form-check-label" for="gridRadios2">
                                            <i class="fa fa-paypal" aria-hidden="true"></i> Paypal (coming soon)
                                        </label>
                                    </div>
                                </div>
                            </fieldset>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" name="btAction" value="check_out" class="btn btn-primary btn-block">Confirm</button>
                            <script>
                                let button = document.querySelector('.button');
                                let buttonText = document.querySelector('.tick');

                                const tickMark = "<svg width=\"58\" height=\"45\" viewBox=\"0 0 58 45\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M19.11 44.64L.27 25.81l5.66-5.66 13.18 13.18L52.07.38l5.65 5.65\"/></svg>";

                                buttonText.innerHTML = "Submit";

                                button.addEventListener('click', function () {

                                    if (buttonText.innerHTML !== "Submit") {
                                        buttonText.innerHTML = "Submit";
                                    } else if (buttonText.innerHTML === "Submit") {
                                        buttonText.innerHTML = tickMark;
                                    }
                                    this.classList.toggle('button__circle');
                                });
                            </script>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty items}">
            <div style="text-align: center;">
                <i class="fa fa-minus-circle" style="font-size: 60px"></i><br/>
                <i class="fa fa-shopping-cart" style="font-size: 100px"></i>
                <h2>Your cart is empty</h2>
                <a href="MainController?btAction=load_data">Add more to your cart</a>
            </div>
        </c:if>
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
        </style>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>