jQuery(document).on 'turbolinks:load', ->
  posts = $('#posts')
  if $('#posts').length > 0
    posts_to_bottom = -> posts.scrollTop(posts.prop("scrollHeight"))

    posts_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "TripRoomsChannel"
        trip_room_id: posts.data('trip-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        posts.append data['post']
        posts_to_bottom()

      send_post: (post, trip_room_id) ->
        @perform 'send_post', post: post, trip_room_id: trip_room_id


    $('#new_post').submit (e) ->
      $this = $(this)
      textarea = $this.find('#textarea-trip')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_post textarea.val(), posts.data('trip-room-id')
        textarea.val('')
      e.preventDefault()
      return false