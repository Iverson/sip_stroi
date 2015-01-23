'use strict';

module.exports = function(grunt) {
  grunt.loadNpmTasks('node-spritesheet');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    spritesheet: {
    	desktop: {
    		options: {
	            outputImage: 'app/assets/images/sprite.png',
	            outputCss: 'app/assets/stylesheets/sprite.scss',
              httpImagePath: 'sprite.png',
	            selector: '.b-icon',
              pngcrush: true
	        },
	        files: {
	        	'': 'app/assets/images/icons/**/*'
	        }
	    }
    },

    watch: {
      images: {
        files: ['images/icons/**/*'],
        tasks: ['sprites'],
        options: {
          spawn: false,
        },
      }
    }
  });


  grunt.registerTask('default', ['build']);
  grunt.registerTask('sprites', ['spritesheet']);
  grunt.registerTask('build', []);

};