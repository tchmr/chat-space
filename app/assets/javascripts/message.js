$(function() {
  var messages = $('.messages');

  function postMsg(message) {
    img_tag = `<img src="${message.image.url}" class="message__text__image">`;
    if(message.image.url === null) {
      img_tag = ``;
    }

    var html =
              `<div class="message">
                <div class="upper-info">
                  <p class="upper-info__user">
                    ${message.name}
                  </p>
                  <p class="upper-info__date">
                    ${message.time}
                  </p>
                </div>
                <p class="message__text">
                  ${message.body}
                </p>
                ${img_tag}
              </div>`
    messages.append(html);
  }

  function activateSubmitBtn() {
    $('.new_message__submit').prop('disabled', false);
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);

    $.ajax({
      url: window.location.href,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      postMsg(data);
      $('.input-box__message').val('');
      $('#message_image').val('');
      activateSubmitBtn();
      messages.animate({scrollTop: messages[0].scrollHeight}, 'fast');
    })
    .fail(function() {
      alert('メッセージを入力してください');
      activateSubmitBtn();
    })
  });
});