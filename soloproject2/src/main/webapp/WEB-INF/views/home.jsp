<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">

<style>
a {
	color: black;
	position:relative;
	font-size:20px;
}
</style>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})
		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})

		$("#memberDeleteBtn").on("click", function() {
			location.href = "member/memberDeleteView";
		})

	})
</script>
<body>
		<span> <a href="/board/list">게시판</a><br />
		</span>
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div class="cover">
				<div class="cover-image"
					style="background-image: url('https://ununsplash.imgix.net/photo-1421284621639-884f4129b61d?w=1024&amp;amp;q=50&amp;amp;fm=jpg&amp;amp;s=9f9c4eb194b84f49e6c6aa624de61ba2')"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1 class="text-success">WebBoard</h1>
							<p class="text-danger">Hey Guys Nice to Meet You!</p>
							<br> <br>

							<div>
								<label for="userId"></label> <input type="text" id="userId"
									name="userId">
							</div>
							<div>
								<label for="userPass"></label> <input type="password"
									id="userPass" name="userPass">
							</div>
							<div>
								<button type="submit">로그인</button>
								<button id="registerBtn" type="button">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div class="cover">
				<div class="cover-image"
					style="background-image: url('https://ununsplash.imgix.net/photo-1421284621639-884f4129b61d?w=1024&amp;amp;q=50&amp;amp;fm=jpg&amp;amp;s=9f9c4eb194b84f49e6c6aa624de61ba2')"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1 class="text-success">WebBoard</h1>
							<p class="text-danger">Hey Guys Nice to Meet You!</p>
							<br> <br>
							<div>
								<p>${member.userId}님환영 합니다.</p>
								<button id="memberUpdateBtn" type="button">회원정보수정</button>
								<button id="memberDeleteBtn" type="button">회원탈퇴</button>
								<button id="logoutBtn" type="button">로그아웃</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>
<jsp:include page="foot.jsp"/>