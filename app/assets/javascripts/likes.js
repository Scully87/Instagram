$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var endorsementCount = $(this).siblings('.likes_count');

      $.post(this.href, function(response){
        likeCount.text(response.like_count);
    })
  })
})