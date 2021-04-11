<%-- Document : index.jsp Created on : Jan 4, 2021, 7:41:09 PM Author : Tam Dang --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Home</title>
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
                    <div class="col-sm-4" style="border: 8px dotted darksalmon; padding: 20px; border-radius: 10%;">
                        <nav class="navbar navbar-light" style="border-bottom:2px dotted darksalmon;padding: 10px;">
                            <form class="form-inline" action="MainController">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchName" value="${param.searchName}">
                                <c:set var="searchName" value = "${param.searchName}"></c:set>
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                            name="btAction" value="search_by_name" style="font-weight:bold"
                                            ><i class="fa fa-search"></i>
                                    </button>
                                    <input type="hidden" name="pageIndex" value="1" />
                                <c:if test="${not empty searchName}">
                                    <a class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                       href="MainController?btAction=load_data&pageIndex=1" style="margin-left: 5px;"
                                       >All
                                    </a>
                                </c:if>

                            </form>
                        </nav>
                        <form style="border-bottom: 2px dotted darksalmon; padding-bottom: 10px;" action="MainController">
                            <div class="form-group">
                                <label for="formGroupExampleInput">Min price ($):</label>
                                <input name="min_price" min="0" step="0.01" type="number" class="form-control" id="formGroupExampleInput" placeholder="Min Price" value="${param.min_price}" required>
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Max price ($):</label>
                                <input name="max_price" min="0" step="0.01" type="number" class="form-control" id="formGroupExampleInput2" placeholder="Max Price" value="${param.max_price}" required>
                            </div>
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                    name="btAction" value="search_by_range" style="font-weight:bold;"
                                    ><i class="fa fa-search"></i>
                            </button>
                            <input type="hidden" name="pageIndex" value="1" />
                            <c:if test="${not empty min_price and not empty max_price}">
                                <a class="btn btn-outline-success my-2 my-sm-0" type="submit" 
                                   href="MainController?btAction=load_data&pageIndex=1" style="margin-left: 5px;"
                                   >All
                                </a>
                            </c:if>
                        </form>
                        <div class="dropdown show">
                            <a class="btn btn-secondary dropdown-toggle" style="background-color: white; border-color: rgb(5, 163, 5);color: rgb(5, 163, 5);" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Category
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="MainController?btAction=load_data&pageIndex=1" style="font-weight:bold;">All</a>
                                <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                    <form action="MainController">
                                        <input type="hidden" name="category" value="${category.name}" />
                                        <button class="dropdown-item" name="btAction" value="search_by_category">${category.name}</button>
                                        <input type="hidden" name="pageIndex" value="1" />
                                    </form>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
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
        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
            <!-- Button trigger modal -->
            <div style='text-align: center; position: inherit; margin-left: 50%;'>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProduct">
                    Create Product
                </button>
            </div>
            <!-- Modal -->

            <div class="modal fade" id="createProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content" style="font-size: 14px;">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Create Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="MainController">
                            <div class="modal-body">
                                <div class="form-group row" >
                                    <label for="ProductName" class="col-sm-4 col-form-label">Product Name:</label>
                                    <div class="col-sm-8">
                                        <input name ="proName" type="text" class="form-control" id="inputProductName" placehoder="Input Product Name" value="" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Quantity" class="col-sm-4 col-form-label" >Quantity:</label>
                                    <div class="col-sm-8">
                                        <input name ="proQuantity"  min="0" class="form-control" type="number" placehoder="Input Product Name" value="" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Image" class="col-sm-4 col-form-label">Image Link:</label>
                                    <div class="col-sm-8">
                                        <input name ="proImage" type="text" class="form-control" id="inputImage" placehoder="Input Product Name" value="" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Description" class="col-sm-4 col-form-label">Description</label>
                                    <div class="col-sm-8">
                                        <input name ="proDescription" type="text" class="form-control" id="inputDescription" placehoder="Input Product Name" value="" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Price" class="col-sm-4 col-form-label">Price</label>
                                    <div class="col-sm-7">
                                        <input name ="proPrice"  min="0" type="number" class="form-control" placehoder="Input Product Name" value="" step="0.01" required>
                                    </div> <div style="font-weight:bold; font-size:20px">$</div>
                                </div>
                                <div class="form-group row">
                                    <label for="Category" class="col-sm-4 col-form-label">Category:</label>
                                    <div class="col-sm-8">
                                        <select name ="proCategory" class="combo form-control">
                                            <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                                <option value="${category.cateID.trim()}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>           
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary btn-block" name="btAction" value="add_product">Save</button>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'false' and not empty sessionScope.FAVOURITE_PRODUCTS}">                
            <div class="your-favourite">
                <div class="card" style="width: 15rem; position: absolute; top: 15%; background: transparent; left: 5%; z-index: 9999;background: radial-gradient(blanchedalmond, transparent); border: 10px double darksalmon;">
                    <h3 style="text-align: center; font-family: 'Big Shoulders Stencil Text'">YOUR FAVOURITE</h3>
                    <c:forEach items="${sessionScope.FAVOURITE_PRODUCTS}" var="fp">
                        <img class="card-img-top" src="${fp.img}" alt="${fp.name}" style='border-top: 8px dotted darksalmon; padding-top: 20px;'>
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title">${fp.name}</h5>
                            <c:url value="MainController" var="AddToCartURL">
                                <c:param name="btAction" value="add_to_cart"/>
                                <c:param name="proID" value="${fp.proID.trim()}"/>
                                <c:param name="proName" value="${fp.name.trim()}"/>
                                <c:param name="proImg" value="${fp.img.trim()}"/>
                                <c:param name="proPrice" value="${fp.price}"/>
                                <c:param name="response_tail" value="btAction=load_data"/>
                            </c:url>
                            <a href="${AddToCartURL}" class="btn btn-primary" style="background: gray; font-weight: bold; border: 5px dotted;">Add to cart</a>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </c:if>    
        <div class="body-container" style="margin-top: 2%;">
            <div class="row">
                <div class="container" style="border: 8px dotted darksalmon; border-radius: 10%">
                    <!--KHÔNG SEARCH-->                    <c:if test = "${empty param.searchName and empty param.category and empty param.min_price and empty param.max_price}">
                        <div class="banner" style="margin: 30px; text-align: center;
                             background: bisque;
                             font-size: 30px;
                             font-weight: bold;
                             font-family: monospace;
                             opacity: 0.5;">---PRODUCT---</div>
                        <c:if test="${not empty requestScope.RESULT_SEARCH}">
                            <div class="row">
                                <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                                    <table class="table" style="margin: 0px auto; font-size: 12px;">
                                        <thead class="thead-light" style="text-align: center">
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">PRODUCT ID</th>
                                                <th scope="col">PRODUCT NAME</th>
                                                <th scope="col">QUANTITY</th>
                                                <th scope="col">IMAGE</th>
                                                <th scope="col">DESCRIPTION</th>
                                                <th scope="col">PRICE</th>
                                                <th scope="col">CREATED DATE</th>
                                                <th scope="col">UPDATED DATE</th>
                                                <th scope="col">UPDATED USER</th>
                                                <th scope="col">STATUS</th>
                                                <th scope="col">CATEGORY</th>
                                                <th scope="col">UPDATE</th>
                                            </tr>
                                        </thead>
                                        <tbody style ="font-size: 13px">
                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">

                                            <form action="MainController">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dto.proID.trim()}</td>
                                                    <td>${dto.name}</td>
                                                    <td>${dto.quantity}</td>
                                                    <td><img src="${dto.img}" style = "max-width: 100%"></td>
                                                    <td>${dto.des}</td>
                                                    <td style="width: 100px;">${dto.price} $</td>
                                                    <td style="width: 120px;">${dto.createdDate}</td>
                                                    <td style="text-align: center;width: 120px;">
                                                        <c:if test="${empty dto.updatedDate}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedDate}">${dto.updatedDate}</c:if>
                                                        </td>
                                                        <td style="text-align: center">
                                                        <c:if test="${empty dto.updatedUser}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedUser}">${dto.updatedUser}</c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                        <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                        </td>
                                                        <td>${dto.category}</td> 
                                                    <td><!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProduct${dto.proID.trim()}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="updateProduct${dto.proID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Update</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label for="ProductID" class="col-sm-4 col-form-label">ProductID:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proID" type="text" readonly class="form-control-plaintext" id="proID" value="${dto.proID.trim()}" style="font-weight:bold">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row" >
                                                                        <label for="ProductName" class="col-sm-4 col-form-label">Product Name:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proName" type="text" class="form-control" id="inputProductName" value="${dto.name}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Quantity" class="col-sm-4 col-form-label" >Quantity:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proQuantity"  min="0" class="form-control" type="number" value="${dto.quantity}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Image" class="col-sm-4 col-form-label">Image:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proImage" type="text" class="form-control" id="inputImage" value="${dto.img}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Description" class="col-sm-4 col-form-label">Description</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proDescription" type="text" class="form-control" id="inputDescription" value="${dto.des}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Price" class="col-sm-4 col-form-label">Price</label>
                                                                        <div class="col-sm-7">
                                                                            <input name ="proPrice"  min="0" type="number" class="form-control" value="${dto.price}" step="0.01" required>
                                                                        </div> <div style="font-weight:bold; font-size:20px">$</div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="CreatedDate" class="col-sm-4 col-form-label">Created Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="createdDate" value="${dto.createdDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="UpdatedDate" class="col-sm-4 col-form-label">Update Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="updatedDate" value="${dto.updatedDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Status" class="col-sm-4 col-form-label">Status</label>
                                                                        <div class="col-sm-8">
                                                                            <select name ="proStatus" class="combo form-control" style="font-weight:bold">
                                                                                <option value="${dto.isAvailable}">
                                                                                    <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                                                    <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                                                    </option>
                                                                                <c:if test="${dto.isAvailable eq 'false'}"><option value="true">Active</option></c:if>
                                                                                <c:if test="${dto.isAvailable eq 'true'}"><option  value="false" style="color:red">Inactive <div class="inactive">(as Delete)</div></option></c:if>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="Category" class="col-sm-4 col-form-label">Category:</label>
                                                                            <div class="col-sm-8">
                                                                                <select name ="proCategory" class="combo form-control">
                                                                                    <option value="${dto.cateID}">
                                                                                    ${dto.category}
                                                                                </option>
                                                                                <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                                                                    <c:if test="${category.name ne dto.category}"><option value="${category.cateID}">${category.name}</option></c:if>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=load_data&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="update">Update</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="remove-product-button">
                                        <button 
                                            type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteProduct${proID}">
                                            Remove Product
                                        </button>
                                    </div>
                                    <!-- Modal -->
                                    <form action="MainController">
                                        <div class="modal fade" id="deleteProduct${proID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Choose Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <table class="table" style="font-size:11px">
                                                        <thead class="thead-light" style="text-align: center">
                                                            <tr>
                                                                <th scope="col">No.</th>
                                                                <th scope="col">PRODUCT ID</th>
                                                                <th scope="col">PRODUCT NAME</th>
                                                                <th scope="col">IMAGE</th>
                                                                <th scope="col">CATEGORY</th>
                                                                <th scope="col">CHOOSE</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                                                <tr>
                                                                    <td>${counter.count}</td>
                                                                    <td>${dto.proID.trim()}</td>
                                                                    <td>${dto.name}</td>
                                                                    <td><img src="${dto.img}" style = "max-width: 50%"></td>
                                                                    <td>${dto.category}</td>
                                                                    <td><input class="form-control" type="checkbox" name="chkDelete" value="${dto.proID.trim()}"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmDelete">
                                                            Delete
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteTitle" aria-hidden="true" >
                                                            <div class="modal-dialog modal-dialog-centered" role="document" >
                                                                <div class="modal-content" style="width:70%; margin: auto">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Do you want to delete these products?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=load_data" />
                                                                        <button type="submit" class="btn btn-primary btn-block" name="btAction" value="delete">Delete</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form> 
                                </c:if> 
                                <c:if test="${sessionScope.ACCOUNT.isAdmin ne 'true'}">
                                    <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                        <c:if test="${(dto.isAvailable eq 'true') and (dto.quantity gt 0)}">
                                            <div class="col-sm">
                                                <div class="product-item" style="background-color:mistyrose;">
                                                    <img src="${dto.img}" class="" alt="${dto.name}" style="max-width: 65%;">
                                                    <h4>${dto.name}</h4>
                                                    <h5>${dto.price} $</h5>
                                                    <div>
                                                        <ul type="none" style="font-size: 15px;padding:5px; text-align: left;">
                                                            <li>Quantity: ${dto.quantity}</li>
                                                            <li>Category: ${dto.category}</li>
                                                            <li>Description: ${dto.des}</li>
                                                        </ul>
                                                    </div>
                                                    <form action="<c:if test="${empty sessionScope.ACCOUNT}">login.jsp</c:if><c:if test="${not empty sessionScope.ACCOUNT}">MainController</c:if>">
                                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                                    <input type="hidden" name="response_tail" value="btAction=load_data&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                            <input type="hidden" name="proID" value="${dto.proID.trim()}" />
                                                            <input type="hidden" name="proName" value="${dto.name.trim()}" />
                                                            <input type="hidden" name="proImg" value="${dto.img.trim()}" />
                                                            <input type="hidden" name="proPrice" value="${dto.price}" />
                                                            <button type="submit" class="btn btn-secondary" name="btAction" value="add_to_cart">Add to cart</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <c:if test="${requestScope.PAGE_COUNT ne 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${requestScope.PAGE_COUNT}" step="1" var="counter">
                                            <li class="page-item <c:if test="${param.pageIndex eq counter}"> active </c:if>"><a class="page-link" href="MainController?btAction=load_data&pageIndex=${counter}">${counter}</a></li>
                                            </c:forEach>
                                    </ul>
                                </nav>
                            </c:if>
                        </c:if>
                    </c:if>
                    <!--SEARCH THEO KEYWORD-->     <c:if test="${not empty searchName}">
                        <div class="banner" style="margin: 30px; text-align: center;
                             background: bisque;
                             font-size: 30px;
                             font-weight: bold;
                             font-family: monospace;
                             opacity: 0.5;">---PRODUCT---</div>
                        <c:if test="${not empty requestScope.RESULT_SEARCH}">
                            <div class="row">
                                <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                                    <table class="table" style="margin: 0px auto; font-size: 12px;">
                                        <thead class="thead-light" style="text-align: center">
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">PRODUCT ID</th>
                                                <th scope="col">PRODUCT NAME</th>
                                                <th scope="col">QUANTITY</th>
                                                <th scope="col">IMAGE</th>
                                                <th scope="col">DESCRIPTION</th>
                                                <th scope="col">PRICE</th>
                                                <th scope="col">CREATED DATE</th>
                                                <th scope="col">UPDATED DATE</th>
                                                <th scope="col">UPDATED USER</th>
                                                <th scope="col">STATUS</th>
                                                <th scope="col">CATEGORY</th>
                                                <th scope="col">UPDATE</th>
                                            </tr>
                                        </thead>
                                        <tbody style ="font-size: 13px">
                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">

                                            <form action="MainController">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dto.proID.trim()}</td>
                                                    <td>${dto.name}</td>
                                                    <td>${dto.quantity}</td>
                                                    <td><img src="${dto.img}" style = "max-width: 100%"></td>
                                                    <td>${dto.des}</td>
                                                    <td style="width: 100px;">${dto.price} $</td>
                                                    <td style="width: 120px;">${dto.createdDate}</td>
                                                    <td style="text-align: center;width: 120px;">
                                                        <c:if test="${empty dto.updatedDate}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedDate}">${dto.updatedDate}</c:if>
                                                        </td>
                                                        <td style="text-align: center">
                                                        <c:if test="${empty dto.updatedUser}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedUser}">${dto.updatedUser}</c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                        <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                        </td>
                                                        <td>${dto.category}</td> 
                                                    <td><!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProduct${dto.proID.trim()}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="updateProduct${dto.proID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Update</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label for="ProductID" class="col-sm-4 col-form-label">ProductID:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proID" type="text" readonly class="form-control-plaintext" id="proID" value="${dto.proID.trim()}" style="font-weight:bold">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row" >
                                                                        <label for="ProductName" class="col-sm-4 col-form-label">Product Name:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proName" type="text" class="form-control" id="inputProductName" value="${dto.name}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Quantity" class="col-sm-4 col-form-label" >Quantity:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proQuantity" min="1" class="form-control" type="number" value="${dto.quantity}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Image" class="col-sm-4 col-form-label">Image:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proImage" type="text" class="form-control" id="inputImage" value="${dto.img}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Description" class="col-sm-4 col-form-label">Description</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proDescription" type="text" class="form-control" id="inputDescription" value="${dto.des}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Price" class="col-sm-4 col-form-label">Price</label>
                                                                        <div class="col-sm-7">
                                                                            <input name ="proPrice"  min="0" type="number" class="form-control" value="${dto.price}" step="0.01" required>
                                                                        </div> <div style="font-weight:bold; font-size:20px">$</div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="CreatedDate" class="col-sm-4 col-form-label">Created Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="createdDate" value="${dto.createdDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="UpdatedDate" class="col-sm-4 col-form-label">Update Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="updatedDate" value="${dto.updatedDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Status" class="col-sm-4 col-form-label">Status</label>
                                                                        <div class="col-sm-8">
                                                                            <select name ="proStatus" class="combo form-control" style="font-weight:bold">
                                                                                <option value="${dto.isAvailable}">
                                                                                    <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                                                    <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                                                    </option>
                                                                                <c:if test="${dto.isAvailable eq 'false'}"><option value="true">Active</option></c:if>
                                                                                <c:if test="${dto.isAvailable eq 'true'}"><option  value="false" style="color:red">Inactive <div class="inactive">(as Delete)</div></option></c:if>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="Category" class="col-sm-4 col-form-label">Category:</label>
                                                                            <div class="col-sm-8">
                                                                                <select name ="proCategory" class="combo form-control">
                                                                                    <option value="${dto.cateID}">
                                                                                    ${dto.category}
                                                                                </option>
                                                                                <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                                                                    <c:if test="${category.name ne dto.category}"><option value="${category.cateID}">${category.name}</option></c:if>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_name&searchName=${param.searchName}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>"/>
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="update">Update</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="remove-product-button">
                                        <button 
                                            type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteProduct${proID}">
                                            Remove Product
                                        </button>
                                    </div>
                                    <!-- Modal -->
                                    <form action="MainController">
                                        <div class="modal fade" id="deleteProduct${proID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Choose Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <table class="table" style="font-size:11px">
                                                        <thead class="thead-light" style="text-align: center">
                                                            <tr>
                                                                <th scope="col">No.</th>
                                                                <th scope="col">PRODUCT ID</th>
                                                                <th scope="col">PRODUCT NAME</th>
                                                                <th scope="col">IMAGE</th>
                                                                <th scope="col">CATEGORY</th>
                                                                <th scope="col">CHOOSE</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                                                <tr>
                                                                    <td>${counter.count}</td>
                                                                    <td>${dto.proID.trim()}</td>
                                                                    <td>${dto.name}</td>
                                                                    <td><img src="${dto.img}" style = "max-width: 50%"></td>
                                                                    <td>${dto.category}</td>
                                                                    <td><input class="form-control" type="checkbox" name="chkDelete" value="${dto.proID.trim()}"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmDelete">
                                                            Delete
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteTitle" aria-hidden="true" >
                                                            <div class="modal-dialog modal-dialog-centered" role="document" >
                                                                <div class="modal-content" style="width:70%; margin: auto">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Do you want to delete these products?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_name&searchName=${param.searchName}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="delete">Delete</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form> 
                                </c:if> 
                                <c:if test="${sessionScope.ACCOUNT.isAdmin ne 'true'}">
                                    <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                        <c:if test="${(dto.isAvailable eq 'true') and (dto.quantity gt 0)}">
                                            <div class="col-sm">
                                                <div class="product-item" style="background-color:mistyrose;">
                                                    <img src="${dto.img}" class="" alt="${dto.name}" style="max-width: 65%;">
                                                    <h4>${dto.name}</h4>
                                                    <h5>${dto.price} $</h5>
                                                    <div>
                                                        <ul type="none" style="font-size: 15px;padding:5px; text-align: left;">
                                                            <li>Quantity: ${dto.quantity}</li>
                                                            <li>Category: ${dto.category}</li>
                                                            <li>Description: ${dto.des}</li>
                                                        </ul>
                                                    </div>
                                                    <form action="<c:if test="${empty sessionScope.ACCOUNT}">login.jsp</c:if><c:if test="${not empty sessionScope.ACCOUNT}">MainController</c:if>" >
                                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                                    <input type="hidden" name="response_tail" value="btAction=search_by_name&searchName=${param.searchName}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                            <input type="hidden" name="proID" value="${dto.proID.trim()}" />
                                                            <input type="hidden" name="proName" value="${dto.name.trim()}" />
                                                            <input type="hidden" name="proImg" value="${dto.img.trim()}" />
                                                            <input type="hidden" name="proPrice" value="${dto.price}" />
                                                            <button type="submit" class="btn btn-secondary" name="btAction" value="add_to_cart">Add to cart</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <c:if test="${requestScope.PAGE_COUNT ne 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${requestScope.PAGE_COUNT}" step="1" var="counter">
                                            <li class="page-item <c:if test="${param.pageIndex eq counter}"> active </c:if>"><a class="page-link" href="MainController?btAction=search_by_name&searchName=${param.searchName}&pageIndex=${counter}">${counter}</a></li>
                                            </c:forEach>
                                    </ul>
                                </nav>
                            </c:if>
                        </c:if>
                        <c:if test="${empty requestScope.RESULT_SEARCH}">
                            <div style="text-align: center; color:darksalmon"><i class="fa fa-minus-square" style="font-size: 60px"></i><br/>
                                <h1>Sorry, no product with this keyword !!!</h1>
                            </div>
                        </c:if>
                    </c:if>
                    <!--SEARCH THEO RANGE--> <c:if test="${not empty param.min_price and not empty param.max_price}">
                        <div class="banner" style="margin: 30px; text-align: center;
                             background: bisque;
                             font-size: 30px;
                             font-weight: bold;
                             font-family: monospace;
                             opacity: 0.5;">---PRODUCT---</div>
                        <c:if test="${not empty requestScope.RESULT_SEARCH}">
                            <div class="row">
                                <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                                    <table class="table" style="margin: 0px auto; font-size: 12px;">
                                        <thead class="thead-light" style="text-align: center">
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">PRODUCT ID</th>
                                                <th scope="col">PRODUCT NAME</th>
                                                <th scope="col">QUANTITY</th>
                                                <th scope="col">IMAGE</th>
                                                <th scope="col">DESCRIPTION</th>
                                                <th scope="col">PRICE</th>
                                                <th scope="col">CREATED DATE</th>
                                                <th scope="col">UPDATED DATE</th>
                                                <th scope="col">UPDATED USER</th>
                                                <th scope="col">STATUS</th>
                                                <th scope="col">CATEGORY</th>
                                                <th scope="col">UPDATE</th>
                                            </tr>
                                        </thead>
                                        <tbody style ="font-size: 13px">
                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">

                                            <form action="MainController">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dto.proID.trim()}</td>
                                                    <td>${dto.name}</td>
                                                    <td>${dto.quantity}</td>
                                                    <td><img src="${dto.img}" style = "max-width: 100%"></td>
                                                    <td>${dto.des}</td>
                                                    <td style="width: 100px;">${dto.price} $</td>
                                                    <td style="width: 120px;">${dto.createdDate}</td>
                                                    <td style="text-align: center;width: 120px;">
                                                        <c:if test="${empty dto.updatedDate}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedDate}">${dto.updatedDate}</c:if>
                                                        </td>
                                                        <td style="text-align: center">
                                                        <c:if test="${empty dto.updatedUser}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedUser}">${dto.updatedUser}</c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                        <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                        </td>
                                                        <td>${dto.category}</td> 
                                                    <td><!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProduct${dto.proID.trim()}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="updateProduct${dto.proID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Update</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label for="ProductID" class="col-sm-4 col-form-label">ProductID:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proID" type="text" readonly class="form-control-plaintext" id="proID" value="${dto.proID.trim()}" style="font-weight:bold">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row" >
                                                                        <label for="ProductName" class="col-sm-4 col-form-label">Product Name:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proName" type="text" class="form-control" id="inputProductName" value="${dto.name}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Quantity" class="col-sm-4 col-form-label" >Quantity:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proQuantity"  min="1" class="form-control" type="number" value="${dto.quantity}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Image" class="col-sm-4 col-form-label">Image:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proImage" type="text" class="form-control" id="inputImage" value="${dto.img}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Description" class="col-sm-4 col-form-label">Description</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proDescription" type="text" class="form-control" id="inputDescription" value="${dto.des}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Price" class="col-sm-4 col-form-label">Price</label>
                                                                        <div class="col-sm-7">
                                                                            <input name ="proPrice"  min="0" type="number" class="form-control" value="${dto.price}" step="0.01" required>
                                                                        </div> <div style="font-weight:bold; font-size:20px">$</div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="CreatedDate" class="col-sm-4 col-form-label">Created Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="createdDate" value="${dto.createdDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="UpdatedDate" class="col-sm-4 col-form-label">Update Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="updatedDate" value="${dto.updatedDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Status" class="col-sm-4 col-form-label">Status</label>
                                                                        <div class="col-sm-8">
                                                                            <select name ="proStatus" class="combo form-control" style="font-weight:bold">
                                                                                <option value="${dto.isAvailable}">
                                                                                    <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                                                    <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                                                    </option>
                                                                                <c:if test="${dto.isAvailable eq 'false'}"><option value="true">Active</option></c:if>
                                                                                <c:if test="${dto.isAvailable eq 'true'}"><option  value="false" style="color:red">Inactive <div class="inactive">(as Delete)</div></option></c:if>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="Category" class="col-sm-4 col-form-label">Category:</label>
                                                                            <div class="col-sm-8">
                                                                                <select name ="proCategory" class="combo form-control">
                                                                                    <option value="${dto.cateID}">
                                                                                    ${dto.category}
                                                                                </option>
                                                                                <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                                                                    <c:if test="${category.name ne dto.category}"><option value="${category.cateID}">${category.name}</option></c:if>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_range&min_price=${param.min_price}&max_price=${param.max_price}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>"/>
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="update">Update</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="remove-product-button">
                                        <button 
                                            type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteProduct${proID}">
                                            Remove Product
                                        </button>
                                    </div>
                                    <!-- Modal -->
                                    <form action="MainController">
                                        <div class="modal fade" id="deleteProduct${proID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Choose Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <table class="table" style="font-size:11px">
                                                        <thead class="thead-light" style="text-align: center">
                                                            <tr>
                                                                <th scope="col">No.</th>
                                                                <th scope="col">PRODUCT ID</th>
                                                                <th scope="col">PRODUCT NAME</th>
                                                                <th scope="col">IMAGE</th>
                                                                <th scope="col">CATEGORY</th>
                                                                <th scope="col">CHOOSE</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                                                <tr>
                                                                    <td>${counter.count}</td>
                                                                    <td>${dto.proID.trim()}</td>
                                                                    <td>${dto.name}</td>
                                                                    <td><img src="${dto.img}" style = "max-width: 50%"></td>
                                                                    <td>${dto.category}</td>
                                                                    <td><input class="form-control" type="checkbox" name="chkDelete" value="${dto.proID.trim()}"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmDelete">
                                                            Delete
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteTitle" aria-hidden="true" >
                                                            <div class="modal-dialog modal-dialog-centered" role="document" >
                                                                <div class="modal-content" style="width:70%; margin: auto">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Do you want to delete these products?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_range&min_price=${param.min_price}&max_price=${param.max_price}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="delete">Delete</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form> 
                                </c:if> 
                                <c:if test="${sessionScope.ACCOUNT.isAdmin ne 'true'}">
                                    <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                        <c:if test="${(dto.isAvailable eq 'true') and (dto.quantity gt 0)}">
                                            <div class="col-sm">
                                                <div class="product-item" style="background-color:mistyrose;">
                                                    <img src="${dto.img}" class="" alt="${dto.name}" style="max-width: 65%;">
                                                    <h4>${dto.name}</h4>
                                                    <h5>${dto.price} $</h5>
                                                    <div>
                                                        <ul type="none" style="font-size: 15px;padding:5px; text-align: left;">
                                                            <li>Quantity: ${dto.quantity}</li>
                                                            <li>Category: ${dto.category}</li>
                                                            <li>Description: ${dto.des}</li>
                                                        </ul>
                                                    </div>
                                                    <form action="<c:if test="${empty sessionScope.ACCOUNT}">login.jsp</c:if><c:if test="${not empty sessionScope.ACCOUNT}">MainController</c:if>" >
                                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                                    <input type="hidden" name="response_tail" value="btAction=search_by_range&min_price=${param.min_price}&max_price=${param.max_price}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                            <input type="hidden" name="proID" value="${dto.proID.trim()}" />
                                                            <input type="hidden" name="proName" value="${dto.name.trim()}" />
                                                            <input type="hidden" name="proImg" value="${dto.img.trim()}" />
                                                            <input type="hidden" name="proPrice" value="${dto.price}" />
                                                            <button type="submit" class="btn btn-secondary" name="btAction" value="add_to_cart">Add to cart</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <c:if test="${requestScope.PAGE_COUNT ne 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${requestScope.PAGE_COUNT}" step="1" var="counter">
                                            <li class="page-item <c:if test="${param.pageIndex eq counter}"> active </c:if>"><a class="page-link" href="MainController?btAction=search_by_range&min_price=${param.min_price}&max_price=${param.max_price}&pageIndex=${counter}">${counter}</a></li>
                                            </c:forEach>
                                    </ul>
                                </nav>
                            </c:if>
                        </c:if>
                        <c:if test="${empty requestScope.RESULT_SEARCH}">
                            <div style="text-align: center; color:darksalmon"><i class="fa fa-minus-square" style="font-size: 60px"></i><br/>
                                <h1>Sorry, no product between this range !!!</h1>
                            </div>
                        </c:if>
                    </c:if>
                    <!--SEARCH THEO CATEGORY--> <c:if test="${not empty param.category}">
                        <div class="banner" style="margin: 30px; text-align: center;
                             background: bisque;
                             font-size: 30px;
                             font-weight: bold;
                             font-family: monospace;
                             opacity: 0.5;">---${param.category}---</div>
                        <c:if test="${not empty requestScope.RESULT_SEARCH}">
                            <div class="row">
                                <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'true'}">
                                    <table class="table" style="margin: 0px auto; font-size: 12px;">
                                        <thead class="thead-light" style="text-align: center">
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">PRODUCT ID</th>
                                                <th scope="col">PRODUCT NAME</th>
                                                <th scope="col">QUANTITY</th>
                                                <th scope="col">IMAGE</th>
                                                <th scope="col">DESCRIPTION</th>
                                                <th scope="col">PRICE</th>
                                                <th scope="col">CREATED DATE</th>
                                                <th scope="col">UPDATED DATE</th>
                                                <th scope="col">UPDATED USER</th>
                                                <th scope="col">STATUS</th>
                                                <th scope="col">CATEGORY</th>
                                                <th scope="col">UPDATE</th>
                                            </tr>
                                        </thead>
                                        <tbody style ="font-size: 13px">
                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">

                                            <form action="MainController">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dto.proID.trim()}</td>
                                                    <td>${dto.name}</td>
                                                    <td>${dto.quantity}</td>
                                                    <td><img src="${dto.img}" style = "max-width: 100%"></td>
                                                    <td>${dto.des}</td>
                                                    <td style="width: 100px;">${dto.price} $</td>
                                                    <td style="width: 120px;">${dto.createdDate}</td>
                                                    <td style="text-align: center;width: 120px;">
                                                        <c:if test="${empty dto.updatedDate}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedDate}">${dto.updatedDate}</c:if>
                                                        </td>
                                                        <td style="text-align: center">
                                                        <c:if test="${empty dto.updatedUser}">---------</c:if>
                                                        <c:if test="${not empty dto.updatedUser}">${dto.updatedUser}</c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                        <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                        </td>
                                                        <td>${dto.category}</td> 
                                                    <td><!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProduct${dto.proID.trim()}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="updateProduct${dto.proID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Update</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>

                                                                    <div class="form-group row">
                                                                        <label for="ProductID" class="col-sm-4 col-form-label">ProductID:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proID" type="text" readonly class="form-control-plaintext" id="proID" value="${dto.proID.trim()}" style="font-weight:bold">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row" >
                                                                        <label for="ProductName" class="col-sm-4 col-form-label">Product Name:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proName" type="text" class="form-control" id="inputProductName" value="${dto.name}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Quantity" class="col-sm-4 col-form-label" >Quantity:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proQuantity"  min="1" class="form-control" type="number" value="${dto.quantity}" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Image" class="col-sm-4 col-form-label">Image:</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proImage" type="text" class="form-control" id="inputImage" value="${dto.img}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Description" class="col-sm-4 col-form-label">Description</label>
                                                                        <div class="col-sm-8">
                                                                            <input name ="proDescription" type="text" class="form-control" id="inputDescription" value="${dto.des}" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Price" class="col-sm-4 col-form-label">Price</label>
                                                                        <div class="col-sm-7">
                                                                            <input name ="proPrice" min="0" type="number" class="form-control" value="${dto.price}" step="0.01" required>
                                                                        </div> <div style="font-weight:bold; font-size:20px">$</div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="CreatedDate" class="col-sm-4 col-form-label">Created Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="createdDate" value="${dto.createdDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="UpdatedDate" class="col-sm-4 col-form-label">Update Date:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" readonly class="form-control-plaintext" id="updatedDate" value="${dto.updatedDate}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="Status" class="col-sm-4 col-form-label">Status</label>
                                                                        <div class="col-sm-8">
                                                                            <select name ="proStatus" class="combo form-control" style="font-weight:bold">
                                                                                <option value="${dto.isAvailable}">
                                                                                    <c:if test="${dto.isAvailable eq 'true'}">Active</c:if>
                                                                                    <c:if test="${dto.isAvailable eq 'false'}">Inactive</c:if>
                                                                                    </option>
                                                                                <c:if test="${dto.isAvailable eq 'false'}"><option value="true">Active</option></c:if>
                                                                                <c:if test="${dto.isAvailable eq 'true'}"><option  value="false" style="color:red">Inactive <div class="inactive">(as Delete)</div></option></c:if>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label for="Category" class="col-sm-4 col-form-label">Category:</label>
                                                                            <div class="col-sm-8">
                                                                                <select name ="proCategory" class="combo form-control">
                                                                                    <option value="${dto.cateID}">
                                                                                    ${dto.category}
                                                                                </option>
                                                                                <c:forEach items="${applicationScope.CATEGORY}" var="category">
                                                                                    <c:if test="${category.name ne dto.category}"><option value="${category.cateID}">${category.name}</option></c:if>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_category&category=${param.category}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="update">Update</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="remove-product-button">
                                        <button 
                                            type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteProduct${proID}">
                                            Remove Product
                                        </button>
                                    </div>
                                    <!-- Modal -->
                                    <form action="MainController">
                                        <div class="modal fade" id="deleteProduct${proID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Choose Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <table class="table" style="font-size:11px">
                                                        <thead class="thead-light" style="text-align: center">
                                                            <tr>
                                                                <th scope="col">No.</th>
                                                                <th scope="col">PRODUCT ID</th>
                                                                <th scope="col">PRODUCT NAME</th>
                                                                <th scope="col">IMAGE</th>
                                                                <th scope="col">CATEGORY</th>
                                                                <th scope="col">CHOOSE</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                                                <tr>
                                                                    <td>${counter.count}</td>
                                                                    <td>${dto.proID.trim()}</td>
                                                                    <td>${dto.name}</td>
                                                                    <td><img src="${dto.img}" style = "max-width: 50%"></td>
                                                                    <td>${dto.category}</td>
                                                                    <td><input class="form-control" type="checkbox" name="chkDelete" value="${dto.proID.trim()}"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmDelete">
                                                            Delete
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteTitle" aria-hidden="true" >
                                                            <div class="modal-dialog modal-dialog-centered" role="document" >
                                                                <div class="modal-content" style="width:70%; margin: auto">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Do you want to delete these products?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="response_tail" value="btAction=search_by_category&category=${param.category}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                                            <button type="submit" class="btn btn-primary btn-block" name="btAction" value="delete">Delete</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form> 
                                </c:if> 
                                <c:if test="${sessionScope.ACCOUNT.isAdmin ne 'true'}">
                                    <c:forEach items="${requestScope.RESULT_SEARCH}" var="dto" varStatus="counter">
                                        <c:if test="${(dto.isAvailable eq 'true') and (dto.quantity gt 0)}">
                                            <div class="col-sm">
                                                <div class="product-item" style="background-color:mistyrose;">
                                                    <img src="${dto.img}" class="" alt="${dto.name}" style="max-width: 65%;">
                                                    <h4>${dto.name}</h4>
                                                    <h5>${dto.price} $</h5>
                                                    <div>
                                                        <ul type="none" style="font-size: 15px;padding:5px; text-align: left;">
                                                            <li>Quantity: ${dto.quantity}</li>
                                                            <li>Category: ${dto.category}</li>
                                                            <li>Description: ${dto.des}</li>
                                                        </ul>
                                                    </div>
                                                    <form action="<c:if test="${empty sessionScope.ACCOUNT}">login.jsp</c:if><c:if test="${not empty sessionScope.ACCOUNT}">MainController</c:if>">
                                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                                    <input type="hidden" name="response_tail" value="btAction=search_by_category&category=${param.category}&pageIndex=<c:if test="${empty param.pageIndex}">1</c:if><c:if test="${not empty param.pageIndex}">${param.pageIndex}</c:if>" />
                                                            <input type="hidden" name="proID" value="${dto.proID.trim()}" />
                                                            <input type="hidden" name="proName" value="${dto.name.trim()}" />
                                                            <input type="hidden" name="proImg" value="${dto.img.trim()}" />
                                                            <input type="hidden" name="proPrice" value="${dto.price}" />
                                                            <button type="submit" class="btn btn-secondary" name="btAction" value="add_to_cart">Add to cart</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <c:if test="${requestScope.PAGE_COUNT ne 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${requestScope.PAGE_COUNT}" step="1" var="counter">
                                            <li class="page-item <c:if test="${param.pageIndex eq counter}"> active </c:if>"><a class="page-link" href="MainController?btAction=search_by_category&category=${param.category}&pageIndex=${counter}">${counter}</a></li>
                                            </c:forEach>
                                    </ul>
                                </nav>
                            </c:if>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.ACCOUNT.isAdmin eq 'false' and not empty requestScope.SUGGEST_PRODUCTS}">                
            <div class="your-suggest">
                <div class="card" style="width: 15rem; position: absolute; top: 15%; background: transparent; right: 5%; z-index: 9999;background: radial-gradient(blanchedalmond, transparent); border: 10px double darksalmon;">
                    <h3 style="text-align: center; font-family: 'Big Shoulders Stencil Text'">SUGGEST PRODUCTS</h3>
                    <c:forEach items="${requestScope.SUGGEST_PRODUCTS}" var="sp">
                        <img class="card-img-top" src="${sp.img}" alt="${sp.name}" style='border-top: 8px dotted darksalmon; padding-top: 20px;'>
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title">${sp.name}</h5>
                            <c:url value="MainController" var="AddToCartURL">
                                <c:param name="btAction" value="add_to_cart"/>
                                <c:param name="proID" value="${sp.proID.trim()}"/>
                                <c:param name="proName" value="${sp.name.trim()}"/>
                                <c:param name="proImg" value="${sp.img.trim()}"/>
                                <c:param name="proPrice" value="${sp.price}"/>
                                <c:param name="response_tail" value="btAction=load_data"/>
                            </c:url>
                            <a href="${AddToCartURL}" class="btn btn-primary" style="background: gray; font-weight: bold; border: 5px dotted;">Add to cart</a>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </c:if>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7">
                        <img src="https://cdn.jamja.vn/blog/wp-content/uploads/2017/12/hana-shop-1.jpg" style="width: 50%;"/>
                    </div>
                    <div class="col-sm-5">
                        <h2>HANA SHOP</h2>
                        <ul>
                            <li>Address: Sky9 Apartment, Lien Phuong Street, District 9, Ho Chi Minh City.</li>
                            <li>Phone Number: 0774839222</li>
                            <li>Email: jacob15072000@gmail.com</li>

                        </ul>
                        <h5 style="text-align: center; margin-top: 5%; text-decoration: underline; font-family: 'Yellowtail';font-size: 29px;">Sincerely thank you for loving our store.</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Optional CSS -->
    <style>
        .remove-product-button{
            position: absolute;
            top: 52%;
            left: 59%;
        }
        .body-container .container .row{
            display: grid;
            grid-template-columns: 220px 220px 220px 220px 220px;
            justify-content: center;
            grid-template-rows: 400px 400px 400px;
            margin-bottom: 15%;
        }
        .body-container .container .modal .row{
            display: flex;
            justify-content: left;
            margin-bottom: 5%;
        }

        .footer{
            background: darksalmon;
            margin-top: 10%;
        }
        .footer .container .row{
            padding: 5%;
        }
        .footer .container .row img{
            border: 5px solid azure;
            box-shadow: 5px 5px 5px 5px;
            border-radius: 10%;
        }
        .footer .container .row h2{
            text-align: center;
            font-weight: bold;
            font-family: 'Yellowtail';
            border: 2px dotted;
            border-radius: 10%;
        }
        .footer .container .row li{
            margin-top: 10%;
            font-family: cursive;
            font-weight: bold;
        }
        .remove-product-button{
            margin: 1% auto;
        }
        .modal-content .col-form-label{
            padding-left: 10%
        }
        .modal-content .col-sm-8{
            max-width: 50%
        }
        .body-container .container .row .col-sm .product-item {
            margin: 0px auto;
            border-top: 2px solid darksalmon;
            border-left: 2px solid darksalmon;
            border-right: 2px solid darksalmon;
            border-radius: 20%;
            padding-top: 3%;
            box-shadow: 5px 5px 10px 10px darksalmon;
        }
        .body-container .container .row .col-sm .product-item:hover {
            width: 120%;
        }
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
        }
    </style>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>