def	my_print():
	s_format	= "def	my_print():{1}	s_format	= {2}{0}{2}{1}	s	= s_format.format(s_format, chr(10), chr(34), chr(39)){1}	print(s){1}{1}{1}{2}{2}{2}{1}Comment outside of main{1}{2}{2}{2}{1}def	main():{1}	my_print(){1}{1}{1}if	__name__ == {3}__main__{3}:{1}	{2}{2}{2}{1}	Comment in main{1}	{2}{2}{2}{1}	main()"
	s	= s_format.format(s_format, chr(10), chr(34), chr(39))
	print(s)


"""
Comment outside of main
"""
def	main():
	my_print()


if	__name__ == '__main__':
	"""
	Comment in main
	"""
	main()
