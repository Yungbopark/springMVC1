<%@ page import="com.yungbo.park.model.MemberDAO" %>
<%@ page import="com.yungbo.park.model.MemberVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: Jungwoo Park
  Date: 8/29/2022
  Time: 8:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
<%
    MemberDAO dao = new MemberDAO();
    ArrayList<MemberVO> list = dao.memberList();
%>
--%>


<%
    ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
    System.out.println("list = " + list.size());
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            <c:if test="${!empty msg}">
            alert("${msg}");
            /*로그인을 하고나면, 세선 정보 확인하고 msg에 값이 담겨있는지 확인한다*/
            <c:remove var="msg" scope="session"/>
                /*alert 창 띄운 다음에는 msg 를 삭제해야 된다 . 위에서는 msg가 null인지만 체크해서 메시지 띄워주므로.*/
            </c:if>

        });

        function deleteFn(num) {
            location.href = "${ctx}/memberDelete.do?num=" + num;

        }
        function check() {
            if ($('#user_id').val() == '') {
                alert("아이디를 입력하세요.");
                return false;
            }
            if ($('#password').value() == '') {
                alert("비밀번호를 입력하세요");
                return false;
            }
            return true;
        }

        function logout() {
            location.href="<c:url value='/memberLogout.do'/>";
        }
    </script>
</head>
<body>
<div class="container">
    <h2>회원관리 시스템</h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <c:if test="${sessionScope.memberId == null || sessionScope.memberId == ''}">
                <%--session.setAttribute -> 세션으로 setAttribute를 했기 때문에, sessionScope --%>
                <form class="form-inline" action="${ctx}/memberLogin.do" method="post">
                <div class="form-group">
                    <label for="user_id">ID:</label>
                    <input type="user_id" class="form-control" id="user_id" name="user_id">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <button type="submit" class="btn btn-default" onclick="return check()">로그인</button>
            </form>
            </c:if>

            <c:if test="${sessionScope.memberId != null && sessionScope.memberId != ''}">
                ${sessionScope.memberName}님 환영합니다.

                <button type="button" class="btn btn-warning" onclick="logout()">로그아웃</button>
            </c:if>


        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이름</th>
                        <th>나이</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <tr>--%>
                        <c:forEach var="vo" items="${list}">
                            <tr>
                                <td>${vo.num}</td>
                                <td><a href="${ctx}/memberContent.do?num=${vo.num}">
                                        ${vo.id}</a></td>
                                <td>${vo.pass}</td>
                                <td>${vo.name}</td>
                                <td>${vo.age}</td>
                                <td>${vo.email}</td>
                                <td>${vo.phone}</td>
                            <%-- 로그인 했을 때는 자기 것이 삭제되도록 해야 함 --%>
                        <c:if test="${sessionScope.memberId != vo.id}">
                                <td><input type="button" value="삭제" class="btn"
                                   onclick="deleteFn(${vo.num})" disabled></td>
                        </c:if>

                        <c:if test="${sessionScope.memberId == vo.id}">
                                <td><input type="button" value="삭제" class="btn"
                                   onclick="deleteFn(${vo.num})" ></td>
                        </c:if>
                            </tr>
                        </c:forEach>
                            <tr>
                                <td colspan="7" align="right"><input type="button" value="회원가입"
                                                             class="btn" onclick="location.href='${ctx}/memberRegister.do'"></td>
                            </tr>
                    </tbody>
                </table>
            </div>

        </div>
                <div class="panel-footer">회원관리 ERP system(2022)</div>
    </div>
</div>
</body>
</html>
