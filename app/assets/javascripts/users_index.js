$(function() {
  $(document).on('turbolinks:load', function() {
    var userSearchResult = $('#user-search-result');
    var chatGroupUsers = $('#chat_group_users');

    function appendUserToSearchList(user) {
      var html = `<div class="chat-group-user clearfix">
                    <p class="chat-group-user__name">${user.name}</p>
                    <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
                  </div>`
      userSearchResult.append(html);
    }

    function appendNoUserToSearchList(msg) {
      var html =`<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${msg}</p>
                </div>`
      userSearchResult.append(html);
    }

    function appendUserToMemberList(name, user_id) {
      var html = `<div class="chat-group-user clearfix">
                    <input name='group[user_ids][]' type='hidden' value=${user_id}>
                    <p class="chat-group-user__name">${name}</p>
                    <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn data-user-id="${user_id}" data-user-name="${name}">削除</div>
                  </div>`
      chatGroupUsers.append(html);
    }

    $('#user-search-field').on('keyup', function() {
      var input = $('#user-search-field').val();
      console.log(input);
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json',
        contentType: false
      })
      .done(function(users) {
        userSearchResult.empty();
        if(input.length !== 0) {
          if(users.length > 0) {
            users.forEach(function(user) {
              appendUserToSearchList(user);
            });
          }
          else {
            appendNoUserToSearchList('一致するユーザーが見つかりません');
          }
        }
      })
      .fail(function() {
        alert('ユーザー検索に失敗しました');
      })
    });

    $(function() {
      $(document).on('click', '.user-search-add', function() {
        var name = $(this).attr('data-user-name');
        var user_id = $(this).attr('data-user-id');
        $(this).parent().remove();
        appendUserToMemberList(name, user_id);
      });

      $(document).on('click', '.user-search-remove', function() {
        $(this).parent().remove();
      });
    });
  });
});