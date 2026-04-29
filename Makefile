# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/23 18:46:45 by jfremond          #+#    #+#              #
#    Updated: 2026/01/10 13:24:33 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

###################
#   DIRECTORIES   #
###################

C		=	C
ASM		=	ASM
RUST	=	RUST

#############
#   RULES   #
#############

all:
			make -C ${C}
			make -C ${ASM}
			make -C ${RUST}

clean:
			${MAKE} clean -C ${C}
			${MAKE} clean -C ${ASM}
			${MAKE} clean -C ${RUST}

fclean:
			${MAKE} fclean -C ${C}
			${MAKE} fclean -C ${ASM}
			${MAKE} fclean -C ${RUST}

re:			fclean all

.PHONY:		all clean fclean re
