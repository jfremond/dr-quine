#include <stdio.h>
void	function() {}
/*
	comment outside of main
*/
int	main()
{
	/*
		comment in main
	*/
	char *s = "#include <stdio.h>%cvoid	function() {}%c/*%c	comment outside of main%c*/%cint	main()%c{%c	/*%c		comment in main%c	*/%c	char *s = %c%s%c;%c	function();%c	printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10);%c}%c";
	function();
	printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10);
}
