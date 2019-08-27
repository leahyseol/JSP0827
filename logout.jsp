<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 상태유지용 delete cookie
Cookie[] cookies=request.getCookies();
if(cookies!=null){
	for(Cookie cookie: cookies){
		if(cookie.getName().equals("id")){
			cookie.setMaxAge(0);//쿠키 유효기간 0초로 설정 -> browser delete cookie
			cookie.setPath("/");
			response.addCookie(cookie);
			
		}
	}
}

//session reset
session.invalidate();
//'log out' go to index.jsp

%>
<script>
alert('log out')
location.href='../index.jsp';
</script>