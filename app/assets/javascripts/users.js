$(function () {
  const userId = $('#user_events').data('id');
  let user;

    $.get(`/users/${userId}.json`, function(data) {
      user = $(data).toArray()[0];
      userEvents = user.events;
      userRsvps = user.rsvps;
  debugger
      attachEvents(userEvents);
      attachRsvps(userRsvps);
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

function attachRsvps(array) {
  $(array).each(function(index, e) {
    $.get(`/events/${e.id}.json`).done(function(data){
       let text = `<li class="list-group-item"><a href="/events/${e.event_id}" >${data.title}</a>, ${data.date}</li>`
       $("#attending_events").append(text);
     });
   })
  }

  function attachNearby() {
    $.get(`/events.json`).done(function(data) {
      nearbyEvents = $(data).filter(function(index, e) {
        e.location.city == user.city;
      }).prevObject.toArray()
      $(nearbyEvents).each(function(index, e) {
      	let text = `<li class="list-group-item"><a href="/events/${e.id}" >${e.title}</a>, ${e.date}</li>`;
        $("#nearby_events").append(text);
      })
    })

  }

})
