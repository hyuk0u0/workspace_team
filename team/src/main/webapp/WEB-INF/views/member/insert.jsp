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
    <form id="memInsertForm" action="/member/insert.page" method="post">
      <div class="form-group">
        <label for="id">아이디</label>
        <input id="id" name="id" class="form-control" type="text">
        <input id="successIdChk" name="successIdChk" class="form-control" type="hidden" value="" readonly>
        <input style="color: black;" id="idChkOk" class="form-control" value="아이디 입력 후 중복확인 버튼을 클릭하세요." readonly>
        <input id="idWarn" type="hidden" class="form-control" value="!!주의 : 등록된 아이디는 변경이 불가합니다." readonly>
        <!-- type="hidden" -->
        <button id="idChk" type="button" onclick="fn_idChk();" value="1" class="btn btn-primary">중복확인</button>
      </div>

      <div class="form-group">
        <label for="pw">비밀번호</label>
        <input id="pw" name="pw" class="form-control" type="password">
      </div>

      <div class="form-group">
        <label for="uname">이름</label>
        <input id="uname" name="uname" class="form-control" type="text">
      </div>

      <div class="form-group">
        <label for="phone">휴대폰 번호</label>
        <input id="phone" name="phone" class="form-control" type="text">
      </div>

      <div class="form-group">
        <label for="addr">주소</label>
        <input id="addr" name="addr" class="form-control" type="text">
      </div>

      <div class="form-group">
        <label for="grno">권한</label>
        <input id="grno" name="grno" class="form-control" type="hidden" value="4" readonly>
        <input id="authority" name="authority" class="form-control" type="text" value="consumer" readonly>
      </div>
    </form>

    <div class="form-group">
      <button id="memInsertBtn" class="btn btn-primary" type="button">회원가입</button>
      <!-- onclick="fn_neverUpdate()" -->
      <button id="memIstCancleBtn" class="btn btn-primary" type="button">회원가입 취소</button>
    </div>
  </div>
  <script type="text/javascript">
      $(document).ready(function() {
        $("#memInsertBtn").on("click", function() {
          if ($("#id").val() == "") {
            alert("아이디를 입력하세요.");
            $("#id").focus();
            return false;
          }

          if ($("#pw").val() == "") {
            alert("비밀번호를 입력하세요.");
            $("#pw").focus();
            return false;
          }

          if ($("#uname").val() == "") {
            alert("이름을 입력하세요.");
            $("#uname").focus();
            return false;
          }

          if ($("#phone").val() == "") {
            alert("휴대폰 번호를 입력하세요.");
            $("#phone").focus();
            return false;
          }

          if ($("#addr").val() == "") {
            alert("주소를 입력하세요.");
            $("#addr").focus();
            return false;
          }

          var idChkVal = $("#idChk").val();

          if (idChkVal == "1") {
            alert("아이디 중복확인하세요.");

          } else if (idChkVal == "2" && $("#successIdChk").val() == $("#id").val()) {
            alert("아이디를 확인하세요.");
            $("#id").focus();

          } else if (idChkVal == "2" && $("#successIdChk").val() != $("#id").val()) {
            alert("아이디를 수정한 후에는 중복확인을 다시 해주세요.")
            $("#idChkOk").attr("value", "아이디 중복확인하세요.");
            $("#idChkOk").attr("style", "color: black;");

          } else if (idChkVal == "3" && $("#successIdChk").val() != $("#id").val()) {
            alert("아이디를 수정한 후에는 중복확인을 다시 해주세요.")
            $("#idChkOk").attr("value", "아이디 중복확인하세요.");
            $("#idChkOk").attr("style", "color: black;");

          } else if (idChkVal == "3" && $("#successIdChk").val() == $("#id").val()) {
            $("#memInsertForm").submit();

          }

        });

        $("#memIstCancleBtn").on("click", function() {
          location.href = "/board/mainPage.page";
        });
      });

      function fn_idChk() {

        $.ajax({
          url : "/member/idChk.page",
          type : "post",
          dataType : "json",
          data : {
            "id" : $("#id").val()
          },
          success : function(data) {
            if (data == 0 && $("#id").val() == "") {
              alert("아이디를 입력하세요.");
              $("#idChk").attr("value", "1");
              $("#successIdChk").attr("value", $("#id").val());
              $("#idChkOk").attr("value", "아이디를 입력하세요.");
              $("#idChkOk").attr("style", "color: black;");
              $("#idWarn").attr("type", "hidden");

            } else if (data == 1 && $("#id").val() != "") {
              alert("이미 등록된 아이디입니다.");
              $("#idChk").attr("value", "2");
              $("#idChkOk").attr("value", "이미 등록된 아이디입니다. 아이디를 다시 입력하세요.");
              $("#idChkOk").attr("style", "color: black;");
              $("#idWarn").attr("type", "hidden");
              $("#id").focus();

            } else if (data == 0 && $("#id").val() != "") {
              alert("사용가능한 아이디입니다.");
              $("#idChk").attr("value", "3");
              $("#successIdChk").attr("value", $("#id").val());
              $("#idChkOk").attr("value", "사용가능한 아이디입니다.");
              $("#idChkOk").attr("style", "color: green;");
              $("#idWarn").attr("type", "text");
            }
          }
        })
      }
    </script>
</body>
</html>