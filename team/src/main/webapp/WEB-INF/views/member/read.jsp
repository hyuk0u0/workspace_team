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
      <label for="id">아이디</label>
      <input id="id" name="id" class="form-control" value="${mDto.id}" readonly>
      <input id="idWarn" class="form-control" value="아이디는 등록 후 수정이 불가합니다." style="color: red" readonly>
    </div>

    <div class="form-group">
      <label for="pw">비밀번호</label>
      <input id="pw" name="pw" class="form-control" type="password" value="${mDto.pw}" readonly>
    </div>

    <div class="form-group">
      <label for="uname">이름</label>
      <input id="uname" name="uname" class="form-control" type="text" value="${mDto.uname}" readonly>
    </div>

    <div class="form-group">
      <label for="phone">휴대폰번호</label>
      <input id="phone" name="phone" class="form-control" type="text" value="${mDto.phone}" readonly>
    </div>

    <div class="form-group">
      <label for="addr">주소</label>
      <input id="addr" name="addr" class="form-control" type="text" value="${mDto.addr}" readonly>
    </div>

    <div class="form-group">
      <label for="grno">권한</label>
      <select id="grno" name="grno">
        <option value="${mDto.grno}" selected disabled>${mDto.authority}</option>
      </select>
    </div>
    <div class="form-group">
      <button id="memUpdateBtn" class="btn btn-primary">회원정보 수정</button>
      <button id="memListBtn" class="btn btn-primary">이전화면(목록)</button>
    </div>
  </div>

  <script type="text/javascript">
      $(document).ready(function() {
        $("#memUpdateBtn").on("click", function() {
          location.assign("/member/update.page/${mDto.id}");
        });
        $("#memListBtn").on("click", function() {
          location.href = "/member/list.page";
        });
      });
    </script>
</body>
</html>