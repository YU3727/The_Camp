let num = 0;
// let boardName = $('#boardName').attr('data-board-name');
let boardId = 0;

function setBoardId(bi) {
    boardId = Number(bi);
}



$('#storyList').on('click', '.btnToggle', function(){

    if($('#boardMenu'+$(this).attr('data-board-num')).is(':visible')) {
        $('.boardMenu').slideUp();
    }
    else {
        $('.boardMenu').hide();
        $('#boardMenu'+$(this).attr('data-board-num')).slideDown();
    }
})

$('#storyList').on('click', '.delete', function(){
    let check = window.confirm("삭제하시겠습니까?");

    if(check) {
        num = $(this).attr("data-board-num");

        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                num : num
            },
            success : function(response){
                if(response.trim() > 0) {
                    alert('글이 삭제되었습니다')
                    location.href = "./list"
                }
                else {
                    alert("삭제 실패");
                }
                    
            }
        })
    }
})

$('#storyList').on('click','.update', function(){
    
    num = $(this).attr('data-board-num');

    location.href="./update?num="+num;
})

$('#storyList').on('click', '.report', function(){
    num = $(this).attr('data-board-num');
    let reportedUser = $(this).attr('data-board-writer');
    let reportedContents = $('#contents'+num).text();
    reportAdd(num, boardId, reportedUser, reportedContents);
    
})

$('#storyList').on('click', '.btn-close', function(){
    num = $(this).attr('data-board-num');

    getCommentCount(num);
})

function getCommentCount(n) {

    $.ajax({
        url : '../'+boardName+'Comment/listCount',
        type : 'GET',
        data : {
            num : n,
        },
        success : function(data){
            $('#getDetail'+n).text('댓글' + data.trim() + '개 모두 보기');

        }
    })
}







