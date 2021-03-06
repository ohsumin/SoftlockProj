<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String key = session.getAttribute("key").toString();
	String vkey = key.substring(8, 24);
	session.setAttribute("vkey", vkey);
	System.out.println("keyyyyyy="+key);
	/* String inputText = "0"; */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀임</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css">
<script src="../resources/common/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
$(function() {
	var count = 0;
	<%-- var key = '<%=session.getAttribute("key")%>';
	$.each(key,function(key,value) {
		var key = value.key;
	}); --%>

	// 로그인 버튼을 눌렀을때          
	$('#loginBtn').click(function() {  
		
		// 폼값확인
		if($('#id').val() == ""){
			$('#loginMsg').html('아이디를 입력해주세요.');
			$('#loginMsg').css("color", "red");
			$('#id').focus();
			return false;
		}
		if($('#pass').val() == ""){
			$('#loginMsg').html('비밀번호를 입력해주세요.');
			$('#loginMsg').css("color", "red");
			$('#pass').focus();
			return false;
		} 
/* 		if($('#inputText').val() == ""){
			alert("이미지에 보이는 문자를 입력해주세요.")
			$('#inputText').focus();
			return false;
			
		}  */
		
		// 폼전송                                                                                      
		var id = $('#id').val();
		var pass = $('#pass').val();
		var inputText = $('#inputText').val();
		$.ajax({
			type : 'post',
			url : '../member/loginAction',
			data : {
	        	id : id,
	        	pass : pass,
	        	inputText : inputText
	        },
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
	        dataType : "json",
			contentType : "application/x-www-form-urlencoded;charset:utf-8",
			success : function(d) {    
	            if (d.success == 0) {
	                $('#loginMsg').html("아이디와 비밀번호를 확인해주세요."); 
	                $('#loginMsg').css("color", "red");
					count++;
					if(count == 3){
						var strDOM = ' <img src = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=<%=vkey%>" /> ';
		                strDOM += '<input type="text" class="form-control" id="inputText" name="inputText" placeholder="이미지에 보이는 문자를 입력해주세요." style="font-size:0.8em;"><hr/>';
	                	$('#div01').html(strDOM);
	                	strDOM = "";
	                	count = 2;
					}
					
	            } 
	            else if (d.success == 1){
	            	if(d.checkFlag == 1){
		            	location.href='../member/home';
	            	}else if(d.checkFlag==0){
	            		alert("정확한 문자 입력 실패");
	            	}else if(d.checkFlag==2){
	            		location.href='../member/home';
	            	}
	            		
	            	
	            } else if(d.success == -1){
		            	$('#loginMsg').html("이메일 인증이 되어있지 않습니다. 인증 후 로그인 해주세요."); 
		                $('#loginMsg').css("color", "red");
	            }
	        },
	        error : function(e) {  
				alert("실패ek" + e.status + " : " + e.statusText);
			}
		});
		
		

	});
});
</script>
<style type="text/css">
#a{
	color:gray;
}
#a:hover{
	color:#2f5ed6;
}
</style>
</head>
<body style="background-color:#F5F6F9">
<!-- Navigation -->
<jsp:include page="/resources/common/nav.jsp"/>
<div class="container">
<form name="loginForm">
	<!-- 로그인 처리 후 다시 돌아가야 할 페이지 URL -->      
	<input type="hidden" name="returnPage" value="" /><br /><br /><br /><br />
	<div style="width:1000px; height:auto; background-color:white; text-align:center; float:none; margin:0 auto;">
		<div style="width:400px; background-color:white; text-align:center; float:none; margin:0 auto;">
			<br /><br /><br />
			<div class="logo">
				<h4>로그인</h4>	   
				<br /><br /> 
				<div id="div01"></div>
			</div>	
			<div>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요."
					style="font-size:0.8em;">
			</div><br />
			<div>
				<input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요."
					style="font-size:0.8em;">
			</div>
			<div id="loginMsg" style="text-align:left; font-size:0.7em;"></div><br />
			<div>
				<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block">로그인</button>
			</div>
			<div style="margin-top:10px;">
				<div style="width:48%; display:inline-block;"><a id="a" href="../member/Captcha" style="font-size:0.7em;">회원가입</a></div>
				<div style="font-size:0.7em; color:gray; display:inline-block;">｜</div>
				<div style="width:46%; display:inline-block;"><a id="a" href="../member/find" style="font-size:0.7em;">ID/PW찾기</a></div>
			</div>
			<hr />
<!-- 			<div style="width:49%; display:inline-block;"><button>네이버로그인</button></div> --> 
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naverIdLogin" style="display:inline-block; margin-top:10px;"></div>
			<div style="font-size:0.7em; display:inline-block; margin-left:15px; color:gray">네이버아이디로 간편로그인하기</div>
			<!-- <img width="50px" src="../resources/images/네이버 아이디로 로그인_아이콘형_White.PNG" id="naverIdLogin"/> -->
			<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			
			<!-- 네이버아디디로로그인 초기화 Script -->
			<script type="text/javascript">
				var naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "BzBQXoe0lFvJXPug54xl",
						callbackUrl: "http://localhost:8080/client/member/join",
						isPopup: false, /* 팝업을 통한 연동처리 여부 */
						loginButton: {color: "white", type: 2, height: 40} /* 로그인 버튼의 타입을 지정 */
					}
				);
				
				/* 설정정보를 초기화하고 연동을 준비 */
				naverLogin.init();

				</script>
				<!-- // 네이버아이디로로그인 초기화 Script -->
			
		</div><br /><br /><br />
	</div>
</form><br />
</div><br /><br /><br />
<!-- bottom -->
<jsp:include page="/resources/common/footer.jsp"/>
</body>
</html>