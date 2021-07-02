<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
        integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
    <script src="/js/chart-js-config.js"></script>
    <link rel="stylesheet" href="/css/spur.css">
    <title>Spur - A Bootstrap Admin Template</title>
     <!-- Boostrap -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<style>
    .submit--right {
        display: inline-flex;

    }
      a{
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
    <p><b><i>${message}${param.error}</i></b></p>
            
            <!-- ADD Categroy -->
            <div class="col-xl-12">

                <div class="card spur-card">
                    <div class="card-header">
                        <div class="spur-card-icon">
                            <i class="fas fa-chart-bar"></i>
                        </div>
                        <div class="spur-card-title"> Thêm Thể Loại    <p><b><i>${message}${param.error}</i></b></p></div>
                    </div>
                    <div class="card-body ">
                        <form:form action="/thi/index" modelAttribute="item" method="post">
                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">ID Category</label>
                                <div class="col-sm-10">
                               <form:errors path="id" ></form:errors><br/>
                                    <form:input type="text" path="id" class="form-control" id="inputEmail3" placeholder="ID Category"/>
                                </div>
                               
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Name</label>
                                <div class="col-sm-10">
                                    <form:input path="name" type="text" class="form-control" id="inputPassword3" placeholder="Name"/>
                                </div>
                            </div>
                            <div class="submit--right">
                               
                                <div class="form-group-button row">
                                    <div class="col-sm-10 ">
                                        <button formaction="/thi/create" type="submit" 
                                            class="btn btn-primary button-color-add ">Thêm</button>
                                    </div>
                                </div>
                                <div class="form-group-button row">
                                    <div class="col-sm-10 ">
                                        <button formaction="/thi/update" type="submit" 
                                            class="btn btn-primary button-color-info ">Sửa</button>
                                    </div>
                                </div>
                                <div class="form-group-button row">
                                    <div class="col-sm-10 ">
                                        <button type="submit" class="btn btn-primary button-color-save"><a class="thea" href="/thi/delete/${item.id}">Delete</a></button>
                                    </div>
                                </div>
                                 <div class="form-group-button row  ">
                                    <div class="col-sm-10 ">
                                        <button type="submit" class="btn btn-primary  button-color-Reset"><a class="thea" href="/thi/index">Reset</a></button>
                                    </div>
                                </div>
                                
                                
                                
                            </div>

                     </form:form>
                    </div>
                </div>
              
                  <div class="card spur-card">
                    <div class="card-header">
                        <div class="spur-card-icon">
                            <i class="fas fa-table"></i>
                        </div>
                        <div class="spur-card-title">List Category</div>
                    </div>
                    <div class="card-body ">
                        <table class="table table-in-card">
                            <thead>
                           
                                <tr>
                                    <th scope="col" >Id Category</th>
                                    <th scope="col">Name</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="item" items="${items}">
                                <tr>
                                    <th scope="row">${item.id}</th>
                                    <td>${item.name}</td>
                                    <td> 
                                        <a href="/thi/edit/${item.id}" class="btn btn-outline-warning"> <i class="fas fa-edit"></i></a>
                                    </td>
                                  
                                </tr>
                                </c:forEach>
                            </tbody>
                            
                        </table>
                    </div>
                </div>
            </div>

               <!-- Lissst -->
             
        </div>
    </div>

    <!-- boostrap -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--  -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="/js/spur.js"></script>
</body>

</html>