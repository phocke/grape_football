## How to run it

In order to run this app just type it in the app folder:

    rackup config.ru

Now you can safely use curl to check whether it works or not:

    curl -X GET  http://localhost:9292/api/v1/hello

You should get some JSON in return

    {"hello":"world"}


## How to run specs

Just use good ol' rake

    rake



