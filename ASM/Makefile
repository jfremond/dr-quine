# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 09:53:01 by jfremond          #+#    #+#              #
#    Updated: 2025/06/15 00:08:32 by jfremond         ###   ########.fr        #
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

ASM		=		nasm
LINK	=		gcc
MKDIR	=		/bin/mkdir -p
RM		=		/bin/rm -rf

#############
#   FLAGS   #
#############

ASMFLAGS	=	-f elf64 -g -gdwarf

###################
#   DIRECTORIES   #
###################

OBJS_D	=	objs/

###############
#   SOURCES   #
###############

SRCS_C	=	Colleen.s
SRCS_G	=	Grace.s
SRCS_S	=	Sully.s

###############
#   OBJECTS   #
###############

OBJS_C = $(SRCS_C:%.s=$(OBJS_D)%.o)
OBJS_G = $(SRCS_G:%.s=$(OBJS_D)%.o)
OBJS_S = $(SRCS_S:%.s=$(OBJS_D)%.o)

####################
#   DEPENDENCIES   #
####################

DEPS_C = $(OBJS_C:.o=.d)
DEPS_G = $(OBJS_G:.o=.d)
DEPS_S = $(OBJS_S:.o=.d)

#############
#   RULES   #
#############

all:			$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):		$(OBJS_C)
				$(LINK) $(OBJS_C) -o $@

$(GRACE):		$(OBJS_G)
				$(LINK) $(OBJS_G) -o $@

$(SULLY):		$(OBJS_S)
				$(LINK) $(OBJS_S) -o $@

$(OBJS_D)%.o:%.s
				$(MKDIR) $(@D)
				$(ASM) $(ASMFLAGS) $(OUTPUT_OPTION) $<

clean:
				$(RM) $(OBJS_D)
				$(RM) Grace_kid.s Sully_*

fclean:			clean
				$(RM) $(COLLEEN) $(GRACE) $(SULLY)

re:				fclean all

.PHONY:			all clean fclean re

-include		$(DEPS_C) $(DEPS_G) $(DEPS_S)
