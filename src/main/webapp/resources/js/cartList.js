
$('.cartDel').click(function(){
    let cartNum=$(this).attr('data-cart-num');
    let check = confirm("삭제하시겠습니까?")

    if(check) {

        $.ajax({
            type : 'POST',
            url : './delete',
            data : {
                cartNum : cartNum
            },
            success : function(response){
                if(response.trim()>0) {
                    alert('삭제되었습니다')
                    location.href = "./list"
                } else {
                    alert('삭제 실패');
                }
            }
        })
    }
})
$('.cartOrder').click(function(){
    let cartNum=$(this).attr('data-cart-num');
    let check = confirm('주문하시겠습니까?')
    if(check){

        let form=$('#cartForm'+cartNum).serialize();
        
        $.ajax({
            type : 'POST',
            url : '/product/order/cartEachOrder',
            data : form,
            success : function(response){
                if(response.trim()>0){
                    $.ajax({
                        type : 'POST',
                        url : '/cart/delete',
                        data : {
                            cartNum : cartNum
                        },
                        success : function(response){
                            if(response.trim()>0){
                                alert('주문이 완료되었습니다')
                                location.href = "../product/order/list"
                            }
                        }
                    })
                } else {
                    alert('주문 실패')
                }
            }
        })
    }

})

const plusBtn=document.getElementsByClassName('plus_btn');
const minusBtn=document.getElementsByClassName('minus_btn');
const amounts = document.getElementsByClassName('amounts');
const prices = document.getElementsByClassName('prices');
const gradeNums=document.getElementsByClassName('gradeNums');

function getAllCart(){
    let orderer = $('.orderers').val();
    const names=document.getElementsByClassName('names');
   
   
    let startDate = $('.startDates').val();
    let lastDate = $('.lastDates').val();
    let indexCode = $('.indexCodes').val();
    let gradeNum=$('.gradeNums').val();
    let title=''
    let amount=0;
    let price=0;
    for(let i=0;i<names.length;i++){
        title=title+gradeNums[i].value+'.'+names[i].value+amounts[i].value+'개'
        amount=amount+parseInt(amounts[i].value)
        price=price+parseInt(prices[i].value)
    }
    $('#orderer').val(orderer)
    $('#name').val(title)
    $('#amount').val(amount)
    $('#price').val(price)
    $('#startDate').val(startDate)
    $('#lastDate').val(lastDate)
    $('#indexCode').val(indexCode)
    $('#gradeNum').val(gradeNum)


}
for(let i=0;i<plusBtn.length;i++){
    let cost=0;
    plusBtn[i].addEventListener('click', ()=>{
        cost=prices[i].value/amounts[i].value
        amounts[i].value++
        prices[i].value=parseInt(prices[i].value)+cost
        getAllCart()
    })
    minusBtn[i].addEventListener('click',()=>{
        cost=prices[i].value/amounts[i].value
        amounts[i].value--
        prices[i].value=prices[i].value-cost
        getAllCart()
    })
}



$('#allForm').click(()=>{
    let check = confirm('주문하시겠습니까?')
    if(check) {
        let form = $('#cartAllForm').serialize()
        $.ajax({
            type : 'POST',
            url : '/product/order/cartAllOrder',
            data : form,
            success : function(response){
                if(response.trim()>0){
                    form=$('.cartFormData').serialize()
                    $.ajax({
                        type : 'POST',
                        url : '/cart/stockUpdate',
                        data : form,
                        success : function(response){
                            if(response.trim()>0){
                                alert('주문이 완료되었습니다')
                                location.href = "../product/order/list"

                            }
                        }
                    })
                } else {
                    alert('주문 실패')
                }
            }
        })
    }
})
