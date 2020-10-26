<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <link rel="stylesheet" href="/css/account.css">
</head>
<body>
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
    </div>        <!-- end breadcumb-wrap -->

    <div class="wrap">
        <div class="container-full">
            <div class="row-style-1">

                <%@ include file="common/menu-left.jsp" %>


                <div class="content-right">
                    <div>
                        <form:form action="${pageContext.request.contextPath }/admin/book-manage"
                                   method="GET">
                            <div class="form-group">
                                <div class="input-wrap">
                                        <%--											<form:input path="bookName" class="form-control" id="full_name" placeholder="Tên sách muốn thêm"></form:input>--%>
                                    <input name="bookName"  class="form-control" placeholder="Tên sách muốn tìm....">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrap">
                                        <%--											<form:input class="form-control" type="text" path="publisher" list="publisherList" placeholder="Nhà xuất bản ..."></form:input>--%>
                                    <input name="publisher" class="form-control" placeholder="Nhà xuất bản....">
                                    <datalist id="publisherList">
                                        <c:forEach items="${publishers }" var="publisher">
                                        <option value="${publisher.name }">
                                            </c:forEach>
                                    </datalist>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrap">
                                        <%--                                    <form:input class="form-control" type="text" path="category" list="categoryList"--%>
                                        <%--                                                placeholder="Thể loại sách ..."></form:input>--%>
                                    <input name="category" class="form-control" placeholder="Thể loại.....">
                                    <datalist id="categoryList">
                                        <option value="Chưa xác định thể loại">
                                            <c:forEach items="${categories}" var="category">
                                        <option value="${category.name}">
                                            </c:forEach>
                                    </datalist>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrap margin col-md-3">
                                    <button type="submit" class="btn btn-info btn-block btn-update">
                                        Tìm kiếm
                                    </button>
                                </div>
                            </div>
                        </form:form>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="${pageContext.request.contextPath }/admin/book-manage?bookName=&category=&publisher=">
                                <button type="button" class="btn btn-secondary">Reset</button>
                            </a>
                            <a href="${pageContext.request.contextPath }/admin/book-manage/add">
                                <button type="button" class="btn btn-secondary">Thêm sách</button>
                            </a>
                        </div>
                    </div>
                    <h1 class="have-margin" style="padding-bottom:5px">Danh sách có ${totalBook} sách </h1>

                    <div class="dashboard-order have-margin">
                        <table class="table-responsive-2 list">
                            <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sách</th>
                                <th>Tác giả</th>
                                <th>Thể loại</th>
                                <th>Giá tiền</th>
                                <th>Số lượng</th>
                                <th>Tùy chọn</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${books }" var="theBook">
                                <tr>
                                    <td>
                                        <img src="${theBook.image}"/>
                                    </td>
                                    <td>${theBook.name}</td>
                                    <td>${theBook.author}</td>
                                    <td>${theBook.category }</td>
                                    <td>${theBook.price }&nbsp;₫</td>
                                    <td>${theBook.totalInStock }</td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <a href="${pageContext.request.contextPath }/admin/book-manage/update?id=${theBook.id}">
                                                <button type="button" class="btn btn-secondary">Sửa</button>
                                            </a>
                                            <a href="${pageContext.request.contextPath }/admin/book-manage/delete?id=${theBook.id}">
                                                <button type="button" class="btn btn-primary">Xóa</button>
                                            </a>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>

                    <div class="list-pager">

                    </div>
                </div>
            </div>
        </div>
    </div>        <!--end wrap:content-right  -->

</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>



