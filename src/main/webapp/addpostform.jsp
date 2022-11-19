<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddPostForm</title>
</head>
<body>

<h1>Add New Music</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
    <table name="playlist">
        <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
        <tr><td>Artist:</td><td><input type="text" name="artist"/></td></tr>
        <tr><td>Album:</td><td><textarea cols="50" rows="5" name="album"></textarea></td></tr>
        <tr><td>Genre:</td><td><input type="text" name="genre"/></td></tr>
        <tr><td>Chart:</td><td><input type="text" name="chart"/></td></tr>
        <tr><td>Photo:</td><td><input type='file' name='photo'></td></tr>
        <tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
    </table>
</form>

</body>
</html>
