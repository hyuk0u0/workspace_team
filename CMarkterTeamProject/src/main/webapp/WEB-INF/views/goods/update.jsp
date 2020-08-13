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
<script src="/resources/js/uploadfn.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
#gooWarn {
  color: red;
}
</style>
</head>
<body>
  <div class="container">
    <form id="gooUpdateForm" action="/goods/update" method="post">
      <div class="form-group">
        <label for="gno">제품번호</label>
        <input id="gno" name="gno" class="form-control" value="${gDto.gno}" readonly>
        <input id="gooWarn" class="form-control" value="제품번호는 등록 후 수정이 불가합니다." readonly>
      </div>

      <div class="form-group">
        <label for="cno">카테고리</label>
        <select id="cno" name="cno">
          <option value="${gDto.cno}" selected>${gDto.cname}</option>
          <option disabled="disabled">────────────────</option>
          <c:forEach items="${clist}" var="cateDto">
            <option value="${cateDto.cno}" >${cateDto.cname}</option>
          </c:forEach>
        </select>
      </div>

      <div class="form-group">
        <label for="gname">제품명</label>
        <input id="gname" name="gname" class="form-control" type="text" value="${gDto.gname}">
      </div>

      <div class="form-group">
        <label for="price">가격</label>
        <input id="price" name="price" class="form-control" type="text" value="${gDto.price}">
      </div>
    </form>

    <div class="form-group">
      <button id="gooUpdateBtn" class="btn btn-primary">정보 수정</button>
      <button id="gooListBtn" class="btn btn-primary">수정 취소</button>
    </div>
  </div>

  <script type="text/javascript">
      $(document).ready(function() {
        $("#gooUpdateBtn").click(function() {
          event.preventDefault();

          $("#gooUpdateForm").submit();
        });
        $("#gooListBtn").on("click", function() {
          location.assign("/goods/list");
        });
      });
    </script>
</body>
</html>
