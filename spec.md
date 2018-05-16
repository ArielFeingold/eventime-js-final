# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Event belongs_to :user
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
 Event has_many users, through rsvps
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Location has many users through events (event attribute: title, description, date & time)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Comment, Location, Event, User
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  attending(user)
  Event.most_recent(5) URL: /events
- [x] Include signup (how e.g. Devise)
  with email & password + password confirmation
- [x] Include login (how e.g. Devise)
  with email & password
- [x] Include logout (how e.g. Devise)
  logout button
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Omniauth facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  users/1/events/
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
   URL: /users/1/events/new has a nested form for location/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    URL: /users/1/events/new
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
