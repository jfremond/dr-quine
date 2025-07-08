/*
 *	This is a comment
 */
// macro_rules! caca {
// 	() => {
// 		println!("caca");
// 	};
// }

// macro_rules! caca1 {
// 	($val:expr) => {
// 		println!("{}", $val);
// 	};
// }


// fn	main() {
// 	caca!();
// 	caca1!("pipi");
// }

use	std::fs::File;
use	std::io::Write;
/*
 *	Using macros here
 */
macro_rules!	open_file {
	() => {
		let	f = File::create("Grace_kid.rs");
		// let	file_content = b"Grace_kid.rs and caca";
		// let	_ = f.expect("Error").write(file_content);
		return f;
	};
}

macro_rules!	write_file {
	($val:expr) => {
		let	s = b"ceci est un test";
		let	_ = $val.expect("Error").write(s);
	}
}

macro_rules!	exec {
	() => {
		fn	main() {
			open_file!();
			write_file!();
		}
	}
}

exec!();
