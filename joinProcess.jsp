<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--post parameter 한글처리--%>
<%request.setCharacterEncoding("utf-8"); %>

<%--Member VO javabean 객체 형성 --%>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO" />

<%-- 자바빈 객체에 파라미터값 찾아서 저장하기 --%>
<jsp:setProperty property="*" name="memberVO"/>

<%-- 가입날짜 생성해서 자바빈에 저장 --%>
<% memberVO.setRegDate(new Timestamp(System.currentTimeMillis())); %>

<%-- DAO 객체 준비 --%>
<% MemberDao memberDao=MemberDao.getInstance(); %>

<%--회원가입(추가) 메소드 호출 --%>
<% memberDao.insertMember(memberVO); %>

<%--go to login page --%>
<% //response.sendRedirect("login.jsp"); %>
<script>
alert('회원가입 되었습니다. \ngo to login page');
location.href='login.jsp';
</script>