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
.th-center {
  text-align: center;
}
</style>

</head>
<body>
  <div class="container">
    <div class="row text-center">
      <h1>목록</h1>
    </div>

    <div class="row">
      <!-- <a href="/board/insert">글쓰기</a> -->
      <button class="btn btn-info" type="button" onclick="location.href='/board/insert.page'">글쓰기</button>
    </div>

    <div class="row">
      <table class="table">
        <thead>
          <tr>
            <th class="th-center">게시판 번호</th>
            <th class="th-center" style="width: 50%">제목</th>
            <th class="th-center">카테고리</th>
            <th class="th-center">제품번호</th>
            <th class="th-center">조회수</th>
          </tr>
        </thead>

        <tbody>
          <c:forEach items="${list}" var="bDto">
            <tr>
              <td>${bDto.bno}</td>
              <td>
                <a href="/board/read.page/${bDto.bno}">${bDto.title}</a>
              </td>
              <td>${bDto.cno}</td>
              <td>${bDto.gno}</td>
              <td>${bDto.regDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- class = row -->

    <div class="row text-center">
      <nav aria-label="Page navigation">
        <ul class="pagination">

          <li>
            <c:if test="${to.curPage > 1 }">
              <a href="/board/list.page?curPage=1">첨</a>
            </c:if>
          </li>

          <li>
            <c:if test="${to.curPage > 1 }">
              <a href="/board/list.page?curPage=${to.curPage > 1 ? to.curPage-1 : 1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </c:if>

            <!-- 
							<a href="/board/list?curPage=${to.curPage > 1 ? to.curPage-1 : 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
						-->
          </li>

          <c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="page">
            <li class="${to.curPage == page?'active' : ''}">
              <a href="/board/list.page?curPage=${page}">${page}</a>
            </li>
          </c:forEach>

          <li>
            <c:if test="${to.curPage < to.totalPage}">
              <a href="/board/list.page?curPage=${to.curPage < to.totalPage? (to.curPage+1) : to.totalPage}"
                aria-label="Next"
              >
                <span aria-hidden="true">&raquo;</span>
              </a>
            </c:if>
          </li>

          <li>
            <c:if test="${to.curPage < to.totalPage }">
              <a href="/board/list.page?curPage=${to.totalPage}">끝</a>
            </c:if>
          </li>


        </ul>
      </nav>
    </div>
    <!--  class row -->
    <div class="row">
      <form target="_blank" action="/board/searchlist" method="get">
        <div class="input-group">
          <span class="input-group-addon">
            <select name="searchType">
              <option disabled>검색 기준</option>
              <option value="writer">작성자</option>
              <option value="title">제목</option>
              <option value="content">내용</option>
            </select>
          </span>

          <input class="form-control" name="keyword">

          <span class="input-group-btn">
            <button class="btn btn-info">검색</button>
          </span>

        </div>
      </form>

    </div>

  </div>
  <!-- class=container -->

</body>
</html>