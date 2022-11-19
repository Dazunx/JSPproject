<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="com.music.dao.MusicDAO, com.music.vo.MusicVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>플레이리스트 정보수정</title>
</head>
<body>

<%
	MusicDAO musicDAO = new MusicDAO();
	String id=request.getParameter("id");	
	MusicVO u=musicDAO.getMusic(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>음악 정보 수정</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sid" value="<%=u.getSid()%>"/>
	<table>
		<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
		<tr><td>Artist:</td><td><input type="text" name="artist" value="<%= u.getArtist()%>"/></td></tr>
		<tr><td>Album:</td><td><input type="text" name="album" value="<%= u.getAlbum()%>"/></td></tr>
		<tr><td>Genre:</td><td><input type="text" name="genre" value="<%= u.getGenre()%>"/></td></tr>
		<tr><td>Chart:</td><td><input type="text" name="chart" value="<%= u.getChart()%>"/></td></tr>
		<tr><td>Photo</td><td><input type="file" name="photo" ></tr>
		<c:if test="${vo.getPhoto() ne ''}"><br />
			<img src = "${pageContext.request.contextPath}/upload/${vo.getPhoto()}" height="100" width="90" class="photo"></c:if>
	</table>
			<tr><td colspan="2"><input type="submit" value="Edit Post">회원정보 수정
			<input type="button" value="Cancel" onclick="history.back()"/>뒤로 가기</td></tr>
	</form>
</body>
</html>