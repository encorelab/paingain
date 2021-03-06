```
 /$$$$$$$           /$$            /$$$$$$            /$$          
| $$__  $$         |__/           /$$__  $$          |__/          
| $$  \ $$ /$$$$$$  /$$ /$$$$$$$ | $$  \__/  /$$$$$$  /$$ /$$$$$$$ 
| $$$$$$$/|____  $$| $$| $$__  $$| $$ /$$$$ |____  $$| $$| $$__  $$
| $$____/  /$$$$$$$| $$| $$  \ $$| $$|_  $$  /$$$$$$$| $$| $$  \ $$
| $$      /$$__  $$| $$| $$  | $$| $$  \ $$ /$$__  $$| $$| $$  | $$
| $$     |  $$$$$$$| $$| $$  | $$|  $$$$$$/|  $$$$$$$| $$| $$  | $$
|__/      \_______/|__/|__/  |__/ \______/  \_______/|__/|__/  |__/
```

# About
PainGain is application aimed at helping nurses and health care professionals asses and improve their pain practice. It is built with the ruby-on-rails application framework, with bootstrap 3, haml, and sass.


# the Stack

* Rails 4
* RVM
* Postgres


# Setup

* requires Postgres App to be installed
* `git clone git@github.com:switchflip/paingain.git`
* `cd paingain`
* `bundle install`
*  Create `config/database.yml`
* `bundle exec rake db:create db:migrate db:seed`
* login in comfortable mexican sofa admin at `localhost://3000/admin`
* Create a new site entitled `PainGain`, with the identifier as `paingain`.
* Upon navigating to Pages you should see the site tree.

# Tests
* Run `bundle exec rake db:migrate RAILS_ENV=test` to setup test environment
* `bundle exec rake` to run all tests.

