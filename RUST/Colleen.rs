fn	print()
{
	let	s = "fn\tprint()\n{{\n\tlet\ts = {0:?};\n\tprintln!({0:?}, s);\n}}\n/*\n *\tComment outside of main\n */\nfn\tmain()\n{{\n\t/*\n\t *\tComment in main\n\t */\n\tprint();\n}}";
	println!("fn\tprint()\n{{\n\tlet\ts = {0:?};\n\tprintln!({0:?}, s);\n}}\n/*\n *\tComment outside of main\n */\nfn\tmain()\n{{\n\t/*\n\t *\tComment in main\n\t */\n\tprint();\n}}", s);
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
