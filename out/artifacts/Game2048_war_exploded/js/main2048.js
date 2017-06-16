/**
 * Created by Boss on 2017/6/13.
 */
var board = new Array();
var score = 0;
var top = 240;
var step = 0;
$(document).ready(function (e) {
    newgame();
});

function newgame() {
    //初始化棋盘格
    init();
    //在随机两个各自声称的数字
    generateOneNumber();
    generateOneNumber();
}

function init() {
    score = 0;//初始化积分
    step = 0;//初始化步骤
    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
            var gridCell = $("#grid-cell-" + i + "-" + j);
            gridCell.css("top", getPosTop(i, j));
            gridCell.css("left", getPosLeft(i, j));
        }
    }

    for (var i = 0; i < 4; i++) {//二位数组全部初始化为0
        board[i] = new Array();
        for (var j = 0; j < 4; j++) {
            board[i][j] = 0;
        }
    }

    updateBoardView();//通知前端对board二位数组进行设定。
}

function updateBoardView() {//刷新前端视图

    $(".number-cell").remove();//清除所有样式和内容

    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
            $("#grid-container").append('<div class="number-cell" id="number-cell-' + i + '-' + j + '"></div>');
            var theNumberCell = $('#number-cell-' + i + '-' + j);
            if (board[i][j] == 0) {
                theNumberCell.css('width', '0px');
                theNumberCell.css('height', '0px');
                theNumberCell.css('top', getPosTop(i, j));
                theNumberCell.css('left', getPosLeft(i, j));
            } else {
                theNumberCell.css('width', '100px');
                theNumberCell.css('hegiht', '100px');
                theNumberCell.css('top', getPosTop(i, j));
                theNumberCell.css('left', getPosLeft(i, j));
                //NumberCell覆盖
                theNumberCell.css('background-color', getNumberBackgroundColor(board[i][j]));//返回背景色
                theNumberCell.css('color', getNumberColor(board[i][j]));//返回前景色
                theNumberCell.text(board[i][j]);
            }
        }
    }
    document.getElementById("score").innerText = score;
    document.getElementById("step").innerText = step++;
}

function generateOneNumber() {
    isgameover();
    if (nospace(board))//如果没有空白，返回false
        return false;

    //在4X4的地图里面随机一个获取一个（x, y）坐标
    var randx = parseInt(Math.floor(Math.random() * 4));
    var randy = parseInt(Math.floor(Math.random() * 4));

    while (true) {//直到找到一个空位置才跳出循环，否则继续生成新的xy
        if (board[randx][randy] == 0)
            break;
        randx = parseInt(Math.floor(Math.random() * 4));
        randy = parseInt(Math.floor(Math.random() * 4));
    }
    //随机一个数字 2 或 4
    var randNumber = Math.random() < 0.5 ? 2 : 4;
    //在随机位置显示随机数字
    board[randx][randy] = randNumber;
    showNumberWithAnimation(randx, randy, randNumber);
    return true;//成功生成数字，返回true
}

//事件响应循环
$(document).keydown(function (event) {
    step++;
    switch (event.keyCode) {
        case 37://left
            if (moveLeft()) {
                setTimeout("generateOneNumber()", 220);

            }
            break;
        case 38://up
            if (moveUp()) {
                setTimeout("generateOneNumber()", 220)//每次新增一个数字就可能出现游戏结束
            }
            break;
        case 39://right
            if (moveRight()) {
                setTimeout("generateOneNumber()", 220)//每次新增一个数字就可能出现游戏结束
            }
            break;
        case 40://down
            if (moveDown()) {
                setTimeout("generateOneNumber()", 220)//每次新增一个数字就可能出现游戏结束
            }
            break;
        default:isgameover();
    }
});

function isgameover() {
    if (nomove(board) && nospace(board))
        gameover();
}

function gameover() {////
    alert('GameOver');
}

