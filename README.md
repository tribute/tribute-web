# Tribute Web

An app to keep track of who is using what open-source applications. It allows you to 'pay tribute' to your favorite open source applications.

## Development Setup

First, install node.js and Bower.  

Git clone this repository and then install all node and bower modules required by the application.

```sh
npm install
bower install
```

To build and start server in development mode, which will auto-rebuild any changed files:

```sh
grunt server
```

To run tests once in Chrome browser:

```sh
grunt test
```

To build and pre-view a minified production-ready version of this app:

```sh
grunt server:dist
```
