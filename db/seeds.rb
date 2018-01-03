User.destroy_all

 # Create a demo user
user = User.create! :email => 'test@test.com', :password => 'testing', :password_confirmation => 'testing'

# Create a movie
  Movie.create! :original_title => "Wonder Woman", :poster_path => "/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg", :overview => "An Amazon princess comes to the world of Man to become the greatest of the female superheroes."
  Movie.create! :original_title => "Star Wars", :poster_path => "/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg", :overview => "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire."
  Movie.create! :original_title => "Singin' in the Rain", :poster_path => "/d5J53CwrVs6txB8zhE6qS2QhIV.jpg", :overview => "In 1927 Hollywood, Don Lockwood and Lina Lamont are a famous on-screen romantic pair in silent movies, but Lina mistakes the on-screen romance for real love. When their latest film is transformed into a musical, Don has the perfect voice for the songs, but strident voice faces the studio to dub her voice. Aspiring actress, Kathy Selden is brought in and, while she is working on the movie, Don falls in love with her."

# Create User watchlist
  UserWatchlist.create! :movie_id => 1,  :user_id => 1
  UserWatchlist.create! :movie_id => 2,  :user_id => 1
  UserWatchlist.create! :movie_id => 3,  :user_id => 1
