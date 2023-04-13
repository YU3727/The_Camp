//SELECTOR
const id = document.getElementById("id");
const idResult = document.getElementById("idResult");

const pw = document.getElementById("pw");
const pwResult = document.getElementById("pwResult");

const pwCheck = document.getElementById("pwCheck");
const pwCheckResult = document.getElementById("pwCheckResult");

const na = document.getElementById("name");
const nameResult = document.getElementById("nameResult");

const phone = document.getElementById("phone");
const phoneResult = document.getElementById("phoneResult");

const addr = document.getElementById("addr");
const addrResult = document.getElementById("addrResult");

const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");

const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

// let idCheck = false;
// let pwLengthCheck = false;
// let pwNullCheck = false;
// let pwEqualCheck = false;

let checks = [false, false, false, false, false, false, false, false]
//id 검증
id.addEventListener("keyup", function(){
    //중복 검사
    let xhttp = new XMLHttpRequest();

    //url, method
    xhttp.open("POST", "./memberIdCheck");

    //header
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //요청 발생 post일 경우 parameter 전송
    xhttp.send("id=" + id.value);


    //응답 처리
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText.trim() == 'true'){
                idResult.innerHTML = '사용 가능한 아이디 입니다.';
                checks[0] = true;
                idResult.classList.add("blueResult");
                idResult.classList.remove("redResult");
            }
            else{
                idResult.innerHTML = '중복 아이디 입니다.';
                checks[0] = false;
                idResult.classList.add("redResult");
                idResult.classList.remove("blueResult");
            }
        }
        
    })
});

id.addEventListener("blur", function(){
    if(id.value.length != 0){
        
        checks[0] = true;
      
    }
    else{
        idResult.innerHTML = '아이디는 필수 입력';
        checks[0] = false;
        idResult.classList.add("redResult");
        idResult.classList.remove("blueResult");
        
    }
})


pw.addEventListener("keyup", function(){
    if(pw.value.length > 5 && pw.value.length < 13){
        pwResult.innerHTML = '정상 비밀번호 입니다.';
        // pwLengthCheck = true;
        checks[1] = true;
        pwResult.classList.add("blueResult");
        pwResult.classList.remove("redResult");
       
    }
    else{
        pwResult.innerHTML = '비밀번호은 6글자 이상 12자 이하';
        checks[1] = false;
        pwResult.classList.add("redResult");
        pwResult.classList.remove("blueResult");
    }
   
})

pw.addEventListener("blur", function(){
    if(pw.value.length != 0){
        // pwNullCheck = true;
        checks[2] = true;
      
    }
    else{
        pwResult.innerHTML = '비밀번호는 필수 입력';
        checks[2] = false;
        pwResult.classList.add("redResult");
        pwResult.classList.remove("blueResult");
        
    }
   
})

pw.addEventListener("change", function(){
    checks[3] = false;
    pwCheck.value = '';
    pwCheckResult.innerHTML = '비밀번호 불일치 입니다.';
    pwResult.classList.add("redResult");
   
})

pwCheck.addEventListener("blur", function(){
    if(pwCheck.value == pw.value){
        pwCheckResult.innerHTML = "동일한 비밀번호 입니다.";
        // pwEqualCheck = true;
        checks[3] = true;
        pwCheckResult.classList.add("blueResult");
        pwCheckResult.classList.remove("redResult");
        
    }
    else{
        pwCheckResult.innerHTML = "불일치 비밀번호 입니다.";
        checks[3] = false;
        pwCheckResult.classList.add("redResult");
        pwCheckResult.classList.remove("blueResult");
    }
    
})

na.addEventListener("blur", function(){
    if(na.value.length != 0){
        nameResult.innerHTML = "";
        checks[4] = true;
    }
    else{
        nameResult.innerHTML = "이름은 필수  입니다";
        checks[4] = false;
        nameResult.classList.add("redResult");
        nameResult.classList.remove("blueResult");
    }
   
})
na.addEventListener("focus", function(){
    if(na.value.length != 0){
        checks[4] = true;
        nameResult.classList.add("blueResult");
        nameResult.classList.remove("redResult");
    }
})

phone.addEventListener("blur", function(){
    if(phone.value.length != 0){
        phoneResult.innerHTML = "";
        checks[5] = true;
    }
    else{
        phoneResult.innerHTML = "전화번호는 필수  입니다";
        checks[5] = false;
        phoneResult.classList.add("redResult");
        phoneResult.classList.remove("blueResult");
    }
    
})

addr.addEventListener("blur", function(){
    if(addr.value.length != 0){
        addrResult.innerHTML ="";
        checks[6] = true;
    }
    else{
        addrResult.innerHTML = "주소는 필수  입니다";
        checks[6] = false;
        addrResult.classList.add("redResult");
        addrResult.classList.remove("blueResult");
    }
    
})

email.addEventListener("keyup", function(){
    let xhttp = new XMLHttpRequest();

    //url, method
    xhttp.open("POST", "./memberEmailCheck");

    //header
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //요청 발생 post일 경우 parameter 전송
    xhttp.send("email=" + email.value);

    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText.trim() == 'true'){
                emailResult.innerHTML = '사용 가능한 이메일 입니다.';
                checks[7] = true;
                emailResult.classList.add("blueResult");
                emailResult.classList.remove("redResult");
            }
            else{
                emailResult.innerHTML = '중복 이메일 입니다.';
                checks[7] = false;
                emailResult.classList.add("redResult");
                emailResult.classList.remove("blueResult");
            }
        }
        
    })
})
    email.addEventListener("keyup", function(){
    if(email.value.length != 0){
        emailResult.innerHTML =""
       checks[7] = true;
    }
    else{
        emailResult.innerHTML = "이메일은 필수 입니다";
        checks[7] = false;
        emailResult.classList.add("redResult");
        emailResult.classList.remove("blueResult");
    }
    
})

//form 전송
btn.addEventListener("click", function(){
    //if(idCheck && pwCheck && pwLengthCheck && pwNullCheck && pwEqualCheck){
    if(!checks.includes(false)){
        frm.submit();
        // location.href = "./";
        alert('회원 가입을 축하드립니다');
    }  
    else{
        alert('필수 사항에 입력 바랍니다');
    } 
     

})
