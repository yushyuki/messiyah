
$(function(){
    $('#all').on('click', function(){
    if(this.checked){
    $('#check input').prop('checked','checked');
    }else{
    $('#check input').removeAttr('checked');
    }
  });
});