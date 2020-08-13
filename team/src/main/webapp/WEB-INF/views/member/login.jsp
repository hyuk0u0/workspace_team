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
html, body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
}

#loginContainer {
  height: 100%;
}

#loginForm {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

#loginForm {
  font-weight: 400;
  padding-top: 150px;
  height: 100%;
}

#loginForm .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}

#loginForm .form-control {
  z-index: 2;
}

#loginForm input[id="id"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

#loginForm input[id="pw"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
</head>
<body>
  <div id="loginContainer" class="container">
    <!-- login form {s} -->
    <form id="loginForm" method="post" action="/member/loginpost">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal">CMarket.COM</h1>
      </div>
      <div class="form-label-group">
        <label for="id"></label>
        <input id="id" name="id" class="form-control" placeholder="ID" required />
      </div>
      <div class="form-label-group">
        <label for="pw"></label>
        <input id="pw" name="pw" class="form-control" placeholder="Password" type="password" autocomplete="off" required />
      </div>
      <button id="memLogin" class="btn btn-lg btn-primary btn-block" type="button" onclick="fn_loginIdChk();" value="2">로그인</button>
      <button id="memInsertBtn" class="btn btn-lg btn-primary btn-block" type="button">회원가입</button>
      <button id="returnHome" class="btn btn-lg btn-primary btn-block" type="button">홈페이지</button>
      <p class="mt-5 mb-3 text-muted text-center">© 2020. TeamCMarket. All rights reserved.</p>
    </form>

    <!-- login form {e} -->
  </div>




  <script type="text/javascript">
      $(document).ready(function() {
        $("#memLogin").on("click", function() {
          $("#loginForm").submit();

        });

        $("#memInsertBtn").on("click", function() {
          location.href = "/member/insert.page";
        });

        $("#returnHome").on("click", function() {
          location.href = "/board/mainPage.page";
        });
      });
    </script>
</body>
</html>