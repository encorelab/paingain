```

$$$$$$$\   $$$$$$\  $$$$$$\ $$\   $$\        $$$$$$\   $$$$$$\  $$$$$$\ $$\   $$\
$$  __$$\ $$  __$$\ \_$$  _|$$$\  $$ |      $$  __$$\ $$  __$$\ \_$$  _|$$$\  $$ |
$$ |  $$ |$$ /  $$ |  $$ |  $$$$\ $$ |      $$ /  \__|$$ /  $$ |  $$ |  $$$$\ $$ |
$$$$$$$  |$$$$$$$$ |  $$ |  $$ $$\$$ |      $$ |$$$$\ $$$$$$$$ |  $$ |  $$ $$\$$ |
$$  ____/ $$  __$$ |  $$ |  $$ \$$$$ |      $$ |\_$$ |$$  __$$ |  $$ |  $$ \$$$$ |
$$ |      $$ |  $$ |  $$ |  $$ |\$$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$ |\$$$ |
$$ |      $$ |  $$ |$$$$$$\ $$ | \$$ |      \$$$$$$  |$$ |  $$ |$$$$$$\ $$ | \$$ |
\__|      \__|  \__|\______|\__|  \__|       \______/ \__|  \__|\______|\__|  \__|

```

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

