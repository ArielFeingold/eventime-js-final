guy = User.create(name: "Guy Blum", email: "guy@gmail.com", password: "12345", password_confirmation: "12345", about: "Nice guy", city: "New York", state: "NY")
jenny = User.create(name: "Jenny Folson", email: "jenny@gmail.com", password: "12345", password_confirmation: "12345", about: "Just a girl", city: "New York", state: "NY")
paul = User.create(name: "Paul Bane", email: "paul@gmail.com", password: "12345", password_confirmation: "12345", about: "Love travel, friends and cakes!", city: "New York", state: "NY")
rebecca = User.create(name: "Rebecca Strutt", email: "becky@gmail.com", password: "12345", password_confirmation: "12345", about: "nothing to see, walk away", city: "Los Angeles", state: "CA")

msg = Location.create(name:"Madison Sq. Garden", address: "325 7th Ave.", city: "New York", state: "NY", public: 1, user_id: 1)
home = Location.create(name:"Becky's Home", address: "382 central Park West.", city: "New York", state: "NY", public: 0, user_id: 3)

radiohead = Event.create(title: "Radiohead Concert", description: "first live performance in 5 years", date: "2018-05-25", time: "2000-01-01 18:34:00", user_id: 1, location_id: 1)
seinfeld = Event.create(title: "Seinfeld Live", description: "Live from MSG", date: "2018-07-08", time: "2018-01-01 18:34:00", user_id: 2, location_id: 1)
birthday = Event.create(title: "Birthday", description: "My Bday", date: "2018-07-22", time: "2000-01-01 18:34:00", user_id: 3, location_id: 2)
