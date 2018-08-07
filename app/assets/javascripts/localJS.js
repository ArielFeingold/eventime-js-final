let user;

$(document).ready(() => {

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

    $.get(`/users/${userId}.json`, (data) => {
      user = $(data).toArray()[0];
      userEvents = user.events;

      attachEvents(userEvents);
      attachRsvps();
      attachNearby();
    })

    function attachEvents(array) {
    if(array.length) {
      $(array).each((index, e) => {
        text = `<li class="list-group-item"><a href="/users/${userId}/events/${e.id}">${e.title}</a>, ${e.date}</li>`
        $("#user_events").append(text);
      })
    } else {
      text = "You have no upcoimng events"
      $("#user_events").append(text);
    }
  }

    function attachRsvps() {
      $.get(`/rsvps.json`).done((data) => {
        $(data).each((index, e) => {
          if(e.user_id === user.id){
            text = `<li class="list-group-item"><a href="/events/${e.event.id}" >${e.event.title}</a>, ${e.event.date}</li>`;
            $("#attending_events").append(text);
          }
        })
      })
    }

    function attachNearby() {
      $.get(`/events.json`).done((data) => {
        nearbyEvents = $(data).filter((index, e) => {
          e.location.city == user.city;
        }).prevObject.toArray()
        $(nearbyEvents).each((index, e) => {
          text = `<li class="list-group-item"><a href="/events/${e.id}" >${e.title}</a>, ${e.date}</li>`;
          $("#nearby_events").append(text);
        })
      })
    }
  }

// location#show page

  function locationPage() {
    $.get(`/locations/${locationId}.json`, (data) => {

    sortedEvents =  $(data.events).sort((a,b) => {
      a = new Date(a.date);
      b = new Date(b.date)
      return a.getTime() - b.getTime()
    })
      sortedEvents.each((index, e) => {
        text = `<li class="e-details list-group-item" data-id="${e.id}">${e.title}, ${e.date}</li>`;
        $("#upcoimng_events").append(text);
      })
    }).done(() => {
      showEventSummery();
    });

    function showEventSummery() {
      $(".e-details.list-group-item").on("click", function(e) {
        e.preventDefault();
        eventId = $(this).data("id");
        $.get(`/events/${eventId}.json`, (data) => {
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
    }
  }

// events#index page - sort Events

  $('#list-sort').on("click", function() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = $('#upcoming-table');
    switching = true;

    while (switching) {
      switching = false;
      rows = table[0].rows;

      for (i = 1; i < (rows.length - 1); i++) {
        shouldSwitch = false;
        x = rows[i].getElementsByTagName("TD")[0];
        y = rows[i + 1].getElementsByTagName("TD")[0];

        if (x.textContent.toLowerCase() > y.textContent.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      }
      if (shouldSwitch) {
        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
        switching = true;
      }
    }
  })
// event#show page- add comment form

  function Comment(id, name, content) {
    this.id = id;
    this.name = name;
    this.content = content;
  }

  $('#new_comment').submit(function(event) {
   event.preventDefault();

   const values = $(this).serialize();

   $.post('/comments', values).done(function(data) {
    comment = new Comment(data.user.id, data.user.name, data.content);
    text = comment.renderComment();
   });
 });

  Comment.prototype.renderComment = function() {
   text = `<li class="list-group-item"> <a href="/users/${this.id}">${this.name}</a>: ${this.content}<a href="/comments/${this.id}/edit"> edit</a></li>`;
   $('#comment-list').append(text)
   $('#new_comment')[0].reset();
  };

});
