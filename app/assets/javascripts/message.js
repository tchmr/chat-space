$(document).on('turbolinks:load', function() {
  $(function() {
    var $messages = $('.messages');

    function buildMessageHTML(message) {
      message.image.url === null ? img_tag = `` : img_tag = `<img src="${message.image.url}" class="message__text__image">`;

      var html =
                `<div class="message" data-message-id="${message.id}">
                  <div class="upper-info">
                    <p class="upper-info__user">
                      ${message.user_name}
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
      return html;
    }

    function formReset() {
      $('#new_message')[0].reset();
    }

    function scrollView() {
      $messages.animate({scrollTop: $messages[0].scrollHeight}, 'fast');
    }

    function activateSubmitBtn() {
      $('.new_message__submit').prop('disabled', false);
    }


    $('#new_message').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);

      $.ajax({
        url: window.location.pathname,
        type: 'POST',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(message) {
        $messages.append(buildMessageHTML(message));
        formReset();
        scrollView();
        activateSubmitBtn();
      })
      .fail(function() {
        alert('メッセージを入力してください');
        activateSubmitBtn();
      })
    });

    var reloadMessages = function() {
      last_message_id = $('.message').last().attr('data-message-id');
      api_url = window.location.pathname + '/../api/messages';
      $.ajax({
        url: api_url,
        type: 'GET',
        dataType: 'json',
        data: { id: last_message_id }
      })
      .done(function(messages) {
        var insertHTML = '';
        messages.forEach(function(message) {
          insertHTML += buildMessageHTML(message);
        });
        $messages.append(insertHTML);
        scrollView();
      })
      .fail(function() {
        alert('自動更新に失敗しました');
      });
    };

    if(window.location.href.match(/messages/)) {
      setInterval(reloadMessages, 5000);
    }
  });
});