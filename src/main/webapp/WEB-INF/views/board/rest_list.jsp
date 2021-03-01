<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".a-del").click(function(event) { 
		event.preventDefault(); //prevendDefault()는 href로 연결해 주지 않고 단순히 click에 대한 처리를 하도록 해준다.
		console.log("ajax 호출전"); 
        //해당 tr제거
		console.log("a-del click");

		var tr = $(this).parent().parent();

		$.ajax({
			type : 'DELETE', //method
			url : $(this).attr("href"),  

			cache : false,
			success : function(result) {
				console.log("result: " + result);
				if (result == "SUCCESS") {
					$(tr).remove();
				}
			},
			error : function(e) {
				console.log(e);
			}
		}); //end of ajax
	}); //end of $().click

});
</script>
</head>
<body>

	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
			<td>&nbsp;&nbsp;</td> 
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.bId}</td>
			<td>${vo.bName}</td>
			<td>
				<c:forEach begin="1" end="${vo.bIndent}">-</c:forEach>
				<a id="a-content" href="${pageContext.request.contextPath}/restful/board/${vo.bId}">${vo.bTitle}</a></td>
			<td>${vo.bDate}</td>
			<td>${vo.bHit}</td>
			<td><a class="a-del" href="${pageContext.request.contextPath}/restful/board/${vo.bId}">삭제</a></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="8"> <a href="${pageContext.request.contextPath}/restful/board/write">글작성</a> </td>
		</tr>
	</table>
</body>
</html>