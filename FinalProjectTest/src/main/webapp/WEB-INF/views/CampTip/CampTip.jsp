<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Camp Tip</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/jquery.multiscroll.js"></script>
<link rel="stylesheet" type="text/css"
	href="/css/jquery.multiscroll.css" />
<link rel="stylesheet" type="text/css" href="/css/examples.css" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script>
	$(function() {	
		$('#myContainer').multiscroll({
			sectionsColor : [ '#ffffff', '#ffffff', '#ffffff', '#ffffff' ],
			anchors : [ 'first', 'second', 'third', 'fourth' ],
			menu : '#menu',
			css3 : true,
			paddingTop : '70px',
			paddingBottom : '70px'
		});
		$(".write").on("click", function() {
			location.href = "/CampTipBoard/write";
		})
	});
</script>
<style>
/* Fixed header and footer.
		* --------------------------------------- */
#header, #footer {
	position: fixed;
	height: 50px;
	display: block;
	width: 100%;
	background: #333;
	z-index: 9;
	text-align: center;
	color: #f2f2f2;
	padding: 20px 0 0 0;
}

#header {
	top: 0px;
}

#footer {
	bottom: 0px;
}

#menu {
	top: -6px;
}

.logo>img {
	width: 150px;
	height: 75px;
}
</style>
</head>

<body>

	<div id="header">Header</div>
	<div id="footer">Footer</div>

	<ul id="menu">
		<li data-menuanchor="first"><a href="#first">봄</a></li>
		<li data-menuanchor="second"><a href="#second">여름</a></li>
		<li data-menuanchor="third"><a href="#third">가을</a></li>
		<li data-menuanchor="fourth"><a href="#fourth">겨울</a></li>
	</ul>

	<div id="myContainer">

		<div class="ms-left">
			<div class="ms-section" id="left1">
				<h1>봄 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left2">
				<h1>여름 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left3">
				<h1>가을 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left4">
				<h1>겨울 캠핑 장단점</h1>
			</div>
		</div>

		<div class="ms-right">
			<div class="ms-section" id="right1">
				<div class="container">
					<div class="logo">
						<img src="/img/logo.png">
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">글번호</div>
								<div class="col-4">제목</div>
								<div class="col-2">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>

							<c:forEach var="i" items="${list}">
								<div class="row boardlist">
									<div class="col-2">${i.campTip_num}</div>
									<div class="col-4" id="titleMove">
										<a href="CampTipBoard/detail?campTip_num=${i.campTip_num}&category=${i.category}">${i.title}</a>
									</div>
									<div class="col-2">${i.writer}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-2">${i.view_count}</div>
								</div>
							</c:forEach>

							<div id="boardlist">
								<br>
<%-- 								<nav aria-label="Page navigation example" class="page_nav">
									<ul class="pagination justify-content-center">
										<c:forEach var="w" items="${navi}" varStatus="s">

											<!-- c:forEach var="i" begin="0" end="10" step="1" 같은 것. -->
											<c:choose>
												<c:when test="${w == '>'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index-1]+1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:when test="${w == '<'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index+1]-1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${w}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:otherwise>
											</c:choose>

											<!-- boolean으로 값이 마지막일 경우에만. true가 됩니다. -->
										</c:forEach>
									</ul>
								</nav> --%>
							</div>

							<div class="row btns">
								<div class="col-12 btns" align="right">
									<br>
									<button type="button" class="btn btn-outline-secondary"
										id="back">뒤로가기</button>
									<button type="button" class="btn btn-outline-secondary write"
										id="write">글 쓰기</button>
								</div>
							</div>

							<div class="search_box">
								<br>
								<form action="${pageContext.request.contextPath}/select.board"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="category1" id="srch_item">
												<option value="">선택해주세요</option>
												<option value="nickname">작성자</option>
												<option value="title">제목</option>
												<option value="contents">내용</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value="">
											<c:choose>
												<c:when test="${param.category == 1 }">
													<input type="hidden" name="category" value="1">
												</c:when>
												<c:when test="${param.category == 2 }">
													<input type="hidden" name="category" value="2">
												</c:when>
												<c:otherwise>
													<input type="hidden" name="category" value="3">
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="cpage" value="1">
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-dark mb-2 w-100"
												id="btn_srch">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ms-section" id="right2">

			</div>
			<div class="ms-section" id="right3">

			</div>
			<div class="ms-section" id="right4">

			</div>
		</div>
	</div>
</body>

</html>