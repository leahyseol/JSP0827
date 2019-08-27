<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=null;
    //find cookie
    Cookie[] cookies=request.getCookies();
    if(cookies!=null){
    	for(Cookie cookie : cookies){
    		if(cookie.getName().equals("id")){
    			id =cookie.getValue();
    			session.setAttribute("id", id);
    		}
    	}
    }
    //bring session "id"
   id=(String) session.getAttribute("id");
    %>
  <header>
       <div id="login">
       <%
       if(id==null){
    	   %>
    	   <a href="../member/login.jsp">login</a>
    	    <% 
       }else { 
    	 %>
    	 <%=id %>님
    	 <a href="../member/logout.jsp">logout</a>
    	 <% 
       }
       %> 
       | <a href="../member/join.jsp">Join</a>
       </div>
       
        <div class="clear"></div>
        <div id="logo"><a href="../"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></a></div>
        <nav id="top_menu">
            <ul>
                <li><a href="../">HOME</a></li>
                <li><a href="../company/welcome.jsp">COMPANY</a></li>
                <li><a href="#">SOLUTIONS</a></li>
                <li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
                <li><a href="#">CONTACT US</a></li>
            </ul>
        </nav>
    
  </header>