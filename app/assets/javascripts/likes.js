var connection = new WebSocketRails('localhost:3000/websocket');
channel = connection.subscribe('likes');
channel.bind('new', function(post){
  console.log(post.new_like_count);
})

$(document).ready(function(){
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    //event.stopPropagation();
    var url = $(this).attr('href')
    $.post(url);
  });
});