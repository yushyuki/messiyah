
$(function(){
    $('#all').on('click', function(){
    if(this.checked){
    $('#check input').prop('checked','checked');
    }else{
    $('#check input').removeAttr('checked');
    }
  });
});


$(function(){
    $('#youbi_all').on('click', function(){
    if(this.checked){
    $('#youbi_check input').prop('checked','checked');
    }else{
    $('#youbi_check input').removeAttr('checked');
    }
  });
});