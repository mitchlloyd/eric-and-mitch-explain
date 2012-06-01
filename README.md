# Static site for the podcast Eric and Mitch Explain.

### Developing

This site is built with [Middleman]('https://github.com/middleman/middleman') so checkout that website for the gist on how to work on the site.

**Getting Setup**

First clone the github repository

    git clone git://github.com/mitchlloyd/eric-and-mitch-explain.git

Then run bundle

    bundle

If everything worked out you can then run

    bundle exec middleman

And you should be able to see the website at http://localhost:4567

### Deploying

First run `rake build` and then run `rake deploy`.