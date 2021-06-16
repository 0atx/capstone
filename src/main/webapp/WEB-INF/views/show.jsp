<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <%@ page session="false"%> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>HJJH Trip Home</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/show.css" />
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
<!-- 일정확인 -->
 <!-- 이메일 입력 MODAL -->
   <div id="modal" class="emailModal">
      <div class="email-modal-content">
         <div class="page-header">
            <h1 class="nanum">HJJH TRIP</h1>
         </div>
         <hr>
         <br>
         <div class="emailForm">
            <input type="email" id="email" name="emailAddress" data-attrnum="21"maxlength="100" autocomplete="off" required> <label for="email"><span>Email-address</span></label>
         </div>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-primary" onclick="checkEmail()"
                  id="showPlanBtn">
                  <div>
                     <i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">일정 불러오기</h7>
                  </div>
               </button>
            </div>
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeModal()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">이전 화면으로 돌아가기</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>
   <!-- 일정 불러오기 이메일 입력 오류 MODAL -->
   <div id="errorModal" class="emailErrorModal">
      <div class="email-error-modal-content">
         <div class="page-header">
            <h1 class="nanum">HJJH TRIP</h1>
         </div>
         <hr>
         <label class="position-left"> <h7> <b data-langnum="53">입력하신
               이메일은 일정이 존재하지 않습니다. 일정을 새로 만들거나 이메일을 바르게 입력했는지 확인해주세요.</b> </h7>
         </label> <br>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-primary" onclick="returnEmailModal()"
                  id="returnModalBtn">
                  <div>
                     <i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">이메일 다시 입력하기</h7>
                  </div>
               </button>
            </div>
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeErrorModal()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">창 닫기</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>
   
   
<!-- 일정 삭제용 MODAL -->
   <div id="modal2" class="emailModal">
      <div class="email-modal-content">
         <div class="page-header">
            <h1 class="nanum">Delete Your Plan</h1>
         </div>
         <hr>
         <br>
         <div>
           <p> <span style="color:red;"><i class="fas fa-exclamation-triangle"></i></span>
                 정말로 만들어진 일정을 삭제하시겠습니끼?<br>
                 삭제 후에는 일정을 되돌릴 수 없습니다.</p>
         </div>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
            <!-- 삭제하는거 온클릭 연결시키기 -->
               <button class="btn btn-primary" onclick="removeData()"
                  id="showPlanBtn">
                  <div>
                     <i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">일정 삭제하기</h7>
                  </div>
               </button>
            </div>
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeModal2()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">이전 화면으로 돌아가기</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>
   <!-- 삭제 완료 후 보여질 모달 -->
   <div id="finishModal" class="emailErrorModal">
      <div class="email-error-modal-content">
         <div class="page-header">
            <h1 class="nanum">Delete Your Plan</h1>
         </div>
         <hr>
         <label class="position-left"> <h7> <b data-langnum="53">만들어진 일정이 삭제되었습니다.</b> </h7>
         </label> <br>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeFinishModal()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">홈 화면으로</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>

   <%
   String email = request.getParameter("email");
   System.out.println("결과 : " + email);
   %>
   <script>
      var email = '<%=email%>';
   </script>
   <header>
   <div>
      <nav class="navbar navbar-expand-sm justify-content-end">
      <div class="container-fluid">
         <a class="navbar-brand" href="${pageContext.request.contextPath}/"><b>HJJH
               TRIP</b></a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page"  href="${pageContext.request.contextPath}/">Home</a>
                  </li>
               <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Menu </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" onclick="deleteModal()">일정 삭제</a></li>
                     <li><hr class="dropdown-divider"></li>
                     <li><a class="dropdown-item" onclick="showModal()">일정 확인</a></li>
                  </ul></li>
            </ul>
         </div>
      </nav>
   </div>
   </header>
   <div class="container-fluid">
      <article>
      <div class="planTop">
            <span id="tbsp1">YOUR PLAN</span> 
      </div>
      <table class="table">
      <caption id="caption" style="caption-side:top;"></caption>
      
         <thead>
            <tr>
               <th scope="col">DAY</th>
               <th scope="col">SPOT</th>
            </tr>
         </thead>
         <tbody id="plan_tbody">
            
         </tbody>
      </table>
     <div class="planBot">
           <span id="tbsp2">ENJOY :)</span> 
     </div>
      </article>
   </div>
   
    <script src="${pageContext.request.contextPath}/resources/js/show.js"></script>
   
</body>
</html>