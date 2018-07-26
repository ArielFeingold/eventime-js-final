let user;
$(document).ready(function () {

// user#show page
  const userId = $('#user_events').data('id');

    $.get(`/users/${userId}.json`, function(data) {
      user = $(data).toArray()[0];
      userEvents = user.events;

      attachEvents(userEvents);
      attachRsvps();
      attachNearby();
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

  function attachRsvps() {
    $.get(`/rsvps.json`).done(function(data) {
      $(data).each(function(index, e) {
        if(e.user_id === user.id){
          text = `<li class="list-group-item"><a href="/events/${e.event.id}" >${e.event.title}</a>, ${e.event.date}</li>`;
          $("#attending_events").append(text);
        }
      })
    })
  }

  function attachNearby() {
    $.get(`/events.json`).done(function(data) {
      nearbyEvents = $(data).filter(function(index, e) {
        e.location.city == user.city;
      }).prevObject.toArray()
      $(nearbyEvents).each(function(index, e) {
        text = `<li class="list-group-item"><a href="/events/${e.id}" >${e.title}</a>, ${e.date}</li>`;
        $("#nearby_events").append(text);
      })
    })
  }

// location#show page


})
