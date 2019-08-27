<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//post parameter 한글처리
request.setCharacterEncoding("utf-8");

//bring parameter value
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
//checkbox or radio type : if not select -> null return
String rememberMe=request.getParameter("rememberMe");

//DAO object
MemberDao memberDao=MemberDao.getInstance();
//method call for member check up
int check=memberDao.userCheck(id,passwd);
//check==1 login verification(created session value "id")
//go to index.jsp
//check==0 "wrong passwd" go back
//check==-1 "id is not exist" go back 

if(check==1){
	//login verification
	session.setAttribute("id",id);
	
	//login 상태유지 여부확인
	//cookie 객체 생성해서 응답시 보내기
	if(rememberMe!=null && rememberMe.equals("true")){
		Cookie cookie=new Cookie("id",id);
		cookie.setMaxAge(60*10);//초단위 
		cookie.setPath("/"); //make a cookie path
		response.addCookie(cookie);//응답객체에 싣기
	}
	
	response.sendRedirect("../index.jsp");
	}else if(check==0){
	 %>
	 <script>
	 alert('wrong passwd');
	 history.back();
	 </script>
	 <%
	}else { //check==-1
	%>
	<script>
	alert('not exist');
	history.back();
	</script>
	 <%
}
%>