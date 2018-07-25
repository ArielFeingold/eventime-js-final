
$(function () {
  const userId = $('#user_events').data('id');

    $.get(`/users/${userId}.json`, function(data) {
        debugger
      user = data
      userEvents = $(data.events).toArray();
      userRsvps = $(data.rsvps).toArray();
  })
})
