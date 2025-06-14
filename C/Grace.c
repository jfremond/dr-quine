#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
/*
	This is a comment
*/
#define STR "#include <stdio.h>%1$c#include <fcntl.h>%1$c/*%1$c	This is a comment%1$c*/%1$c#define STR %2$c%3$s%2$c%1$c#define FILE open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY | O_TRUNC, 0600)%1$c#define MAIN int main() {dprintf(FILE, STR, 10, 34, STR); close(FILE);}%1$c%1$cMAIN;%1$c"
#define FILE open("Grace_kid.c", O_CREAT | O_WRONLY | O_TRUNC, 0600)
#define MAIN int main() {dprintf(FILE, STR, 10, 34, STR); close(FILE);}

MAIN;
