#!/bin/bash

node_modules/.bin/browserify localise-demo.coffee -o browser.js
#node_modules/uglify-js/bin/uglifyjs -b browser.ugly.js > browser.js

