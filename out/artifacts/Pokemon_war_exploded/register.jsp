<%--
  Created by IntelliJ IDEA.
  User: huhanbo
  Date: 15/12/11
  Time: 下午10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<html>
<head>
    <title>Register</title>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin_login_wrap">
    <h1>注册</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <c:if test="${addfailed=='addfailed'}">
                <div style="color:red" id="isexist">用户名已经存在,请重新注册！</div>
            </c:if>
            <c:if test="${addsuccess=='addsuccess'}">
                <div style="color:red" id="issucccess">注册成功，请返回登陆！</div>
            </c:if>

            <form action="register" id="registerform" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="username">用户名：</label>
                        <input type="text" name="user.username" value="${failedname}" id="username" onkeyup="failedNameCheck()"  size="45" class="admin_input_style" />
                        <div style="display: none;color:red" id="notallow">用户名不许为空！</div>

                    </li>
                    <li>
                        <label for="userpassword">密码：</label>
                        <input type="password" name="user.userpassword" value="" id="userpassword" size="45" class="admin_input_style" />
                        <div style="display: none;color:red" id="passwordnotallow">密码不许为空！</div>
                    </li>
                    <li>
                        <label for="userpasswordconfirm">确认密码：</label>
                        <input type="password" name="userpasswordconfirm" value="" id="userpasswordconfirm" size="45" class="admin_input_style"/>
                        <div style="display: none;color:red" id="ismatch">密码不匹配！</div>
                    </li>
                    <li>
                        <input type="button" onclick="doSave()" tabindex="3" value="提交" class="btn btn-primary" />
                    </li>
                    <li>
                        <a href="login"><input type="button" tabindex="3" value="返回登陆" class="btn btn-primary"/></a>
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>
</body>

<script type="text/javascript">
    function failedNameCheck(){
        var username=document.getElementById("username").value;
        if(username!="${failedname}"){
            document.getElementById("isexist").style.display="none";
        }
    }

    function doSave(){

        var username=document.getElementById("username").value;

        var passwordconfirm=document.getElementById("userpasswordconfirm").value;
        var password=document.getElementById("userpassword").value;
        if(username===""){
            document.getElementById("notallow").style.display="block";

            return;
        }

        if(password==""){

            document.getElementById("passwordnotallow").style.display="block";
            document.getElementById("ismatch").style.display="none";
            return;
        }

        if(passwordconfirm!=password){
            document.getElementById("passwordnotallow").style.display = "none";
            document.getElementById("ismatch").style.display="block";
            return;
        }

        document.getElementById("registerform").submit();
    }
</script>

</html>
