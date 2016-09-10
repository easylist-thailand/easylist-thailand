const fs = require('fs');

const gulp = require('gulp');
const concat = require('gulp-concat-util');

const EOL = require('os').EOL;

gulp.task('clean', (done) => {
	fs.unlink('subscriptions/easylist-thailand.txt', () => {
		done(); // Ignore unlink error.
	});
});

gulp.task('concat', ['clean'], () => {
	let header = fs.readFileSync('headers/easylist-thailand-header.txt');
	header += EOL;
	return gulp.src('categories/*')
			.pipe(concat('easylist-thailand.txt'))
			.pipe(concat.header(header))
			.pipe(gulp.dest('subscriptions'));
});

gulp.task('default', ['concat']);
