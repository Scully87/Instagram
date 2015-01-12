// var connection = new WebSocketRails('localhost:3000/websocket');
// channel = connection.subscribe('likes');
// channel.bind('new', function(photo){
//   var postElem = $('.like-btn[data-id=' + photo.id + ']');
//   postElem.text('♥ ' + photo.new_like_count);
//   console.log("likes: " + photo.new_like_count);
// })

$(document).ready(function(){
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    //event.stopPropagation();
    var url = $(this).attr('href')
    $.post(url);
  });
});