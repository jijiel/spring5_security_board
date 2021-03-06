<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>  
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글보기</title>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
   	$(document).ready(function(){
      $("#updateForm").submit(function(event){         
           event.preventDefault();     
           var bId = $("#bId").val();
           var bName = $("#bName").val();
           var bTitle = $("#bTitle").val();
           var bContent = $("#bContent").val();              
           
           console.log(bName);
           console.log(bTitle);
           console.log(bContent);
           console.log($(this).attr("action"));    
           
           var form = {
                 bId: bId,
                 bName: bName,
                 bContent: bContent,
                 bTitle: bTitle
           };

           $.ajax({
             type : "PUT",
             url : $(this).attr("action"),
             cache : false,
             contentType:'application/json; charset=utf-8', 
             data: JSON.stringify(form),
             beforeSend : function(xhr)
	            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
	         },
             success: function (result) {       
               if(result == "SUCCESS"){
                      
                  $(location).attr('href', '${pageContext.request.contextPath}/restful/board/')                            
               }                       
             },
             error: function (e) {
                 console.log(e);
             }
         })            
       }); // end submit()       
   }); // end ready()
</script>
</head>
<body>

   <table width="500" cellpadding="0" cellspacing="0" border="1">
      <form id="updateForm" action="${pageContext.request.contextPath}/restful/board/${rest_content_view.bId}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" id="bId" value="${rest_content_view.bId}">
         <tr>
            <td> 번호 </td>
            <td> ${rest_content_view.bId} </td>
         </tr>
         <tr>
            <td> 조회수 </td>
            <td> ${rest_content_view.bHit} </td>
         </tr>
         <tr>
            <td> 이름 </td>
            <td> <input type="text" id="bName" value="${rest_content_view.bName}"></td>
         </tr>
         <tr>
            <td> 제목 </td>
            <td> <input type="text" id="bTitle" value="${rest_content_view.bTitle}"></td>
         </tr>
         <tr>
            <td> 내용 </td>
            <td> <textarea rows="10" id="bContent" >${rest_content_view.bContent}</textarea></td>
         </tr>
         <tr >
            <td colspan="2">
	            <input type="submit" value="수정">&nbsp;&nbsp;
	            <a href="${pageContext.request.contextPath}/restful/board">목록보기</a>&nbsp;&nbsp;
	            <a href="#">삭제</a>&nbsp;&nbsp;
	            <a href="${pageContext.request.contextPath}/restful/board/reply/${rest_content_view.bId}">답변</a>
            </td>
         </tr>
      </form>
   </table>
</body>
</html>