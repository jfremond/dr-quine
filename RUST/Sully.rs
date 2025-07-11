fn	main() {
	let this_file = file!();
	println!("defined in file: {this_file}");
	if this_file.contains('_') {
		println!("'_' in filename");
	}
	else {
		println!("No '_' in filename");
	}
}