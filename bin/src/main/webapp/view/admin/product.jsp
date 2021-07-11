<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700"
	rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
<script src="/js/chart-js-config.js"></script>
<link rel="stylesheet" href="/css/spur.css">
<title>Spur - A Bootstrap Admin Template</title>
<!-- Boostrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

    function chooseFile(fileinPut) {
        if (fileinPut.files&& fileinPut.files[0]) {
            var reader = new FileReader
            reader.onload = function (e) {
                $('#image').attr('src', e.target.result);
            }
            reader.readAsDataURL(fileinPut.files[0]);
        }
    }
</script>
<style>
.submit--right {
	display: inline-flex;
}

a {
	text-decoration: none !important;
	color: white;
}

.btn-primary {
	padding: 5 20px;
	font-size: 15px;
	border-radius: 20px;
}

.form-group-button {
	margin: 0 -5px;
}

.button-color-Reset:hover {
	background-color: #333;
	opacity: 0.6;
	text-decoration: none;
	color: white;
}

.button-color-Reset {
	background-color: #333;
	border: none;
}

.button-color-add:hover {
	background-color: green;
	opacity: 0.6;
	text-decoration: none;
	color: white;
}

.button-color-add {
	background-color: green;
	border: none;
}

.button-color-save:hover {
	background-color: brown;
	opacity: 0.6;
	text-decoration: none;
	color: white;
}

.button-color-save {
	border: none;
	background-color: brown;
}
</style>

<body>
	<div class="dash">
		<!--  -->
		<div class="dash-nav dash-nav-dark">
			<header>
				<a href="#!" class="menu-toggle"> <i class="fas fa-bars"></i>
				</a> <a href="index.html" class="spur-logo"><i class="fas fa-bolt"></i>
					<span>Spur</span></a>
			</header>
			<nav class="dash-nav-list">
				<a href="/category/index" class="dash-nav-item"> <i
					class="fas fa-list-ul"></i>Loại Sản phầm
				</a> <a href="/product/index" class="dash-nav-item"> <i class="fas fa-list-ul">
				</i>Sản Phẩm
				</a> <a href="/account/views" class="dash-nav-item dash-nav-dropdown-toggle"> <i
					class="fas fa-cube"></i> Nhân viên
				</a> <a href="/report" class="dash-nav-item dash-nav-dropdown-toggle"> <i
					class="fas fa-file"></i> Thông kê
				</a> <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle"> <i
					class="fas fa-info"></i> Hóa đơn
				</a>

			</nav>
		</div>
		<!--  -->
		<div class="dash-app">
			<header class="dash-toolbar">
				<a href="#!" class="menu-toggle"> <i class="fas fa-bars"></i>
				</a> <a href="#!" class="searchbox-toggle"> <i class="fas fa-search"></i>
				</a>
				<form class="searchbox" action="#!">
					<a href="#!" class="searchbox-toggle"> <i
						class="fas fa-arrow-left"></i>
					</a>
					<button type="submit" class="searchbox-submit">
						<i class="fas fa-search"></i>
					</button>
					<input type="text" class="searchbox-input"
						placeholder="type to search">
				</form>
				<div class="tools">
					<a href="/logout"
						target="_blank" class="tools-item"> <i class="fab fa-github"></i>
					</a> <a href="#!" class="tools-item"> <i class="fas fa-bell"></i> <i
						class="tools-item-count">4</i>
					</a>
					<div class="dropdown tools-item">
						<a href="#" class="" id="dropdownMenu1" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-user"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdownMenu1">
							<a class="dropdown-item" href="#!">Profile</a> <a
								class="dropdown-item" href="login.html">Logout</a>
						</div>
					</div>
				</div>
			</header>


			<!-- ADD Categroy -->
			<div class="col-xl-12">

				<div class="container" style="margin-top: 10px;">
					<div class="row"
						style="border: 1px darkgrey solid; border-radius: 10px; width: 100%; margin: 0 auto; padding: 20px;">
						<div class="col-sm-12">
							<!-- FORMMM -->
							<form:form action="/product/SaveOrUpdate" modelAttribute="item" method="post" enctype="multipart/form-data">

								<input type="hidden" class="form-control">
								<div class="row">
									<div class="col-7">

										<div class="form-group">
											<label>Name:</label>
											<form:input type="text" path="name" class="form-control"
												id="inputEmail3" placeholder="Tên SP" />

										</div>
										<div class="form-group">
											<label>Price</label>
											<form:input type="text" path="price" class="form-control"
												id="inputEmail3" placeholder="Tên SP" />
										</div>

										<div class="form-group">
											<label">Loại SP</label> <form:input type="text" name="category"
												path="category.id" class="form-control" id="inputEmail3"
												placeholder="lOẠI SP" />
										</div>

									</div>
									<div class="col-4">
										<img src="/images/${item.image}" width="100%" id="image"
											class="img-fluid ">
										<div class="form-group">
											<input type="file" name="image" class="form-control-file"
												id="image" onchange="chooseFile(this)" />

										</div>
									</div>

								</div>

								<form:button type="submit" 
									class="btn btn-success">Save</form:button>
									
									<a class="btn btn-secondary"
											href="/product/index">Reset</a>
									
								
									
								 
								
								

							</form:form>
						</div>
					</div>
				</div>





				<div class="container" style="margin-top: 10px;">
					<div class="row"
						style="border: 1px darkgrey solid; border-radius: 10px; width: 100%; margin: 0 auto; padding: 20px;">

						<h2>List Product</h2>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>NAME</th>
									<th>PRICE</th>
									<th>image</th>
                                    <th>IDlSP</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
							
							
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td>${item.price}</td>
										<td>${item.image}</td>
                                        <td>${item.category.id}</td>
										<td><a class="btn btn-warning btn-sm"
											href="/product/edit/${item.id}">Edit</a>|
											<a class="btn btn-danger btn-sm"
											href="/product/delete/${item.id}">xoas</a>
									</tr>
									<tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>

				<!-- Lissst -->

			</div>
		</div>

		<!-- boostrap -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
		<!--  -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
		<script src="/js/spur.js"></script>
</body>

</html>