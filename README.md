# README


## Showoff tech test application

# Ruby/Rails versions
- ### Ruby  version: ruby 2.6.3p62
- ### Rails version: Rails 5.2.4.2

# Link to production
    https://shielded-castle-82642.herokuapp.com/

# Install the project

### Cloning the repository

```
 git clone -b master git@github.com:CarlosCalgaro/widgets-api.git
```

Installing the gems of the project
```
 bundle install
```

Regenerate credentials file and add your tokens to rails credentials

```
 rm config/credentials.yml.enc
 EDITOR="vim" rails credentials:edit
```

The credentials file should have this structure , substituting everything inside <> with your data

```YML
showoff:
        client_id: <client_id>
        client_secret: <client_secret>
secret_key_base: <secret_key_base>
```

You can now run the server with

```
rails s
```

If everything went correct, you should see your application running at the url http://localhost:3000


### Deploying to Heroku
Using the heroku client

In the source code directory. Create the heroku app
```
heroku create
```

Deploy your code using heroku's branch

```
git push heroku master
```

open the API
```
heroku open
```
