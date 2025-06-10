#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

# define MAIN main(){}
int	main()
{
	char *s = "caca";
	int file = open("Grace_kid.c", O_CREAT | O_RDWR);
	if (file == -1)
		return(-1);
	else
		write(file, s, strlen(s));
}
