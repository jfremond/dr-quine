def	string() -> str:
	s_format = "def	string() -> str:{1}	s_format = {2}{0}{2}{1}	s	= s_format.format(s_format, chr(10), chr(34), chr(39)){1}	return s{1}{1}{1}def	open_and_write(string: str):{1}	with open('Grace_kid.py', 'w+') as file:{1}		file.write(string){1}{1}{1}def	run():{1}	my_string = string(){1}	open_and_write(my_string){1}{1}{1}run(){1}"
	s	= s_format.format(s_format, chr(10), chr(34), chr(39))
	return s


def	open_and_write(string: str):
	with open('Grace_kid.py', 'w+') as file:
		file.write(string)


def	run():
	my_string = string()
	open_and_write(my_string)


run()
