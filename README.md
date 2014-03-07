# Karma Shop Api

This is the backend for
[Ye Old Karma Shoppe](http://karma-shop.herokuapp.com/).  The frontend
is at
[https://github.com/charlietanksley/karma-shop-web](https://github.com/charlietanksley/karma-shop-web).

## Contributing

You'll need a handful of environment variables set.  I'm using
`dotenv`, so put them in your `.env` file.  Since this is a pubilc
repo and that data is sensitive, just ask me for them.

There isn't tons you need to know to contribute.  Write tests.  Run
tests `bin/rspec`.  I'm writing features that exercise the frontend so
we know the api and frontend match up.  So write those if needed.

## Building the frontend

Run `bin/build` to build the newest version of the frontend.

## Deploying

Run `bin/deploy` to push to heroku (if you have the keys).
