<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
#header {
  padding: 0%;
  width: 100%;
  height: 120px;
  text-align: center;
  display: inline-block;
  background-color: black;
}

#left {
  float: left;
  width: 15%;
  background-color: black;
  height: 100%;
}

#main {
  width: 85%;
  background-color: white;
  float: left;
  vertical-align: middle;
  height: 70%;
}

#footer {
  width: 100%;
  height: 50px;
  text-align: center;
  background-color: orange;
  clear: both;
}

#left, #main {
  min-height: 600px;
}

#body {
  height: 100%;
  padding: 0px;
}
</style>
</head>
<body>
  <div style="width: 100%; height: 100%;">
    <div id="header">
      <tiles:insertAttribute name="header" />
    </div>
    <div id="left">
      <tiles:insertAttribute name="left" />
    </div>
    <div id="main">
      <tiles:insertAttribute name="body" />
    </div>
    <div id="footer">
      <tiles:insertAttribute name="footer" />
    </div>
  </div>

  <script type="text/javascript">
      $(function() {

      });
    </script>
</body>
</html>