function moveLeft() {//更多地细节信息
    //判断格子是否能够向左移动
    if (!canMoveLeft(board))
        return false;

    //真正的moveLeft函数//标准
    for (var i = 0; i < 4; i++)
        for (var j = 1; j < 4; j++) {//第一列的数字不可能向左移动
            if (board[i][j] != 0) {
                //(i,j)左侧的元素
                for (var k = 0; k < j; k++) {
                    //落脚位置的是否为空 && 中间没有障碍物
                    if (board[i][k] == 0 && noBlockHorizontal(i, k, j, board)) {
                        //move
                        showMoveAnimation(i, j, i, k);//从(i, j)位置变到(i, k)位置;
                        board[i][k] = board[i][j];//(i,j)的值赋给(i,k)
                        board[i][j] = 0;

                        continue;
                    }
                    //落脚位置的数字和本来的数字相等 && 中间没有障碍物
                    else if (board[i][k] == board[i][j] && noBlockHorizontal(i, k, j, board)) {//k<j
                        //move
                        showMoveAnimation(i, j, i, k);//同上
                        //add
                        board[i][k] += board[i][j];//和x2一个道理
                        board[i][j] = 0;
                        score += 2;//每次合并操作成功一次+2分

                        continue;
                    }
                }
            }
        }
    setTimeout("updateBoardView()", 190);

    return true;
}
function moveRight() {
    //判断格子是否能够向右移动
    if (!canMoveRight(board))//此函数可能存在问题
        return false;

    //真正的moveRight函数//标准
    for (var i = 0; i < 4; i++)
        for (var j = 2; j >= 0; j--) {//第四列的数字不可能向右移动
            if (board[i][j] != 0) {
                //(i,j)右侧的元素
                for (var k = 3; k > j; k--) {//k!=j?????????是的否则自己=自己被187行清零
                    //落脚位置的是否为空 && 中间没有障碍物
                    if (board[i][k] == 0 && noBlockHorizontal(i, j, k, board)) {//j<k
                        //move
                        showMoveAnimation(i, j, i, k);//不用改变，还是从(i,j)位置变到(i,k)位置;
                        board[i][k] = board[i][j];//(i,j)的值赋给(i,k)
                        board[i][j] = 0;

                        continue;
                    }
                    //落脚位置的数字和本来的数字相等 && 中间没有障碍物
                    else if (board[i][k] == board[i][j] && noBlockHorizontal(i, j, k, board)) {
                        //move
                        showMoveAnimation(i, j, i, k);
                        //add
                        board[i][k] += board[i][j];//和x2一个道理
                        board[i][j] = 0;
                        score += 2;//每次合并操作成功一次+2分

                        continue;
                    }
                }
            }
        }
    setTimeout("updateBoardView()", 190);
    return true;
}

function moveDown() {//向下移动
    if (!canMoveDown(board))
        return false;

    //向下移动
    for (var j = 0; j < 4; j++)
        for (var i = 2; i >= 0; i--) {//最后一行 数字不可能向下 移动 //只受i影响
            if (board[i][j] != 0) {
                //(i,j) 下面 的元素
                for (var k = 3; k > i; k--) {
                    //落脚位置的是否为空 && 中间没有障碍物
                    if (board[k][j] == 0 && noBlockVertical(j, i, k, board)) {//i<k 在第j列
                        //move
                        showMoveAnimation(i, j, k, j);//从(i, j)位置变到(k, j)位置;
                        board[k][j] = board[i][j];//(i,j)的值赋给(k,j)
                        board[i][j] = 0;

                        continue;
                    }
                    //落脚位置的数字和本来的数字相等 && 中间没有障碍物
                    else if (board[k][j] == board[i][j] && noBlockVertical(j, i, k, board)) {//i<k
                        //move
                        showMoveAnimation(i, j, k, j);
                        //add
                        board[k][j] += board[i][j];//和x2一个道理
                        board[i][j] = 0;
                        score += 2;//每次合并操作成功一次+2分
                        continue;
                    }
                }
            }
        }
    setTimeout("updateBoardView()", 190);

    return true;
}

function moveUp() {//向上移动
    if (!canMoveUp(board))
        return false;

    //向上移动
    for (var j = 0; j < 4; j++)
        for (var i = 1; i < 4; i++) {//最后一行 数字不可能 向上 移动 //只受i影响
            if (board[i][j] != 0) {
                //(i,j) 下面 的元素
                for (var k = 0; k < i; k++) {
                    //落脚位置的是否为空 && 中间没有障碍物
                    if (board[k][j] == 0 && noBlockVertical(j, k, i, board)) {//k<i 在第j列
                        //move
                        showMoveAnimation(i, j, k, j);//从(i, j)位置变到(k, j)位置;
                        board[k][j] = board[i][j];//(i,j)的值赋给(k,j)
                        board[i][j] = 0;

                        continue;
                    }
                    //落脚位置的数字和本来的数字相等 && 中间没有障碍物
                    else if (board[k][j] == board[i][j] && noBlockVertical(j, k, i, board)) {//k<i
                        //move
                        showMoveAnimation(i, j, k, j);
                        //add
                        board[k][j] += board[i][j];//和x2一个道理
                        board[i][j] = 0;
                        score += 2;//每次合并操作成功一次+2分
                        continue;
                    }
                }
            }
        }
    setTimeout("updateBoardView()", 190);

    return true;
}