const { src, dest, watch, series } = require('gulp');
const sass = require('gulp-sass')(require('sass'));
const babel = require('gulp-babel');
const terser = require('gulp-terser');
const browserSync = require('browser-sync').create();

// Sass Task
function scssTask() {
    return src('./scss/main.scss', { sourcemaps: true }) // Return the stream
        .pipe(sass().on('error', sass.logError))
        .pipe(dest('dist', { sourcemaps: '.' }))
        .pipe(browserSync.stream()); 
}

// JavaScript Task
function jsTask(done) {
    return src('./js/script.js', { sourcemaps: true })
    .pipe(babel({ presets: ['@babel/preset-env'] }))
    .pipe(terser())
    .pipe(dest('dist', { sourcemaps: '.' }))
    .pipe(browserSync.stream());
    ;
}

function browserSyncServe(cb) {
    browserSync.init({
      server: {
        baseDir: '.'
      }
    }, 
    // Callback function to execute after BrowserSync starts
    function(err, bs) { 
      if (err) {
        console.error("Error starting BrowserSync:", err);
      } else {
        console.log("BrowserSync serving files from:", bs.options.getIn(["server", "baseDir"]));
      }
      cb(); // Signal BrowserSync initialization is complete
    });
  }
  
// BrowserSync Reload
function browserSyncReload(cb) {
  browserSync.reload();
  cb();
}

// Watch Task
function watchTask() {
  watch('*.html', browserSyncReload);
  watch('./scss/**/*.scss', scssTask);
  watch('./js/*.js', jsTask);
}

// Default Gulp Task
exports.default = series(scssTask, jsTask, browserSyncServe, watchTask);

// Build Gulp Task
exports.build = series(scssTask, jsTask);
