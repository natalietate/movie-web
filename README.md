# MOVIE-NIGHT

MovieNight is a web-based application that allows you to save movies you want to watch to your Watch List, create Movie Night events with your friends, and vote for which movie you want to watch at your next event! Users can save movies from their own Watch List to the Event's Watch List and then vote for which movie they want to watch together.

**Run on your computer:**

From your project folder, clone the git repository:

	git clone https://github.com/natalietate/movie.git

Open the project folder:

	cd movie

Install all dependencies:

	bundle install

Create and seed the database:

	rake db:migrate
	rake db:seed

Run the application:

	rails server

To see the application in action, open a browser window and navigate to [http://localhost:3000](http://localhost:3000).

**Sample Account**

You can sign in to a demo account with the following credentials:

| Email        | Password    |    
| ------------- |:---------:|
| test@test.com | testing  |			
