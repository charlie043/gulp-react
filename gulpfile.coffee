gulp        = require 'gulp'
source      = require 'vinyl-source-stream'
browserify  = require 'browserify'
reactify    = require 'reactify'

gulp.task 'jsx', ->
  browserify
    entries: ['./src/index.jsx']
  .transform(reactify)
  .bundle()
  .pipe source 'index.js'
  .pipe gulp.dest './publish'

gulp.task 'watch', ->
  gulp.watch './src/jsx/**', ['jsx']

gulp.task 'default', ['jsx']
