<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>회원가입</title>
<script type="text/javascript">
	$(document).ready (function() {
		//취소
		$(".cencle").on("click", function(){
			
			location.href = "/login";
		})
		
		$("#submit").on("click", function(){
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if($("#userName").val()==""){
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
		}
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요");	
		}else if(idChkVal == "Y"){
			$("#refForm").submit();
		}
		});
		
	})
	
	function fn_idChk(){
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value","Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})	
	}
</script>
</head>
<body>
	<section id="container">
		<form action="/member/register" method="post">
			<div class="form-group  has-feedback">
				<label class="control-label" for="userid">아이디</label> <input
					class="form-control" type="text" id="userid" name="userid" />
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" Value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label> <input
					class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="userName" />
			</div>
			<div>
				<button class="btn btn-success" type="submit"  id="submit" >회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
	
</body>

</html>