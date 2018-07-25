
$(function () {
  const userId = $('#user_events').data('id');

    $.get(`/users/${userId}.json`, function(data) {
      user = data
      userEvents = $(data.events).toArray();
      userRsvps = $(data.rsvps).toArray();

      attachEvents(userEvents)
      attachRsvps(userRsvps)
  })

  function attachEvents(array) {
  if(array.length) {
    $(array).each(function(index, e) {
      text = `<li class="list-group-item"><a href="/users/${userId}/events/${e.id}">${e.title}</a>, ${e.date}</li>`
      $("#user_events").append(text);
    })
  } else {
    text = "You have no upcoimng events"
    $("#user_events").append(text);
  }
}

function attachRsvps(array) {

  $(array).each(function(index, e) {
    $.get(`/events/${e.id}.json`).done(function(data){
       let text = `<li class="list-group-item"><a href="/events/${e.event_id}" >${data.title}</a>, ${data.date}</li>`
       $("#attending_events").append(text);
     });
   })
  }
})
