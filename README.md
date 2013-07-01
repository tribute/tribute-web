Tribute Web
===========

[![Build Status](https://secure.travis-ci.org/tribute/tribute-web.png)](http://travis-ci.org/tribute/tribute-web)

Dev Setup
---------

```
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.bash_profile
nvm install v0.10.10
npm install -g nodemon
npm install -g mocha
npm update
```

Run
---

Run [tribute-api](https://github.com/tribute/tribute-api) with `rackup`.

Then, run tribute-web.

```
coffee app.coffee
```

Navigate to http://localhost:9293.


