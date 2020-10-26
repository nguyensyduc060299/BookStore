<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <link rel="stylesheet" href="/css/account.css">
</head>
<body >
<%@ include file="../common/header.jsp" %>
<div class="tiki-account chrome">

    <div class="breadcrumb-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="/">Trang chủ</a></li>
                        <li class="active">Quản lý trang web</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>		<!-- end breadcumb-wrap -->

    <div class="wrap">
        <div class="container-full">
            <div class="row-style-1">

                <%@ include file="common/menu-left.jsp" %>


                <div class="content-right">
                    <h1 class="have-margin" style="padding-bottom:5px">Thêm User </h1>
                    <div class="account-profile register-form">
                        <form:form action="${pageContext.request.contextPath }/admin/user-manage/add"
                                   modelAttribute="user1" method="POST">
                            <c:if test="${bindingError != null}">
                                <div class="form-group error">
                                        ${bindingError}
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label class="control-label" for="firstName">Họ </label>
                                <div class="input-wrap">
                                    <form:input path="firstName" class="form-control" id="firstName" placeholder="Họ......"></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="lastName">Tên </label>
                                <div class="input-wrap">
                                    <form:input path="lastName" class="form-control" id="lastName" placeholder="Tên......."></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="userName">Tên đăng nhập </label>
                                <div class="input-wrap">
                                    <form:input path="userName" class="form-control" id="userName" ></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="password">Password </label>
                                <div class="input-wrap">
                                    <form:input path="password" type="password" class="form-control" id="password" ></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="email">Email </label>
                                <div class="input-wrap">
                                    <form:input path="email" class="form-control" id="email" placeholder="Email........."></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="phoneNumber">Phone </label>
                                <div class="input-wrap">
                                    <form:input path="phoneNumber" class="form-control" id="phoneNumber" placeholder="Số điện thoại........."></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="role">Phân quyền </label>
                                <div class="input-wrap">
                                    <form:input class="form-control" type="text" path="role" list="roleList" placeholder="Phân quyền..."></form:input>
                                    <datalist id="roleList">
                                        <c:forEach items="${roles}" var="role">
                                        <option value="${role}">
                                            </c:forEach>
                                    </datalist>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrap margin">
                                    <button type="submit" class="btn btn-info btn-block btn-update">
                                        Thêm mới
                                    </button>
                                </div>
                            </div>

                        </form:form>
                    </div>

                    <div class="list-pager">

                    </div>
                </div>
            </div>
        </div>
    </div>		<!--end wrap:content-right  -->

</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>



