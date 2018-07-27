let user;
$(document).ready(function () {

  const userId = $('#user_events').data('id');
  const locationId = $('#upcoimng_events').data('id');

  if(userId !== undefined) {
    userPage();
  }

  if(locationId !== undefined){
    locationPage();
  }
  // user#show page
  function userPage(){

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
  }

// location#show page

  function locationPage() {
    $.get(`/locations/${locationId}.json`, function(data) {

    sortedEvents =  $(data.events).sort(function(a,b){
      a = new Date(a.date);
      b = new Date(b.date)
      return a.getTime() - b.getTime()
    })
      sortedEvents.each(function(index, e){
        text = `<li class="e-details list-group-item" data-id="${e.id}">${e.title}, ${e.date}</li>`;
        $("#upcoimng_events").append(text);
      })
    }).done(function(){
      $(".e-details.list-group-item").on("click", function(e){
        e.preventDefault();
        eventId = $(this).data("id");
        $.get(`/events/${eventId}.json`, function(data){
          text =
              `<div class="card mb-3">
                <div class="card-body">
                  <h5 class="card-title pb-3">${data.title}</h5>
                <br>
                  <p>${data.description}</p>
                  <br>
                  <p>${data.date}</p>
                  <a href="/events/${data.id}" class="badge badge-light">Click here to go to event page</a>
                </div>
              </div>`
        $("#event_details_div").html(text)
        })

      })
    })
  }
// event#show page- add comment form
  $('#new_comment').submit(function(event) {
     event.preventDefault();

     var values = $(this).serialize();

     var posting = $.post('/comments', values);

     posting.done(function(data) {
      text = `<li class="list-group-item"> <a href="/users/${data.user.id}">${data.user.name}</a>: ${data.content}<a href="/comments/${data.id}/edit"> edit</a></li>`
      $('#comment-list').append(text)
     });
   });



})
