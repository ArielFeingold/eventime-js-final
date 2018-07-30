# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    *On the location show page clicking on one of the upcoming events on the list opens a short summery of the event with a link to the event page*
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    *The user show page renders the rsvp's, events nearby and user events using JS and not get request*
- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
    *User has many events and rsvps. UserSerializer lines 3-4*
- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
      *Add comment on the event page. lines: 110-123*
- [X] Translate JSON responses into js model objects.
      *comments on the vent page are a prototype with a postComment method that generates the link to be appended to the comments div*
- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
      *comments on the vent page are a prototype with a postComment method that generates the link to be appended to the comments div*

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
