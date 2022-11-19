<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.music.common.*,java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%
    String filename="";
    int sizeLimit = 15*1024*1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit,"utf-8",new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");
%>

파일명 : <%=filename%><br/>
<img src = "${pageContext.request.contextPath}/upload/<%=filename%>">
