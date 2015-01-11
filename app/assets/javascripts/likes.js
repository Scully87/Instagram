$(document).ready(function(){
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    //event.stopPropagation();
    var url = $(this).attr('href')
    $.post(url);
  });
});