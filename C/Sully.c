#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
int	main()
{
	int	i = 5;
	if (--i >= 0)
	{
		char	name[10];
		char	cmd[100];
		char	exec_cmd[10];
		sprintf(name, "Sully_%d.c", i);
		sprintf(cmd, "clang -Wall -Wextra -Werror -o Sully_%1$d Sully_%1$d.c%2$c", i, 10);
		printf("%s\n", cmd);
		sprintf(exec_cmd, "./Sully_%d", i);
		printf("%s\n", exec_cmd);
		int	file = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0600);
		char *s = "#include <unistd.h>%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$cint	main()%1$c{%1$c	int	i = %4$d;%1$c	if (--i >= 0)%1$c	{%1$c		char	name[10];%1$c		char	cmd[100];%1$c		char	exec_cmd[10];%1$c		sprintf(name, %2$cSully_%%d.c%2$c, i);%1$c		sprintf(cmd, %2$cclang -Wall -Wextra -Werror -o Sully_%%1$d Sully_%%1$d.c%%2$c%2$c, i, 10);%1$c		sprintf(exec_cmd, %2$c./Sully_%%d%2$c, i);%1$c		int	file = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0600);%1$c		char *s = %2$c%3$s%2$c;%1$c		dprintf(file, s, 10, 34, s, i);%1$c		close(file);%1$c		system(cmd);%1$c		system(exec_cmd);%1$c	}%1$c}%1$c";
		dprintf(file, s, 10, 34, s, i);
		close(file);
		system(cmd);
		system(exec_cmd);
		
	}
}
