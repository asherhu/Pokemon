<%--
  Created by IntelliJ IDEA.
  User: huhanbo
  Date: 16/3/8
  Time: 下午10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <title>My Page</title>
    <link rel="stylesheet" type="text/css" href="/Pokemon/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/Pokemon/css/main.css"/>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="/Pokemon/js/libs/modernizr.min.js"></script>
</head>
<body style="height:100%">
<div class="topbar-wrap white">
    <div class="topbar-inner ">
        <div class="topbar-logo-wrap">
            <ul class="navbar-list">
                <li style="">欢迎 ${user.username}</li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list">
                <li>
                    <a href="register">
                        注册新账号
                    </a>
                </li>
                <li>
                    <a href="useredit">
                        账户设置
                    </a>
                </li>
                <li><a href="logout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div>
    <div class="sidebar-wrap">
        <div class="sidebar-title" style="font-size: 15px;font-weight: bold">
            <a href="main">
                首页
            </a>
        </div>

        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <h2 style="margin-left: 10px;margin-top: 5px;margin-bottom: 5px"><i class="icon-font">&#xe006;</i>口袋妖怪
                    </h2>
                    <ul class="sub-menu">
                        <li><a href="main.jsp" target="">关东图鉴</a></li>
                        <li><a href="main.jsp" target="">成都图鉴</a></li>
                    </ul>
                </li>


            </ul>
        </div>


        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <h2 style="margin-left: 10px;margin-top: 5px;margin-bottom: 5px"><i class="icon-font">&#xe007;</i>游戏
                    </h2>
                    <ul class="sub-menu">
                        <li><a href="jsTetris" target="view_window">俄罗斯方块</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <c:if test="${requestScope.useredit}">
        <div class="main-wrap">
            <div class="" style="margin-left: 30px;padding-top: 30px">
                <span style="font-size: 20px">用户设置:</span>
                <br/>


                <div class="admin_input" style="padding-left: 40px;float: left">
                    <form action="modifyuser" id="modifyuserform" method="post">
                        <c:if test="${requestScope.modifyfailed}">
                            <div style="color:red">
                                    ${test}:用户密码修改失败
                            </div>
                        </c:if>
                        <ul style="line-height: 28px;">
                            <li>
                                <label for="username">用户名：</label>
                                <input type="text" name="user.username" value="${user.username}" id="username"
                                       readonly="true" style="width: 280px" class="admin_input_style"/>
                            </li>
                            <li>
                                <label for="userpassword">密码：</label>
                                <input type="password" name="user.userpassword" value="" id="userpassword"
                                       style="width: 280px" class="admin_input_style"/>

                                <div style="display: none;color:red" id="passwordnotallow">密码不许为空！</div>

                            </li>
                            <li>
                                <label for="userpasswordconfirm">确认密码：</label>
                                <input type="password" name="userpasswordconfirm" value="" id="userpasswordconfirm"
                                       style="width: 280px" class="admin_input_style"/>

                                <div style="display: none;color:red" id="ismatch">密码不匹配！</div>

                            </li>
                            <li style="margin-top: 15px;float: right">
                                <input type="button"
                                       style="width: 120px;height: 30px;align-content: center;line-height: 5px"
                                       value="保存" onclick="doSave()"
                                       class="btn btn-primary"/>
                                <a href="main">
                                    <input type="button"
                                           style="width: 120px;height: 30px;align-content: center;line-height: 5px"
                                           value="返回"
                                           class="btn btn-primary"/>
                                </a>

                            </li>
                        </ul>

                    </form>
                </div>

            </div>
        </div>

    </c:if>

</div>


<script type="text/javascript">
    function doSave() {

        var passwordconfirm = document.getElementById("userpasswordconfirm").value;
        var password = document.getElementById("userpassword").value;

        if (password == "") {
            document.getElementById("passwordnotallow").style.display = "block";
            document.getElementById("ismatch").style.display = "none";

            return;
        }

        if (passwordconfirm != password) {
            document.getElementById("passwordnotallow").style.display = "none";
            document.getElementById("ismatch").style.display = "block";
            return;
        }
        document.getElementById("modifyuserform").submit();

    }
</script>
</body>
</html>
