use	std::fs::File;
use	std::io::Write;

/*
 *	Using macros here
 */

macro_rules!	open_and_write_in_file {
	($val:expr) => {
		let	f = File::create("Grace_kid.rs");
		let	_ = f.expect("Error").write($val.as_bytes());
	};
}

macro_rules!	string_to_write {
	($data:expr) => {
		format!("use\tstd::fs::File;\nuse\tstd::io::Write;\n\n/*\n *\tUsing macros here\n */\n\nmacro_rules!\topen_and_write_in_file {{\n\t($val:expr) => {{\n\t\tlet\tf = File::create(\"Grace_kid.rs\");\n\t\tlet\t_ = f.expect(\"Error\").write($val.as_bytes());\n\t}};\n}}\n\nmacro_rules!\tstring_to_write {{\n\t($data:expr) => {{\n\t\tformat!({0:?}, $data)\n\t}};\n}}\n\nmacro_rules!\texec {{\n\t() => {{\n\t\tfn\tmain() {{\n\t\t\topen_and_write_in_file!(string_to_write!({0:?}));\n\t\t}}\n\t}};\n}}\n\nexec!();\n", $data)
	};
}

macro_rules!	exec {
	() => {
		fn	main() {
			open_and_write_in_file!(string_to_write!("use\tstd::fs::File;\nuse\tstd::io::Write;\n\n/*\n *\tUsing macros here\n */\n\nmacro_rules!\topen_and_write_in_file {{\n\t($val:expr) => {{\n\t\tlet\tf = File::create(\"Grace_kid.rs\");\n\t\tlet\t_ = f.expect(\"Error\").write($val.as_bytes());\n\t}};\n}}\n\nmacro_rules!\tstring_to_write {{\n\t($data:expr) => {{\n\t\tformat!({0:?}, $data)\n\t}};\n}}\n\nmacro_rules!\texec {{\n\t() => {{\n\t\tfn\tmain() {{\n\t\t\topen_and_write_in_file!(string_to_write!({0:?}));\n\t\t}}\n\t}};\n}}\n\nexec!();\n"));
		}
	};
}

exec!();
