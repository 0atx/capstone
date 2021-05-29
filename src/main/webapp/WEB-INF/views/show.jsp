<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html>
<head>
<title>HJJH Trip Home</title>
<meta charset="utf-8">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<div class="container-fluid">
   <header>
      <div>
         <nav class="navbar navbar-expand-sm fixed-top justify-content-end">
            <div class="container-fluid">
               <a class="navbar-brand" href="${pageContext.request.contextPath}/"><b>HJJH TRIP</b></a>
                  <button class="navbar-toggler" type="button"
                     data-bs-toggle="collapse"
                     data-bs-target="#navbarSupportedContent"
                     aria-controls="navbarSupportedContent" aria-expanded="false"
                     aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active"
                           aria-current="page" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              Dropdown </a>
                           <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <li><a class="dropdown-item" href="#">Action</a></li>
                              <li><a class="dropdown-item" href="#">Another action</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="#">Something else
                                    here</a></li>
                           </ul></li>
                     </ul>
               </div>
            </nav>
         </div>
        
         
         
      </header>

   </div>
</body>
</html>