module.exports = (grunt) ->

  settings =

    # html

    jade:
      compile:
        options:
          data:
            env: grunt.option('env') || 'developemnt'
        files:
          '.grunt-tmp/base.html': 'templates/base.jade'
    md2html:
      contents:
        options:
          layout: '.grunt-tmp/base.html'
        files: [
          expand: true
          src: ['*.md']
          dest: 'public_html'
          ext: '.html'
        ]

    # css
    
    sass:
      compile:
        files:
          '.grunt-tmp/app.css': 'sass/main.sass'
    cssmin:
      compile:
        files:
          'public_html/assets/app.min.css': '.grunt-tmp/app.css'

    # javascript
    
    coffee:
      compile:
        expand: true
        flatten: true
        cwd: 'coffeescript/'
        src: '*.coffee'
        dest: '.grunt-tmp/'
        ext: '.coffee.js'
    concat:
      compile:
        files:
          '.grunt-tmp/app.js': '.grunt-tmp/*.coffee.js'
    uglify:
      compile:
        files:
          'public_html/assets/app.min.js': '.grunt-tmp/app.js'

    # images & fonts

    copy:
      images:
        src: 'imgs/*'
        dest: 'public_html/'
      fonts:
        expand: true
        flatten: true
        src: ['fonts/**', 'bower_components/components-font-awesome/fonts/**']
        dest: 'public_html/fonts/'
        filter: 'isFile'
    
    # cleanup 
    
    clean:
      clean: ['.grunt-tmp', '.sass-cache', '**/.DS_Store']

    # file watcher
   
    watch:
      html:
        files: ['templates/*.jade', 'includes/*.jade', '*.md']
        tasks: ['jade', 'md2html']
      js:
        files: 'coffeescript/*.coffee'
        tasks: ['coffee', 'concat', 'uglify']
      css:
        files: 'sass/*.sass'
        tasks: ['sass', 'cssmin',]
      images:
        files: 'imgs/*.*'
        tasks: ['copy']
      cleanup:
        files: ['public_html/*.min.js', 'public_html/*.min.css']
        tasks: 'clean'

  grunt.initConfig settings

  default_tasks = [
    'jade', 'md2html',
    'coffee', 'concat', 'uglify',
    'sass', 'cssmin',
    'copy',
    'clean'
  ]
  grunt.registerTask 'default', default_tasks

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-md2html'
