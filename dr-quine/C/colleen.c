#include <stdio.h>
void	print()
{
	char *s = "#include <stdio.h>%cvoid	print()%c{%c	char *s = %c%s%c;%c	printf(s, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c/*%c	comment outside of main%c*/%cint	main()%c{%c	/*%c		comment in main%c	*/%c	print();%c}%c";
	printf(s, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}
/*
	comment outside of main
*/
int	main()
{
	/*
		comment in main
	*/
	print();
}
