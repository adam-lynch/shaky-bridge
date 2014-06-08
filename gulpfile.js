var gulp = require('gulp');
var $ = require('gulp-load-plugins')();

gulp.task('default', ['compile']);

gulp.task('compile', ['third-party'], function(done){
    gulp.src('./src/*.coffee')
        .pipe($.coffee({bare: true}))
        .pipe(gulp.dest('./js'))
        .on('finish', done);
});

gulp.task('third-party', function(done){
    $.bowerFiles()
        .pipe($.concat('third-party.js'))
        .pipe(gulp.dest('./js'))
        .on('end', done);
});
