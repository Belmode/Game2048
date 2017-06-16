<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>网页版2048</title>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/support2048.js"></script>
    <script type="text/javascript" src="js/showanimation2048.js"></script>
    <script type="text/javascript" src="js/main2048.js"></script>
</head>
<body>
<header>
    <h1>2048</h1>
    <a href="javascript:newgame();" id="newgamebutton">New Game</a>
    <p>
    <form action="upscore.jsp" method="post" onsubmit="getScore()">
        score:<span id="score" class="label label-info">0</span>
        step:<span id="step" class="label label-warning">0</span>
        <input type="hidden" id="h" name="H">
        <input type="submit" id="submit" name="submit" value="上传分数" class="btn-success">
    </form>
    <a href="showscore.jsp" id="showlink">查看排行榜</a>
    </p>
</header>
<div id="grid-container">
    <div class="grid-cell" id="grid-cell-0-0"></div>
    <div class="grid-cell" id="grid-cell-0-1"></div>
    <div class="grid-cell" id="grid-cell-0-2"></div>
    <div class="grid-cell" id="grid-cell-0-3"></div>

    <div class="grid-cell" id="grid-cell-1-0"></div>
    <div class="grid-cell" id="grid-cell-1-1"></div>
    <div class="grid-cell" id="grid-cell-1-2"></div>
    <div class="grid-cell" id="grid-cell-1-3"></div>

    <div class="grid-cell" id="grid-cell-2-0"></div>
    <div class="grid-cell" id="grid-cell-2-1"></div>
    <div class="grid-cell" id="grid-cell-2-2"></div>
    <div class="grid-cell" id="grid-cell-2-3"></div>

    <div class="grid-cell" id="grid-cell-3-0"></div>
    <div class="grid-cell" id="grid-cell-3-1"></div>
    <div class="grid-cell" id="grid-cell-3-2"></div>
    <div class="grid-cell" id="grid-cell-3-3"></div>
</div>
<script>
    function getScore() {
        var score = $("#score").html();//JQuery获取span属性的值
        var hide = document.getElementById('h');
        hide.value = score;//将值赋予上传按钮控件
    }

</script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>