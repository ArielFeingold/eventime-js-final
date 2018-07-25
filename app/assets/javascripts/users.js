
$(function () {
  const userId = $('#user_events').data('id');

    $.get(`/users/${userId}.json`, function(data) {
      user = data
      userEvents = $(data.events).toArray();
      userRsvps = $(data.rsvps).toArray();

      attachEvents(userEvents)
  })

  function attachEvents(array) {
  if(array.length) {
    $(array).each(function(index, e) {
      text = `<li class="list-group-item"><a href="/users/${userId}/events/${index}">${e.title}</a>, ${e.date}</li>`
      $("#user_events").append(text);
    })
  } else {
    text = "You have no upcoimng events"
    $("#user_events").append(text);
  }
}
})
