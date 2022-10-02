<%--
  Created by IntelliJ IDEA.
  User: Jungwoo Park
  Date: 9/10/2022
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="${ctx}/memberInsert.do" method="post">
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id" /></td>
        </tr>
        <tr>
            <td>패스워드</td>
            <td><input type="password" name="pass" /></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" /></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><input type="text" name="age" /></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" /></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" /></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="가입" />
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
