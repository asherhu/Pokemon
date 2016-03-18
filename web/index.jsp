<%--
  Created by IntelliJ IDEA.
  User: huhanbo
  Date: 15/12/8
  Time: 下午7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>Login</title>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css"/>
</head>

<%--<% request.setAttribute("sss","sss"); %>--%>
<script type="text/javascript">
    <%--alert(1);--%>
    <%--var a='<%=request.getAttribute("sss")%>';--%>
    <%--alert(a);--%>
</script>


<body>
<%--<a href="login.action">LOGIN!</a>--%>
<div class="admin_login_wrap">
    <h1>登陆</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <c:if test="${user_status=='user_password_error'}">
                <div style="color:red" id="">用户名密码错误！</div>
            </c:if>
            <c:if test="${user_status=='user_name_error'}">
                <div style="color:red" id="">用户名不存在！</div>
            </c:if>
            <form action="login" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">用户名：</label>
                        <input type="text" name="user.username" value="${username}" id="user" size="45" class="admin_input_style"/>
                    </li>
                    <li>
                        <label for="pwd">密码：</label>
                        <input type="password" name="user.userpassword" value="" id="pwd" size="45"
                               class="admin_input_style"/>
                    </li>
                    <li>
                        <input type="submit" tabindex="3" value="登陆" class="btn btn-primary"/>
                    </li>
                    <li>
                        <a href="register"><input type="button" tabindex="3" value="注册" class="btn btn-primary"/></a>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>
