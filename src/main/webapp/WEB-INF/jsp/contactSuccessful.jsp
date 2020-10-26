<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="common/head.jsp" %>

</head>
<body>
	<%@ include file="common/header.jsp" %>
			<div class="error-page container-fluid">
				<div class="container">
					<div class="error-content">
						<p><span></span> Cảm ơn <span style="font-style:italic"> ${customerName }</span> đã đóng góp ý kiến</p>
						<a href="${pageContext.request.contextPath }/" title="Back to home">Quay lại trang chủ</a>
					</div>
				</div>
			</div>

	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>