## How to run it

In order to run this app just type it in the application folder:

    rackup config.ru

Now you can safely use curl to check whether it works or not:

    curl -X GET  http://localhost:9292/api/v1/hello

You should get some JSON in return

    {"hello":"world"}


## How to run specs

Just use good ol' rake

    rake

## How to use cookies

In order to use cookies for game identification od this:

    curl -b cookie.txt -c cookie.txt -X GET  http://localhost:9292/api/v1/game/start

It will set game_id value in cookie, as well as give you JSON with the same value. Initially API will requre you to provide game_id param for all game related requests (save, shoot, show). In the next version you'll be able to just use cookie
