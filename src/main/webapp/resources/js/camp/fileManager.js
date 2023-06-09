//campUpdate에서 파일관련 작업 할 JS

let count=0;
let max=0;
let param='files';
let idx=0;


//현재 파일의 갯수 설정함수
function setCount(c){
    count=c;
}

//최대 파일 갯수 조정 함수
function setMax(m){
    max=m;
}

//file의 name 속성명 바꾸기
function setParam(p){
    param=p;
}

//file추가버튼 만들기
$('#fileAdd').click(function(){

    if(count>=max){
        alert('첨부파일은 최대'+max+'개 까지만 가능합니다');
        return;
    }
    count++;

    // 체크박스(대표사진), 삭제버튼(삭제) 이렇게 생기게
//     <div class="input-group-text my-2" id="del'+idx+'">
//     <div class="col-1">
//         <input class="form-check-input titleCheck" type="radio" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
//     </div>
//     <input type="file" class="form-control" name="param">
//     <button type="button" class="dels btn btn-outline-secondary" data-del-idx="del"+idx>파일 삭제</button>
// </div>

// 원본
// let child = '<div class="input-group my-2" id="del'+idx+'">';
// child = child + '<input type="file" class="form-control" name="'+param+'">';
// child = child + '<button type="button" class="dels btn btn-outline-secondary" data-del-idx=del"'+idx+'">파일 삭제</button>';
// child = child + '</div>';

    let child = '<div class="input-group my-2" id="del'+idx+'">';
        child = child + '<input type="file" class="form-control" name="'+param+'">';
        child = child + '<button type="button" class="dels btn btn-outline-secondary" data-del-idx=del"'+idx+'">파일 삭제</button>';
        child = child + '</div>';
        $('#fileList').append(child)
    idx++;
})

//file삭제 버튼 기능
$('#fileList').on('click', '.dels', function(){
    $(this).parent().remove();
    count--;
})

//이미 있는 파일 체크박스로 지우기
$('.deleteCheck').click(function(){
    let result = confirm("정말 파일을 삭제하시겠습니까?\n되돌릴 수 없습니다.");
    let thisEvent = $(this); //ajax 내에서 this를 쓰면 다른 오브젝트가 선택됨. 바깥에서 선언해놓기

    if(result){
        console.log("thisEvent: "+thisEvent);
        let fileNum = $(this).val(); 

        $.ajax({
            type:'POST',
            url:'./campFileDelete',
            data:{
                fileNum:fileNum
            },
            success:function(response){
                if(response.trim()>0){
                    alert("삭제 되었습니다");
                    thisEvent.parent().parent().remove();
                    count--;
                }else{
                    alert("삭제 실패<br> 관리자에게 문의하세요");
                }
            },
            error:function(){

            }
        })
    }else {
        $(this).prop('checked', false);
    }
})
