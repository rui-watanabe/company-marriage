$(function(){
  function buildMessage(message){
    var html =  `<div class="chat" data-chat-id="${message.id}">
                  <div class="chat-box">
                  <div class="chat-face">
                  <img style="width:100px; height:100px;" src= "${message.avatar}"></div>
                  <div class="chat-hukidashi">
                        <strong>${message.content}</strong>
                        <br>${message.date}
                  </div>
                  </div>
                  </div>`
    return html;
  }
  $("#new_message").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildMessage(data);
      $('.chats').append(html)
      $('html,body').animate({scrollTop: $('.chats')[0].scrollHeight}, 'fast');
      $("form")[0].reset();
    })
    .fail(function(){
    alert('error');
    })
  })
});