
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="common/head.jsp" %>

</head>
<body>
<%@ include file="common/header.jsp" %>



<!-- Error Page -->
<div class="error-page container-fluid">
	<!-- Container -->
	<div class="container">

		<div class="error-content">
			<p>Đăng ký thành công</p>
			<a href="${pageContext.request.contextPath }/login" title="Login">Đăng nhập ngay nào</a>
		</div>
	</div><!-- Container /- -->
</div><!-- Error Page /- -->

<%@ include file="common/footer.jsp" %>
<%@ include file="common/script.jsp" %>
</body>
</html>