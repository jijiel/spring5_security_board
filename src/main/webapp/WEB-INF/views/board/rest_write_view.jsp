<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	
	 $(document).ready(function(){

			$('#write').submit(function(event) {
				event.preventDefault();
				
				var bName = $("#bName").val();
				var bTitle = $("#bTitle").val();
				var bContent = $("#bContent").val();
				
				var form = {
						
						bName : bName,
						bContent : bContent,
						bTitle : bTitle
				};
				
				$.ajax({
					type : "PUT",
					url : $(this).attr("action"),
					cache : false,
					contentType:'application/json; charset=utf-8',
					data: JSON.stringify(form),
					success : function(result){
						console.log(result);
						if(result == "SUCCESS"){
							console.log("success");
							$(location).attr('href','${pageContext.request.contextPath}/restful/board/');
							
						}
					},
					error : function(e){						
						
						console.log(result);
						console.log(e);
					}										
				});	//ajax			
			});					
		
	   }); // end ready()
	
	</script>
	
	
</head>
<body>

<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form id="write" action="${pageContext.request.contextPath}/restful/board/write" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" id="bName" size = "50"> </td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" id="bTitle" size = "50"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea id="bContent" rows="10" ></textarea> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/restful/board">목록보기</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>