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
<style type="text/css">
#idWarn {
  color: red;
}
</style>
</head>
<body>
  <div class="container">
    <form id="memUpdateForm" name="memUpdateForm" action="/member/update.page" method="post">
      <div class="form-group">
        <label for="id">아이디</label>
        <input id="id" name="id" class="form-control" value="${mDto.id}" readonly>
        <input id="idWarn" class="form-control" value="아이디는 등록 후 수정이 불가합니다." readonly>
      </div>

      <div class="form-group">
        <label for="pw">비밀번호</label>
        <input id="pw" name="pw" class="form-control" type="text" value="${mDto.pw}">
      </div>

      <div class="form-group">
        <label for="uname">이름</label>
        <input id="uname" name="uname" class="form-control" type="text" value="${mDto.uname}">
      </div>

      <div class="form-group">
        <label for="phone">휴대폰번호</label>
        <input id="phone" name="phone" class="form-control" type="text" value="${mDto.phone}">
      </div>

      <div class="form-group">
        <label for="addr">주소</label>
        <input id="addr" name="addr" class="form-control" type="text" value="${mDto.addr}">
      </div>

      <div class="form-group">
        <label for="grno">권한</label>
        <select id="grno" name="grno">
          <option value="${mDto.grno}" selected>${mDto.authority}</option>
          <option disabled="disabled">────────────────</option>
          <c:forEach items="${grlist}" var="grantDto">
            <option value="${grantDto.grno}">${grantDto.authority}</option>
          </c:forEach>
        </select>
      </div>
    </form>

    <div class="form-group">
      <button id="memUpdateBtn" class="btn btn-primary">정보 수정</button>
      <button id="memListBtn" class="btn btn-primary">수정 취소</button>
    </div>
  </div>

  <script type="text/javascript">
      $(document).ready(function() {
        $("#memUpdateBtn").on("click", function() {
          memUpCheck();

        });

        $("#memListBtn").on("click", function() {
          memCancleCheck();
        });
      });

      function memUpCheck() {

        if (confirm("정보를 수정하시겠습니까??") == true) { // 확인

          // '권한' 부분 수정여부 확인
          if ($("#grno").val() != ${mDto.grno}) {
            
            if(confirm("권한을 이대로 부여하시겠습니까??") == true) {
              
              document.memUpdateForm.submit();
              
              } else {
                return false;
              }

          } else if ($("#grno").val() == ${mDto.grno}) {
          document.memUpdateForm.submit();
            }
          
        } else { //취소

          return false;

        }

      }

      function memCancleCheck() {
        if (confirm("정보를 수정을 취소하시겠습니까?? 입력한 정보는 삭제됩니다.") == true) {
          location.assign("/member/list.page");
        } else { //취소
          return false;

        }

      }
    </script>
</body>
</html>