fn	print()
{
	let s = "";
	print!("{}", format!("fn	print(){0}{{{0}	print!({1}{{}}{1}, format!({1}{:?}{1})){0}}}{0}", "\n", '"'));
}
/*
*	Comment outside of main
*/
fn	main()
{
	/*
	*	Comment in main
	*/
	print();
}
