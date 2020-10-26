<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
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
                    <h1 class="have-margin" style="padding-bottom:5px">Thêm Thể loại </h1>
                    <div class="account-profile register-form">
                        <form:form action="${pageContext.request.contextPath }/admin/category-manage/update?id=${category.id}"
                                   modelAttribute="category" method="POST">
                            <c:if test="${bindingError!= null}">
                                <div class="form-group error">
                                        ${bindingError}
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label class="control-label" for="full_name">Tên Thể loại </label>
                                <div class="input-wrap">
                                    <form:input path="name" class="form-control" id="full_name" placeholder="Tên thể loại"></form:input>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrap margin">
                                    <button type="submit" class="btn btn-info btn-block btn-update">
                                        Cập nhật
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



