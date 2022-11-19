<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.music.dao.MusicDAO"%>
<%@page import="com.music.vo.MusicVO"%>
<%@ page import="com.music.common.FileUpload" %>

<%
	request.setCharacterEncoding("utf-8");
	MusicDAO musicDAO = new MusicDAO();
	FileUpload upload = new FileUpload();
	MusicVO u = upload.uploadPhoto(request);

	int i = musicDAO.updateMusic(u);
	String msg = "데이터 수정 성공!";
	if(i==0) msg="[에러] 데이터 수정 실패!";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>