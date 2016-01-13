User.delete_all

User.create!([
  {email: "jay@email.com", password: "password", encrypted_password: "$2a$10$2MI2TGQLh0Kx8img3N9XquQqu8jhYCCv8x7OtbbNOWoUXSqybgrA2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-01-12 17:26:38", last_sign_in_at: "2016-01-11 14:17:51", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Jay", role: "admin"},
  {email: "nick@email.com", password: "password", encrypted_password: "$2a$10$LslPVeWHiPv.55dbSevopey84l2AHCbphSGirpgK.XXdFSi9Ftw2O", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-01-11 10:47:01", last_sign_in_at: "2016-01-11 10:47:01", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: nil, role: nil},
  {email: "bob@email.com", password: "password", encrypted_password: "$2a$10$/RTfo2PxySZJi1MBxpm4Ou7GvSy1TSABg7f2heFbcHUHCFdeYQQ4i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-01-11 10:48:47", last_sign_in_at: "2016-01-11 10:48:47", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: nil, role: nil},
  {email: "bill@email.com", password: "password", encrypted_password: "$2a$10$b1lcj/BvFs78cOGTvxkEDuNjiiogaCfg0C9ZULxgiAuRwvLXSfrKG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-01-11 10:57:15", last_sign_in_at: "2016-01-11 10:57:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: nil, role: nil},
  {email: "percy@email.com", password: "password", encrypted_password: "$2a$10$zh5fK7LQ8aRP5aoiYsIcUekdPnidH9OvfaBdprACVFCr6hb9fNM/O", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-01-11 11:43:04", last_sign_in_at: "2016-01-11 11:03:38", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Percy", role: nil},
  {email: "pete@email.com", password: "password", encrypted_password: "$2a$10$s4fFbCWSWVt9KS4V1aRIWOP/LVuq3dJdFhcq9YGxhm8nnZT/MuCUa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-01-12 17:24:15", last_sign_in_at: "2016-01-12 17:24:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "pete", role: nil}
])

# Booking.delete_all

# Booking.create!([
#   {user_id: 1, show_id: 2, ticket: 4},
#   {user_id: 6, show_id: 6, ticket: 3},
#   {user_id: 1, show_id: 7, ticket: 4},
#   {user_id: 1, show_id: 7, ticket: 10}
# ])

Performer.delete_all

Performer.create!([
  {name: "Joe Rogan", description: "Joe Rogan (born August 11, 1967) is an American stand-up comedian, podcaster, and color commentator. He is also a former actor, host, and mixed martial artist but is perhaps best known for his podcast titled The Joe Rogan Experience, performing stand-up comedy, color commentating for the Ultimate Fighting Championship (UFC), and hosting former reality shows Fear Factor and Joe Rogan Questions Everything.", image: "https://pbs.twimg.com/profile_images/552307347851210752/vrXDcTFC.jpeg"},
  {name: "Ari Shaffir", description: "Ari Shaffir is an actor and producer, known for InAPPropriate Comedy (2013), Ari Shaffir: Paid Regular (2015) and Chronic-Con, Episode 420: A New Dope (2015).", image: "http://judygold.com/wp-content/uploads/2015/12/Ari-Shaffir1.jpg"},
  {name: "Louis CK", description: " Louis C.K. is an American comedian, actor, writer, producer, director, and editor. He is the creator, star, writer, director, executive producer, and primary editor of the acclaimed FX comedy-drama series Louie. C.K. is known for his use of observational, self-deprecating, dark and vulgar humor in his stand-up career.", image: "http://www.austinchronicle.com/binary/1157/scaled.louisck.png"}
])

Show.delete_all

Show.create!([
  {name: "Shiny Happy Jihad", image: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c6/Shiny_Happy.jpg/220px-Shiny_Happy.jpg", description: "Funny show!", venue_id: 1, performer_id: 2, start_time: "2016-07-11 21:00:00", end_time: "2016-07-11 22:30:00", capacity: 400},
  {name: "Passive Aggressive", image: "http://images.bwwstatic.com/columnpic6/9545A560-92A7-955A-76E134A6B9E99AE3.jpg", description: "Passive aggressive comedy", venue_id: 1, performer_id: 3, start_time: "2016-07-06 21:00:00", end_time: "2016-07-06 22:30:00", capacity: 200},
  {name: "Talking Monkeys in Space ", image: "http://ecx.images-amazon.com/images/I/61oIl076-OL.jpg", description: "dasf", venue_id: 1, performer_id: 2, start_time: "2016-07-12 21:00:00", end_time: "2016-07-12 22:30:00", capacity: 400},
  {name: "Hilarious ", image: "https://upload.wikimedia.org/wikipedia/en/e/e8/Hilarious.jpg", description: "Louis talks about \"Being Single Again\", \"Other People's Kids\"  and his own in this new Hilarious hour", venue_id: 3, performer_id: 4, start_time: "2016-08-05 21:00:00", end_time: "2016-08-05 22:00:00", capacity: 200},
  {name: "test test", image: "image.jpg", description: "test", venue_id: 1, performer_id: 2, start_time: "2016-02-12 13:30:00", end_time: "2016-02-12 14:30:00", capacity: 200},

])

Venue.delete_all

Venue.create!([
  {name: "Codeclan", description: nil, image: nil, location: nil, capacity: nil},
  {name: "Usher Hall", description: "The Usher Hall is a 5 star concert hall, situated on Lothian Road, in the west end of Edinburgh, Scotland. It has hosted concerts and events since its construction in 1914 and can hold approximately 2,200 people in its recently restored auditorium, which is well loved by performers due to its acoustics. The Hall is flanked by The Royal Lyceum Theatre on the right and The Traverse Theatre on the left. Historic Scotland has registered the Hall with Category A listed building status.", image: "http://s0.geograph.org.uk/photos/14/99/149973_48fb27a0.jpg", location: "Lothian Road", capacity: nil},
  {name: "Kings Theatre", description: "The King's Theatre was opened in 1906 and stands on a prominent site on Leven Street in Edinburgh. It is one of Scotland's historic and most important theatres. It plays a vital role in today's theatre industry as much as it has done in its 100 years of service to Edinburgh theatre patrons.", image: "http://www.theatresonline.com/theatres/edinburgh-theatres/the-kings-theatre/images/kings-theatre.jpg", location: "2 Leven St, Edinburgh EH3 9LQ", capacity: nil}
])
