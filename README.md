# README

## Environment Config
 
 Ruby  version: ruby 2.6.3p62
 Rails version: Rails 5.2.4.2

# Setup

Download the project
```
 git clone -b master git@github.com:CarlosCalgaro/widgets-api.git
```
Install the gems
```
 bundle install
```
Add the credentials
```
 EDITOR="vim" rails credentials:edit
```
The credentials file should have this structure 
```YML
showoff:
        client_id: <client_id>
        client_secret: <client_secret>
secret_key_base: <secret_key_base>
```

Run the server 

```
rails s
```