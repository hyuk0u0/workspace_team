<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="form-group">
      <button id="boaListBtn" class="btn btn-primary">상품</button>
      <c:if test="${login.grno == 1 || login.grno == 2|| login.grno == 3}">
        <button id="gooListBtn" class="btn btn-primary">등록된 제품목록(admin권한 이상부터 조회가능으로 수정필요)</button>
      </c:if>

      <c:if test="${login.grno == 1 || login.grno == 2}">
        <button id="memListBtn" class="btn btn-primary">회원목록(admin권한 이상부터 조회가능으로 수정필요)</button>
      </c:if>
    </div>
  </div>
  <script type="text/javascript">
      $(document).ready(function() {

        $("#boaListBtn").on("click", function() {
          location.href = "/board/list.page";
        });

        $("#gooListBtn").on("click", function() {
          location.href = "/goods/list.page";
        });

        $("#memListBtn").on("click", function() {
          location.href = "/member/list.page";
        });
      });
    </script>
</body>
</html>