/**
 * Created by Boss on 2017/6/13.
 */
function showNumberWithAnimation(i, j, randNumber) {

    var numberCell = $('#number-cell-' + i + '-' + j);
    numberCell.css("background-color", getNumberBackgroundColor(randNumber));
    numberCell.css("color", getNumberColor(randNumber));
    numberCell.text(randNumber);

    numberCell.animate({
        width : "100px",
        height : "100px",
        top : getPosTop(i, j),
        left : getPosLeft(i, j)
    }, 50);
}

function showMoveAnimation(fromx, fromy, tox, toy){

    var numberCell = $('#number-cell-'+fromx +'-'+fromy);
    numberCell.animate({top:getPosTop(tox,toy),
        left:getPosLeft(tox,toy)},200);
}

function showNumberWithAnimation(i, j, randNumber) {

    var numberCell = $('#number-cell-' + i + '-' + j);//?
    numberCell.css("background-color", getNumberBackgroundColor(randNumber));//设置css方块样式
    numberCell.css("color", getNumberColor(randNumber));//设置css数字样式
    numberCell.text(randNumber);//设置数字内容

    numberCell.animate({
        width : "100px",
        height : "100px",
        top : getPosTop(i, j),
        left : getPosLeft(i, j)
    }, 50);
}

function showMoveAnimation(fromx, fromy, tox, toy){

    var numberCell = $('#number-cell-'+fromx +'-'+fromy);
    numberCell.animate({top:getPosTop(tox,toy),
        left:getPosLeft(tox,toy)},200);
}