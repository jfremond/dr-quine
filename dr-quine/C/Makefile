# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 09:53:01 by jfremond          #+#    #+#              #
#    Updated: 2025/06/10 10:07:49 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

##################
#   EXECUTABLE   #
##################

NAME	=	Colleen

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

SRCS	=	colleen.c

###############
#   OBJECTS   #
###############

OBJS	=		$(SRCS:%.c=$(OBJS_D)%.o)

####################
#   DEPENDENCIES   #
####################

DEPS	=		$(OBJS:.o=.d)

#############
#   RULES   #
#############

all:			$(NAME)

$(NAME):		$(OBJS)
				$(CC) $(OBJS) -o $(NAME)

-include		$(DEPS)

$(OBJS_D)%.o:%.c
				$(MKDIR) $(@D)
				$(CC) $(CFLAGS) $(OUTPUT_OPTION) $<

clean:
				$(RM) $(OBJS_D)

fclean:			clean
				$(RM) $(NAME)

re:				fclean all

.PHONY:			all clean fclean re