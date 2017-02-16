var gulp = require('gulp');
var gulpConcat = require('gulp-concat');
var gulpUglify = require('gulp-uglify');

gulp.task('default', function () {
  var files = [
    'node_modules/prismjs/prism.js',
    'node_modules/prismjs/components/prism-python.js',
    'node_modules/prismjs/components/prism-javascript.js',
    'node_modules/prismjs/components/prism-haskell.js',
    'assets/js/app.js',
  ];

  return gulp
    .src(files)
    .pipe(gulpConcat('app.min.js'))
    .pipe(gulp.dest('assets/js/'))
    .pipe(gulpUglify())
    .pipe(gulp.dest('assets/js/'));
});
