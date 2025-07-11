# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/23 18:46:45 by jfremond          #+#    #+#              #
#    Updated: 2025/07/11 18:54:48 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

###################
#   EXECUTABLES   #
###################

COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

################
#   COMMANDS   #
################

CC		=		rustc
RM		=		/bin/rm -rf

###############
#   SOURCES   #
###############

SRCS_C	=	Colleen.rs
SRCS_G	=	Grace.rs
SRCS_S	=	Sully.rs

#############
#   RULES   #
#############

all:			$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):		$(SRCS_C)
				$(CC) $(SRCS_C)

$(GRACE):		$(SRCS_G)
				$(CC) $(SRCS_G)

$(SULLY):		$(SRCS_S)
				$(CC) $(SRCS_S)

clean:
				$(RM) Grace_kid.rs  Sully_*

fclean:			clean
				$(RM) $(COLLEEN) $(GRACE) $(SULLY)

re:				fclean all

.PHONY:			all clean fclean re
