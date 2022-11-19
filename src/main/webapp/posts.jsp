<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.music.dao.MusicDAO, com.music.vo.MusicVO,java.util.*"%>
<%@ page import="com.music.dao.MusicDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Playlist</title>
	<style>
		/* Remove the navbar's default margin-bottom and rounded borders */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
		}

		/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
		.row.content {height: 450px}

		/* Set gray background color and 100% height */
		.sidenav {
			padding-top: 20px;
			background-color: #f1f1f1;
			height: 100%;
		}

		/* Set black background color, white text and some padding */
		footer {
			background-color: #555;
			color: white;
			padding: 15px;
		}

		/* On small screens, set height to 'auto' for sidenav and grid */
		@media screen and (max-width: 767px) {
			.sidenav {
				height: auto;
				padding: 15px;
			}
			.row.content {height:auto;}
		}

		#list {
		  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 80%;
			place-items: center
		}
		#list td, #list th {
		  border: 1px solid #ddd;
		  padding: 8px;
		  text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list tr:hover {background-color: #ddd;}
		#list th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: center;
		  background-color: #808080;
		  color: white;
		}
	</style>
	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deletepost.jsp?id=' + id;
		}
	</script>
</head>

<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Melon</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">My Playlist</a></li>
				<li><a href="#">Genre</a></li>
				<li><a href="#">Top 100</a></li>
				<li><a href="#">Search</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
</nav>

<h1>My PlayList</h1>
<p>자신의 취향대로 플레이리스트를 만들어 보세요.</p>
<hr>
<h3>Playlist 1</h3>

<%
	MusicDAO musicDAO = new MusicDAO();
	List<MusicVO> list = musicDAO.getMusicList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>Id</th>
	<th>Title</th>
	<th>Artist</th>
	<th>Album</th>
	<th>Genre</th>
	<th>chart</th>
	<th>Photo</th>
	<th>Regdate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSid()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getArtist()}</td>
		<td>${u.getAlbum()}</td>
		<td>${u.getGenre()}</td>
		<td>${u.getChart()}</td>
		<td><img src = "${pageContext.request.contextPath}/upload/${u.getPhoto()}" height="100" width="90"></td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Music</a>
</body>
</html>