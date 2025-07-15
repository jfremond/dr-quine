use	std::process::Command;
use	std::fs::File;
use	std::io::Write;

macro_rules!	string_to_write {
	($data:expr) => {
		format!("use\tstd::process::Command\nuse\tstd::fs::File", $data)
	};
}

fn	main() {
	let mut index = 5;
	let filename = file!();
	if filename.contains('_') {
		index = index - 1;
	}
	let child_filename = format!("Sully_{}.rs", index);
	let	child_prog = format!("Sully_{}", index);

	let file = File::create(child_filename);
	let string = string_to_write!();
	let _ = file.expect("Error").write(string.as_bytes());

	// let mut compile = Command::new("rustc");
	// compile.arg(child_filename);
	// let _ = compile.status();
	// let mut exec = Command::new(format!("./{}", child_prog));
	// let _ = exec.status();
}
