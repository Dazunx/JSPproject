<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.music.dao.MusicDAO"%>
<%@ page import="com.music.common.FileUpload"%>
<%@ page import="com.music.vo.MusicVO" %>

<%
	request.setCharacterEncoding("utf-8");
	MusicDAO musicDAO = new MusicDAO();
	FileUpload upload = new FileUpload();
	MusicVO u = upload.uploadPhoto(request);

	int i = musicDAO.insertMusic(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>