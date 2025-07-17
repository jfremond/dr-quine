use	std::process::Command;
use	std::fs::File;
use	std::io::Write;

macro_rules!	string_to_write {
	($data:expr, $val:expr) => {
		format!("use\tstd::process::Command;\nuse\tstd::fs::File;\nuse\tstd::io::Write;\n\nmacro_rules!\tstring_to_write {{\n\t($data:expr, $val:expr) => {{\n\t\tformat!({0:?}, $data, $val)\n\t}};\n}}\n\nfn\tmain() {{\n\tlet mut\tindex = {1:?};\n\tif index <= 0 {{\n\t\treturn ;\n\t}}\n\tlet\tfilename = file!();\n\tif filename.contains('_') {{\n\t\tindex = index - 1;\n\t}}\n\tlet\tchild_filename = format!(\"Sully_{{}}.rs\", index);\n\tlet\tchild_prog = format!(\"Sully_{{}}\", index);\n\n\tlet\tfile = File::create(child_filename.clone());\n\tlet\tstring = string_to_write!({0:?}, index);\n\tlet\t_ = file.expect(\"Error\").write(string.as_bytes());\n\n\tlet mut\tcompile = Command::new(\"rustc\");\n\tcompile.arg(child_filename);\n\tlet\t_ = compile.status();\n\tlet mut\texec = Command::new(format!(\"./{{}}\", child_prog));\n\tlet\t_ = exec.status();\n}}\n", $data, $val)
	};
}

fn	main() {
	let mut	index = 5;
	if index <= 0 {
		return ;
	}
	let	filename = file!();
	if filename.contains('_') {
		index = index - 1;
	}
	let	child_filename = format!("Sully_{}.rs", index);
	let	child_prog = format!("Sully_{}", index);

	let	file = File::create(child_filename.clone());
	let	string = string_to_write!("use\tstd::process::Command;\nuse\tstd::fs::File;\nuse\tstd::io::Write;\n\nmacro_rules!\tstring_to_write {{\n\t($data:expr, $val:expr) => {{\n\t\tformat!({0:?}, $data, $val)\n\t}};\n}}\n\nfn\tmain() {{\n\tlet mut\tindex = {1:?};\n\tif index <= 0 {{\n\t\treturn ;\n\t}}\n\tlet\tfilename = file!();\n\tif filename.contains('_') {{\n\t\tindex = index - 1;\n\t}}\n\tlet\tchild_filename = format!(\"Sully_{{}}.rs\", index);\n\tlet\tchild_prog = format!(\"Sully_{{}}\", index);\n\n\tlet\tfile = File::create(child_filename.clone());\n\tlet\tstring = string_to_write!({0:?}, index);\n\tlet\t_ = file.expect(\"Error\").write(string.as_bytes());\n\n\tlet mut\tcompile = Command::new(\"rustc\");\n\tcompile.arg(child_filename);\n\tlet\t_ = compile.status();\n\tlet mut\texec = Command::new(format!(\"./{{}}\", child_prog));\n\tlet\t_ = exec.status();\n}}\n", index);
	let	_ = file.expect("Error").write(string.as_bytes());

	let mut	compile = Command::new("rustc");
	compile.arg(child_filename);
	let	_ = compile.status();
	let mut	exec = Command::new(format!("./{}", child_prog));
	let	_ = exec.status();
}
