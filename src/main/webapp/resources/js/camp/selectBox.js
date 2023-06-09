//select box 연동

//지역데이터(key, value)
//(시/도, 시/군/구)의 형태
const area = {
    서울시: [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", 
                "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
    부산시: [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ],
    대구시: [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
    인천시: [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ],
    광주시: [ "광산구", "남구", "동구", "북구", "서구" ],
    대전시: [ "대덕구", "동구", "서구", "유성구", "중구" ],
    울산시: [ "남구", "동구", "북구", "중구", "울주군" ],
    세종시: [ "세종시" ],
    경기도: [ "수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시", "안산시", "고양시", "과천시", "구리시", "남양주시", "오산시", "시흥시", 
                "군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군" ],
    강원도: [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", 
                "인제군", "고성군", "양양군" ],
    충청북도: [ "청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
    충청남도: [ "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ],
    전라북도: [ "전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ],
    전라남도: [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", 
                "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ],
    경상북도: [ "포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", 
                "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군" ],
    경상남도: [ "창원시", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", 
                "함양군", "거창군", "합천군" ],
    제주도: [ "서귀포시", "제주시" ]	
};

//$(function(){});는 DOM 객체가 준비되면.... 이라는 뜻
$(function() {
    //아래 function init 실행
    init();

    //중분류(doName) 이벤트 위임 - 값의 변경(change)
    $(document).on('change', 'select[name=doName]', function() {
        let classVal = $(this).val();

        //doName값이 0이 됐을 때
        if(classVal==0){
            $('#addressInput').val('');
            $('#addressInput').prop('style', 'background-color:bisque;');
            $('#addressInput').prop('readonly', true);
            $('#addressInput').prop('placeholder', '시/도, 시/군/구를 먼저 선택하세요');
        }

        //doName값이 0이 아닐 때
        $('select[name=sigunguName] option').each(function(idx, item) {
            //소분류(sigunguName)의 'data-class' 속성 값 확인, 일치시 보여줌
            if($(this).data('class') == classVal || $(this).val() == '0') {
                $(this).show();
            }else {
                $(this).hide();
            }
        });
        $('select[name=sigunguName]').val('0');

        //doName을 변경해서 sigunguName이 변경되는 경우
        if($('select[name=sigunguName]').val()==0){
            $('#addressInput').val('');
            $('#addressInput').prop('style', 'background-color:bisque;');
            $('#addressInput').prop('readonly', true);
            $('#addressInput').prop('placeholder', '시/도, 시/군/구를 먼저 선택하세요');
        }
    })
});

//초기화, Selectbox option 생성
function init() {
    let doHtml = '<option value="0">시/도</option>'; 
    let sigunguHtml = '<option value="0">시/군/구</option>'; 

    //key가 중분류(doName), value가 소분류(sigunguName)
    for (let key in area) {
        //doName옵션 생성
        doHtml += `<option value="${key}">${key}</option>`;

        let list = area[key];
        for (let i=0; i<list.length; i++) {
            //sigunguName옵션 생성, data-class속성에 중분류값 입력
            sigunguHtml += `<option value="${list[i]}" data-class="${key}">${list[i]}</option>`;
        }
    }
    $('select[name=doName]').html(doHtml);
    $('select[name=sigunguName]').html(sigunguHtml);

    //소분류(sigunguName) 항목은 초기화때 숨기기
    $('select[name=sigunguName] option').each(function(idx, item) {
        if ($(this).val() == '0') return true;
        $(this).hide();
    });
}