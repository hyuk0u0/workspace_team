<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<nav class="navbar navbar-primary" style="margin-bottom: -20px; margin-top: 0px;">
		<div class="container">
	  		<div class="navbar-header">
	      		<a class="navbar-brand" href="/board/mainPage">브랜드명</a>
	    	</div>
	    	<ul class="nav navbar-nav">
	      		<li class="active"><a href="/board/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
	      		<li class="dropdown">
    				<a class="dropdown-toggle" role="button" type="button" data-toggle="dropdown">제품 둘러보기<span class="caret"></span></a>
    				<ul class="dropdown-menu">
      					<li><a href="#">1</a></li>
      					<li><a href="#">2</a></li>
      					<li><a href="#">3</a></li>
      					<li><a href="#">4</a></li>
      					<li><a href="#">5</a></li>
    				</ul>
  				</li>
  				<li><a href="#">BEST</a></li>
	    	</ul>
	    	<ul class="nav navbar-nav navbar-right">
	    		<c:if test="${login.grno == 1}">
	    			<li><a href="/board/ceoPage">경영자페이지</a></li>
	    		</c:if>
	    		<c:if test="${login.grno == 2}">
	    			<li><a href="/board/adminPage">관리자페이지</a></li>
	    		</c:if>
	    		<c:if test="${login.grno == 3}">
	    			<li><a href="/board/insert">게시글등록</a></li>
	    		</c:if>
	    		<c:if test="${empty login}">
	      			<li><a href="/member/register"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	      		</c:if>
	      		<c:if test="${not empty login}">
	      			<li><a href="/member/myPage/${login.id}"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
	      		</c:if>
	      		<c:if test="${empty login}">
		      		<li><a href="/member/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	      		</c:if>
	      		<c:if test="${not empty login}">
		      		<li><a href="/member/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
	      		</c:if>
	    	</ul>
	  	</div>
	</nav>
	<hr>
	
</body>
	
