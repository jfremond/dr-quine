#include <stdio.h>
void	print()
{
	char *s = "#include <stdio.h>%1$cvoid	print()%1$c{%1$c	char *s = %2$c%3$s%2$c;%1$c	printf(s, 10, 34, s);%1$c}%1$c/*%1$c	comment outside of main%1$c*/%1$cint	main()%1$c{%1$c	/*%1$c		comment in main%1$c	*/%1$c	print();%1$c}%1$c";
	printf(s, 10, 34, s);
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
