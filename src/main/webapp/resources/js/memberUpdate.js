
function chkValidation(){
    let na = $('#name').val;
    let phone =$('#phone').val;
    let email = $('#email').val;
    let addressList = $('#addressList')
   
   
na.each(function(){
        let val = $(this).val();
        if(val==''){
            na=false;
            return faslse;
        }
    })

phone.each(function(){
        let val = $(this).val();
        if(val==''){
            na=false;
            return faslse;
        }
    })

email.each(function(){
    let val = $(this).val();
    if(val==''){
        email = false;
        return false;
    }
})

addressList.each(function(){
    let val = $(this).val();
    if(val==''){
        addressList = false;
        return false;
    }
})

}

