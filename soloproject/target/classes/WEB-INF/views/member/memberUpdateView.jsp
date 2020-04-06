<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		//취소
		$(".cencle").on("click", function(){
			location.href = "/";	
		})
		
		$("#submit").on("click", function(){
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#userPass").focus();
				return false;
			}
			if($("#userName").val()==""){
				alert("성명을 입력해주세요");
				$("#userName").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "post",
				dataType : "json",
				data : $("#updateForm").serializeArray(),
				success : function(data){
					
					if(data==true){
						if(confirm("회원수정하시겠습니까?")){
							$("updateForm").submit();
						}
					}else{
						alert("패스워드가 틀렸습니다.");
						return;
					}
					
				}
			})
		});
	})
</script>
<body>
	<section id="container">
		<form action="/member/memberUpdate" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label>
				<input class="form-control" type="password" id="userPass" name="userPass"/>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>
</html>