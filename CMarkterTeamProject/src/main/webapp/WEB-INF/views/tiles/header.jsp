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

#home {
  text-align: left;
  padding-left: 1%;
}

#dropdown {
  text-align: right;
  padding-right: 1%;
}

#headerloginMenuUL, #headerlogoutMenuUL {
  height: 250px;
  width: 300px;
}

#headerloginForm .form-group, #headerlogoutForm .form-group {
  text-align: center;
  vertical-align: middle;
  width: 70%;
}

#headerLogoutBtn, #headerLoginBtn {
  text-align: right;
}
</style>
</head>

<nav class="navbar">
  <div id="headerBar">
    <div id="homeBtn">
      <li class="active">
        <h1 id="home" class="h1 mb-3 font-weight-normal">
          <a href="/board/main.page">CMarKet.COM</a>
        </h1>
      </li>
    </div>
    <!-- 로그인시 팝업창 -->
    <div id="dropdown" class="dropdown">
      <c:if test="${empty login}">
        <button id="headerloginMenu" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-log-in"> 로그인</span>
        </button>
        <!-- login form {s} -->
        <ul id="headerloginMenuUL" aria-labelledby="headerloginMenu" class="dropdown-menu dropdown-menu-right"
          role="menu"
        >
          <form id="headerloginForm" method="post" action="/member/loginpost">
            <div class="form-group">
              <label for="headerId">아이디</label>
              <input id="headerId" name="id" class="form-control" placeholder="ID" required />
            </div>
            <div class="form-group">
              <label for="headerPw">비밀번호</label>
              <input id="headerPw" name="pw" class="form-control" placeholder="Password" type="password"
                autocomplete="off" required
              />
            </div>
          </form>
          <div id="headerLoginBtnGroup" class="headerLogin btn-group">
            <button id="headerLoginBtn" class="btn btn-primary" type="button">로그인</button>
            <button id="headerMemInsertBtn" class="btn btn-primary" type="button">회원가입</button>
          </div>
          <p style="font-size: 3px">© 2020. TeamCMarket. All rights reserved.</p>
        </ul>
      </c:if>
      <!-- 비로그인시 팝업창 -->

      <c:if test="${not empty login}">
        <button id="headerlogoutMenu" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-log-in"> 회원정보</span>
        </button>
        <!-- login form {s} -->
        <ul id="headerlogoutMenuUL" class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="logoutMenu">
          <form id="headerlogoutForm" method="post" action="/member/logout">
            <div class="form-group">
              <label for="headerId">아이디</label>
              <input id="headerId" name="id" class="form-control" value="${login.id}" readonly />
            </div>
            <div class="form-group">
              <label for="headerUname">사용자</label>
              <input id="headerUname" name="pw" class="form-control" value="${login.uname}" readonly />
            </div>
            <div class="form-group">
              <label for="headerGrno">등급</label>
              <input id="headerGrno" name="grno" class="form-control" value="${grlist.authority}" readonly />
            </div>
          </form>
          <div id="headerLogoutBtnGroup" class="headerLogout btn-group">
            <button id="headerLogoutBtn" class="btn btn-primary" type="button">로그아웃</button>
            <button id="headerForByUserDel" class="btn btn-primary" type="button">회원탈퇴</button>
          </div>
          <p style="font-size: 3px">© 2020. TeamCMarket. All rights reserved.</p>
        </ul>
      </c:if>
    </div>
    <!-- login form {e} -->
  </div>
</nav>



<script type="text/javascript">
  $(document).ready(function() {

    $("#headerLoginBtn").on("click", function() {
      $("#headerloginForm").submit();
    });
    /* 회원가입 */
    $("#headerMemInsertBtn").on("click", function() {
      location.href = "/member/insert.page";
    });

    /* 로그인이 된 창 */
    /* 로그아웃 */
    $("#headerLogoutBtn").on("click", function() {
      location.href = "/member/logout.page";
    });
    /* 회원에 의한 회원탈퇴 */
    $("#headerForByUserDel").on("click", function() {
      location.href = "/member/delete.page/${login.id}";
    });

  });
</script>
