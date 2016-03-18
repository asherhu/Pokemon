<%--
  Created by IntelliJ IDEA.
  User: huhanbo
  Date: 16/3/13
  Time: 下午2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>JsTetris	- javascript tetris	- open source   -sharejs.com </title>
  <meta http-equiv="Content-Type"	content="text/html;	charset=utf-8">
  <link href="css/tetris/tetris.css"	rel="stylesheet" type="text/css">
  <link href="images/tetris/tetris.ico" rel="shortcut icon">
  <script	type="text/javascript" src="js/tetris/tetris.js"></script>
  <style type="text/css">
    html, body { height: 80%; }
    #tetris	{ margin: 0	auto; }
  </style>
</head>
<div style="margin-left: 10px;margin-top: 20px">
  <h1>Welcome ${username}</h1>
</div>
<table style="width: 100%; height: 100%;" cellspacing="0" cellpadding="0"><tr><td style="vertical-align: middle;">
  <div id="tetris">
    <div class="left">
      <h1>Js Tetris</h1>
      <div class="menu">
        <div><a href="javascript:void(0)" id="tetris-menu-start">New Game</a></div>
        <div><a href="javascript:void(0)" id="tetris-menu-reset">Reset</a></div>
        <div><a href="javascript:void(0)" id="tetris-menu-highscores">Highscores</a></div>
        <div><a href="javascript:void(0)" id="tetris-menu-help">Pause/Resume</a></div>
        <%--<div><a href="javascript:void(0)" id="tetris-menu-pause">Pause</a></div>--%>
      </div>
      <div id="tetris-nextpuzzle"></div>
      <div id="tetris-gameover">Game Over</div>
      <div id="tetris-gamepause">Game Pause</div>
      <div id="tetris-keys">
        <div class="h5">Keyboard:</div>
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td>Rotate:</td>
            <td></td>
            <td><img src="images/tetris/key-up.gif" width="14" height="14" alt=""></td>
            <td></td>
          </tr>
          <tr>
            <td>Move:</td>
            <td><img src="images/tetris/key-left.gif" width="14" height="14" alt=""></td>
            <td><img src="images/tetris/key-down.gif" width="14" height="14" alt=""></td>
            <td><img src="images/tetris/key-right.gif" width="14" height="14" alt=""></td>
          </tr>
          <tr>
            <td>Fall:</td>
            <td colspan="3">
              <img src="images/tetris/key-space.gif" width="44" height="13" alt="">
            </td>
          </tr>
        </table>
      </div>
      <div class="stats">
        <div class="h5">Statistics:</div>
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td	class="level">Level:</td>
            <td><span id="tetris-stats-level">1</span></td>
          </tr>
          <tr>
            <td	class="score">Score:</td>
            <td><span id="tetris-stats-score">0</span></td>
          </tr>
          <tr>
            <td	class="lines">Lines:</td>
            <td><span id="tetris-stats-lines">0</span></td>
          </tr>
          <tr>
            <td	class="apm">APM:</td>
            <td><span id="tetris-stats-apm">0</span></td>
          </tr>
          <tr>
            <td	class="time">Time:</td>
            <td><span id="tetris-stats-time">0</span></td>
          </tr>

        </table>
      </div>
    </div>
    <div class="left-border"></div>
    <div id="tetris-area">
      <div class="grid1"></div>
      <div class="grid2"></div>
      <div class="grid3"></div>
      <div class="grid4"></div>
      <div class="grid5"></div>
      <div class="grid6"></div>
    </div>
    <div id="tetris-help" class="window">
      <div class="top">
        About
        <span id="tetris-help-close" class="close">x</span>
      </div>
      <div class="content" style="margin-top:	1em;">
        <div style="margin-top:	1em;">
          <div>JsTetris is a highly customizable tetris game written in javascript,
            full sources available, it is free to modify.
          </div>
          <br>
          <div></div>
          <div></div>
          <br>
          <div></div>
        </div>
      </div>
    </div>
    <div id="tetris-highscores"	class="window">
      <div class="top">
        Highscores <span id="tetris-highscores-close" class="close">x</span>
      </div>
      <div class="content">
        <div id="tetris-highscores-content"></div>
        <br>
        Note: these	scores are kept	in cookies,	they are only visible to your computer.
      </div>
    </div>
  </div>

</td></tr></table>


<script	type="text/javascript">
  var   username="${username}";
  var	tetris = new Tetris();
  tetris.unit	= 14;
  tetris.areaX = 12;
  tetris.areaY = 22;


//  document.onkeydown=function(event){
//    var e = event || window.event || arguments.callee.caller.arguments[0];
//    e.keyCode=40;
//    alert(e.keyCode);
//    if(e && e.keyCode==38 || e && e.keyCode==37){//上,左
//       alert('38=上键，37=左键');
//    }
//
//    if(e && e.keyCode==40 || e && e.keyCode==39){//下,右
//      alert('38=下键，37=右键');
//    }
//  };

</script>

</body>
</html>
