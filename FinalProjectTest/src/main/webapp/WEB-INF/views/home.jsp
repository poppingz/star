<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script>
	$(function() {	
		$("#list").on("click", function() {
			location.href = "/selectAll";
		})
	});
</script>
</head>
<body>
	<a href="CampTip">camp tip</a>
	<a href="selectAll">list</a>
</body>
</html>
