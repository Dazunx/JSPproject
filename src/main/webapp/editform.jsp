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
	MusicDAO boardDAO = new MusicDAO();
	String id=request.getParameter("id");	
	MusicVO u=boardDAO.getMusic(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>음악 정보 수정</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sid" value="${vo.getSid()}"/>
	<table>
		<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
		<tr><td>Artist:</td><td><input type="text" name="writer" value="<%= u.getArtist()%>" /></td></tr>
		<tr><td>Album:</td><td><textarea cols="50" rows="5" name="content"><%= u.getAlbum()%></textarea></td></tr>
		<tr><td>Photo</td><td>input type="file" name="photo" value="${vo.getPhoto()}" />
			<c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contestPath}/upload/${vo.getPhoto()}" class="photo"></c:if>c:if></tr>
	</table>
			<button type="button" value="Cancel" onclick="history.back()"/>뒤로 가기</button>
			<button type="submit">회원정보 수정</button>
	</form>
</body>
</html>