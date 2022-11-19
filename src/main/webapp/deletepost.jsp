<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.music.vo.MusicVO, com.music.vo.MusicVO"%>
<%@page import="com.music.dao.MusicDAO, com.music.dao.MusicDAO"%>
<%@page import="com.music.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MusicVO u = new MusicVO();
		u.setSid(id);
		MusicDAO musicDAO = new MusicDAO();

		String filename = musicDAO.getPhotoFilename(id);
		if(filename!=null)
			FileUpload.deleteFile(request,filename);
		musicDAO.deleteMusic(u);
	}
	response.sendRedirect("posts.jsp");
%>