<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.navbar {
  height: 100%;
  margin-bottom: 0;
  background-color: black;
  z-index: 9999;
  border: 0;
  font-size: 12px !important;
  line-height: 1.42857143 !important;
  letter-spacing: 4px;
  border-radius: 0;
  font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
  color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
  color: #f4511e !important;
  background-color: #fff !important;
}

.navbar-default .navbar-toggle {
  border-color: transparent;
  color: #fff !important;
}

#home, #headerMenu {
  padding-bottom: 0%;
}

#home {
  text-align: left;
  padding-left: 1%;
  margin-bottom: 0%;
}

#headerMenu {
  text-align: right;
  padding-right: 1%;
}
</style>
</head>

<nav class="navbar">
  <div id="headerBar">
    <div id="homeBtn">
      <li class="active">
        <h1 id="home" class="h1 mb-3 font-weight-normal">
          <a href="/board/mainPage.page">CMarKet.COM</a>
        </h1>
      </li>
    </div>
    <!-- 비로그인시 로그인 아이콘 -->
    <div id="headerMenu">
      <c:if test="${empty login}">
        <button id="headerLoginBtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-log-in"> 로그인</span>
        </button>
        <button id="headerMemInsertBtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-log-in"> 회원가입</span>
        </button>
      </c:if>

      <!-- 로그인시 해더 표시 아이콘-->
      <c:if test="${not empty login}">
        <button id="headerLogoutBtn" class="btn btn-primary" type="button">
          <span class="glyphicon glyphicon-log-in"> 로그아웃</span>
        </button>
        <button id="headerReadBtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-log-in"> 회원정보</span>
        </button>
      </c:if>
    </div>
    <!-- login form {e} -->
  </div>
</nav>



<script type="text/javascript">
  $(document).ready(function() {
    /* 로그인 */
    $("#headerLoginBtn").on("click", function() {
      location.href = "/member/login.page";
    });

    /* 회원가입 */
    $("#headerMemInsertBtn").on("click", function() {
      location.href = "/member/insert.page";
    });

    /* 로그아웃 */
    $("#headerLogoutBtn").on("click", function() {
      location.href = "/member/logout";
    });

    /* 회원정보보기 */
    $("#headerReadBtn").on("click", function() {
      location.href = "/member/read.page/${login.id}";
    });
  });
</script>
