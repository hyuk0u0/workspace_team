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
#gooWarn {
  color: red;
}
</style>
</head>
<body>
  <div class="container">
    <form id="gooInsertForm" action="/goods/insert" method="post">
      <div class="form-group">
        <label for="gno">제품번호</label>
        <input id="gno" name="gno" class="form-control" type="text">
        <input id="successChk" name="successChk" class="form-control" type="hidden" value="" readonly>
        <input style="color: black;" id="gooChkOk" class="form-control" value="제품번호 입력 후 중복확인 버튼을 클릭하세요." readonly>
        <input id="gooWarn" type="hidden" class="form-control" value="!!주의 : 제품번호는 등록 후 변경이 불가합니다. 신중히 입력하세요!!" readonly>
        <!-- type="hidden" -->
        <button id="gooChk" type="button" onclick="fn_gooChk();" value="1" class="btn btn-primary">중복확인</button>
      </div>

      <div class="form-group">
        <label for="cno">카테고리</label>
        <select id="cno" name="cno">
          <option value="">-----선택하세요-----</option>
          <option disabled="disabled">-----------------</option>
          <c:forEach items="${clist}" var="cateDto">
            <option value="${cateDto.cno}">${cateDto.cname}</option>
          </c:forEach>
        </select>
      </div>

      <div class="form-group">
        <label for="gname">제품명</label>
        <input id="gname" name="gname" class="form-control" type="text">
      </div>

      <div class="form-group">
        <label for="price">가격</label>
        <input id="price" name="price" class="form-control" type="text">
      </div>
    </form>

    <div class="form-group">
      <button id="gooInsertBtn" class="btn btn-primary" type="button">제품 등록</button>
      <!-- onclick="fn_neverUpdate()" -->
      <button id="gooListBtn" class="btn btn-primary" type="button">등록 취소</button>
    </div>
  </div>
  <script type="text/javascript">
      $(document).ready(function() {
        $("#gooInsertBtn").on("click", function() {
          if ($("#gno").val() == "") {
            alert("제품번호를 입력하세요.");
            $("#gno").focus();
            return false;
          }

          if ($("#cno").val() == "") {
            alert("카테고리를 선택하세요");
            $("#cno").focus();
            return false;
          }

          if ($("#gname").val() == "") {
            alert("제품명을 입력하세요.");
            $("#gname").focus();
            return false;
          }

          if ($("#price").val() == "") {
            alert("가격을 입력하세요.");
            $("#price").focus();
            return false;
          }

          var gooChkVal = $("#gooChk").val();

          if (gooChkVal == "1") {
            alert("제품번호 중복확인하세요.");

          } else if (gooChkVal == "2") {
            alert("제품번호를 확인하세요.");
            $("#gno").focus();

          } else if (gooChkVal == "3" && $("#successChk").val() != $("#gno").val()) {
            alert("제품번호를 수정한 후에는 중복확인을 다시 해주세요.")
            $("#gooChkOk").attr("value", "제품번호 중복확인하세요.");
            $("#gooChkOk").attr("style", "color: black;");
          } else if (gooChkVal == "3" && $("#successChk").val() == $("#gno").val()) {
            $("#gooInsertForm").submit();

          }

        });

        $("#gooListBtn").on("click", function() {
          location.href = "/goods/list";
        });
      });

      function fn_gooChk() {

        if ($("#gno").val() === "") {
          alert("제품번호를 입력하세요.");
          $("#gno").focus();
          $("#gooChkOk").attr("value", "제품번호 입력 후 중복확인 버튼을 눌러주세요.");
          $("#gooChkOk").attr("style", "color: black;");
          $("#gooChk").attr("value", "1");

        }

        $.ajax({
          url : "/goods/gooChk",
          type : "post",
          dataType : "json",
          data : {
            "gno" : $("#gno").val()
          },
          success : function(data) {
            if (data == 1) {
              alert("이미 등록된 제품번호입니다.");
              $("#gooChk").attr("value", "2");
              $("#gooChkOk").attr("value", "이미 등록된 제품번호입니다. 제품번호를 다시 입력하세요.");
              $("#gooChkOk").attr("style", "color: black;");
              $("#gooWarn").attr("type", "hidden");
              $("#gno").focus();

            } else if (data == 0) {
              alert("사용가능한 제품번호입니다.");
              $("#gooChk").attr("value", "3");
              $("#successChk").attr("value", $("#gno").val());
              $("#gooChkOk").attr("value", "사용가능한 제품번호입니다.");
              $("#gooChkOk").attr("style", "color: green;");
              $("#gooWarn").attr("type", "text");

            }
          }
        })
      }
    </script>
</body>
</html>