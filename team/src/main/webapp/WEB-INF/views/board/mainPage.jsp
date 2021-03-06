<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<jsp:include page="../includes/header.jsp" />
	
	<div class="container">
		<div class="row text-center">
			<h1 style="color:lightblue;">전체 상품 목록</h1>
		</div>
		
		<div class="row">
			<c:if test="${!empty login }">
			<button class="btn_bebe pink" onclick="location.href='/board/insert'">글쓰기</button>
			</c:if>
		</div><br>
	

		<div class="row">
			<table class="table table-borderless"> 
			<tbody id="myTable">
				<%
					int newLine = 0;
					int articleCount = 0;
					int cnt = 0;
				%>
				<c:forEach items="${boardList}" var="dto">

				<%
					if (newLine == 0) {
						out.print("<tr>");
					}
					newLine++;
					articleCount++;
				%>
				<td align="center" width="190">
					<input type="hidden" value="${dto.bno }" name="bno" />					
					<a href="/board/read/${dto.bno }">
						<c:if test="${!empty dto.fullName}">
						<img alt="" src="/displayfile?filename=${dto.fullName}" width="200" height="200"/>
						
						</c:if>
						<c:if test="${empty dto.fullName}">
						<img alt="" src="/resources/default.png" width="200" height="200">
						</c:if>						
						<br>${dto.title }
					</a><br>
					${dto.gname}<br>
					<b><fmt:formatNumber value="${dto.price}" type="number"/> 원</b><br>
					<a href="#">
						${dto.cname }</a>
					<c:if test="${login.authority.equals('marketer')|| login.authority.equals('admin')|| login.authority.equals('ceo')}">
						<br>
					<button onclick="managerdelete('${dto.bno}')">삭제</button>
					</c:if>
				</td>
				<%
					if(newLine==4){
						out.print("</tr>");
						newLine = 0;
					}
				%>
				</c:forEach>

			</tbody>
			</table>
		</div><!-- class = row (table) -->
		<div class="row text-center">
		<nav aria-label="Page navigation">
  		<ul class="pagination">
    		<li>
      		<a href="/board/list?curPage=${to.curPage > 1 ? to.curPage-1 : 1 }" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		</a>
    		</li>
    		<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
    			<li class="${to.curPage == page? 'active' : '' }">
    			<a href="/board/list?curPage=${page}">${page }</a>
    			</li>
    		</c:forEach>
			<li>
      		<a href="/board/list?curPage=${to.curPage < to.totalPage ? to.curPage+1 : to.curPage }" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      		</a>
    		</li>
  		</ul>
		</nav>
		</div><!-- class = row (page) -->
		
	
		
	</div><!-- class = container -->

	<script type="text/javascript">	

		$(document).ready(function(){

			var str = '<img src = "/resources/default.png"/>';

			$(".goodsImg").append(str);

		});
	</script>
	
	<jsp:include page="../includes/footer.jsp" />
</body>
</html>