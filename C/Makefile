# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 09:53:01 by jfremond          #+#    #+#              #
#    Updated: 2025/06/10 13:18:29 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

###################
#   EXECUTABLES   #
###################

COLLEEN	=	Colleen
GRACE	=	Grace

################
#   COMMANDS   #
################

CC		=		clang
LINK	=		clang
MKDIR	=		/bin/mkdir -p
RM		=		/bin/rm -rf

#############
#   FLAGS   #
#############

CFLAGS	=	-c -Wall -Wextra -Werror -g3
CFLAGS	+=	-MMD -MP

###################
#   DIRECTORIES   #
###################

OBJS_D	=	objs/

###############
#   SOURCES   #
###############

SRCS_C	=	colleen.c
SRCS_G	=	grace.c

###############
#   OBJECTS   #
###############

OBJS_C = $(SRCS_C:%.c=$(OBJS_D)%.o)
OBJS_G = $(SRCS_G:%.c=$(OBJS_D)%.o)

####################
#   DEPENDENCIES   #
####################

DEPS_C = $(OBJS_C:.o=.d)
DEPS_G = $(OBJS_G:.o=.d)

#############
#   RULES   #
#############

all:			$(COLLEEN) $(GRACE)

$(COLLEEN):		$(OBJS_C)
				$(LINK) $(OBJS_C) -o $@

$(GRACE):		$(OBJS_G)
				$(LINK) $(OBJS_G) -o $@


$(OBJS_D)%.o:%.c
				$(MKDIR) $(@D)
				$(CC) $(CFLAGS) $(OUTPUT_OPTION) $<

clean:
				$(RM) $(OBJS_D)
				$(RM) Grace_kid.c

fclean:			clean
				$(RM) $(COLLEEN) $(GRACE)

re:				fclean all

.PHONY:			all clean fclean re

-include		$(DEPS_C) $(DEPS_G)