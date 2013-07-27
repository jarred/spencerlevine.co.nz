# Spencerlevine.co.nz

## JS

Libs

uglifyjs -o assets/js/libs.js assets/_libs/jquery.js assets/_libs/underscore.js assets/_libs/backbone.js  assets/_libs/two.js

Coffee Dev

`coffee --watch --join assets/js/app.js --compile assets/_coffee/*.coffee assets/_coffee/views/*.coffee`

Coffee Production

`coffee --join assets/js/app.js --compile assets/_coffee/*.coffee assets/_coffee/views/*.coffee; uglifyjs -o assets/js/app.js assets/js/app.js`