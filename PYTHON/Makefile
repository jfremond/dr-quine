# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 09:53:01 by jfremond          #+#    #+#              #
#    Updated: 2025/06/15 01:19:25 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #




# Compile Python script to executable
hello: test.py
	pyinstaller --onefile --name hello test.py
	cp dist/hello ./hello

# Run the executable
run: hello
	./hello

# Clean build artifacts
clean:
	rm -rf build/ dist/ __pycache__/ *.spec hello

# Phony targets
.PHONY: run clean
