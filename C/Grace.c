#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
/*
	This is a comment
*/
#define STR "#include <unistd.h>%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c/*%1$c	This is a comment%1$c*/%1$c#define STR %2$c%3$s%2$c%1$c#define FD (fd ? fd : (fd = open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY | O_TRUNC, 0600)))%1$c#define MAIN int main() {int fd = 0; dprintf(FD, STR, 10, 34, STR); close(FD);}%1$c%1$cMAIN;%1$c"
#define FD (fd ? fd : (fd = open("Grace_kid.c", O_CREAT | O_WRONLY | O_TRUNC, 0600)))
#define MAIN int main() {int fd = 0; dprintf(FD, STR, 10, 34, STR); close(FD);}

MAIN;
