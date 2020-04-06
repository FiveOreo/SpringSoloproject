<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		//취소
		$(".cencle").on("click" function(){
			location.href="/";
		})
		
		$("#submit").on("click" function(){
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			$.ajax({
				url:"/member/passChk",
				type:"POST",
				dateType:"json",
				data:$("#deleteForm").serializeArray(),
				success: function(data) {
					
					if(data==true){
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						}
					}else{
						alert("패스워드가 틀렷습니다");
						return;
					}
				}
			})
		});
	})
</script>
<body>
	<section id="container">
		<form action="/member/memberDelete" method="post">
			<div class="form-group has-feedback">
				<label class="control-label"  for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">비밀번호</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label>
				<input class="form-control" type="text" id="userName" name="userName" value="${member.userName }" readonly="readonly"/>
			</div>
		</form>
		<div class="form-group has-feedback">
			<button class="button btn-success" type="button" id="submit">회원탈퇴</button>
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
		 <div>
		 	<c:if test="${msg == false }">
		 		비밀번호가 맞지 않습니다.
		 	</c:if>
		 </div>
	</section>
</body>
</html>