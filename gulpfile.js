var gulp = require('gulp');
var gulpConcat = require('gulp-concat');
var gulpUglify = require('gulp-uglify');

gulp.task('default', function () {
  var files = [
    'bower_components/prism/prism.js',
    'bower_components/prism/components/prism-python.js',
    'bower_components/prism/components/prism-javascript.js',
    'bower_components/prism/components/prism-haskell.js',
    'assets/js/app.js',
  ];

  return gulp
    .src(files)
    .pipe(gulpConcat('app.min.js'))
    .pipe(gulp.dest('assets/js/'))
    .pipe(gulpUglify())
    .pipe(gulp.dest('assets/js/'));
});
