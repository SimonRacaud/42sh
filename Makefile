##
## EPITECH PROJECT, 2020
## Project_2020
## File description:
## Project makefile
##

DSRC	=	./src/
DCMD 	=	cmd
DMINI 	=	minishell
DTOOL 	=	tool

SRC	=	$(DSRC)main.c									\
		$(DSRC)$(DMINI)/minishell_create_destroy.c		\
		$(DSRC)$(DMINI)/minishell_exit.c				\
		$(DSRC)$(DMINI)/minishell_run.c					\
		$(DSRC)$(DMINI)/prompt.c						\
		$(DSRC)$(DCMD)/minishell_exec_cmd.c				\
		$(DSRC)$(DCMD)/binary/exec_cmd_bin.c			\
		$(DSRC)$(DCMD)/binary/get_bin_path.c			\
		$(DSRC)$(DCMD)/binary/check_access_right_file.c	\
		$(DSRC)$(DCMD)/binary/get_bin_path_search_bin.c	\
		$(DSRC)$(DCMD)/shell/exec_cmd_shell.c			\
		$(DSRC)$(DCMD)/shell/cmd/my_exit.c				\
		$(DSRC)$(DCMD)/shell/cmd/my_clear.c				\
		$(DSRC)$(DCMD)/shell/cmd/my_pwd.c				\
		$(DSRC)$(DCMD)/shell/cmd/my_env.c				\
		$(DSRC)$(DCMD)/shell/cmd/my_unsetenv.c			\
		$(DSRC)$(DCMD)/shell/cmd/my_setenv.c			\
		$(DSRC)$(DCMD)/shell/cmd/my_cd/my_cd.c			\
		$(DSRC)$(DCMD)/shell/cmd/my_cd/test_path.c  	\
		$(DSRC)$(DCMD)/shell/cmd/my_cd/get_path.c 		\
		$(DSRC)$(DCMD)/shell/cmd/show_exit_status.c		\
		$(DSRC)$(DTOOL)/display_path_without_homepath.c	\
		$(DSRC)$(DTOOL)/merge_path_filename.c			\
		$(DSRC)$(DTOOL)/word_array_search.c				\
		$(DSRC)$(DTOOL)/tool.c							\
		$(DSRC)$(DTOOL)/my_str_count_pattern.c			\
		$(DSRC)$(DTOOL)/my_str_count_char_suite.c		\
		$(DSRC)entry/minishell_exec.c					\
		$(DSRC)entry/pipe/minishell_exec_piped.c		\
		$(DSRC)entry/pipe/pipe_process_cmd.c			\
		$(DSRC)entry/pipe/pipe_process_cmd_last.c		\
		$(DSRC)entry/split_entry.c						\
		$(DSRC)entry/cmd_process.c						\
		$(DSRC)entry/cmd_create_destroy.c				\
		$(DSRC)entry/check_entry.c						\
		$(DSRC)entry/check_pos_redirect.c				\
		$(DSRC)entry/parse_command/command_parse_tool.c		\
		$(DSRC)entry/parse_command/command_parse.c			\
		$(DSRC)entry/parse_command/command_to_word_array.c	\
		$(DSRC)entry/parse_command/command_format.c			\
		$(DSRC)entry/parse_command/check_command.c			\
		$(DSRC)entry/parse_command/split_word_array.c		\
		$(DSRC)entry/parse_command/is_invalid_redirection.c	\
		$(DSRC)entry/redirect/do_redirection.c				\
		$(DSRC)entry/redirect/redirect_open_file.c			\
		$(DSRC)entry/redirect/redirect_stdin_to_command.c	\

SRC_UT =	tests_unit/test_minishell.c								\
			$(DSRC)entry/parse_command/command_format.c			\
			$(DSRC)entry/parse_command/command_parse_tool.c		\
			$(DSRC)entry/parse_command/command_to_word_array.c	\

OBJ	=	$(SRC:.c=.o)

NAME	=	mysh

CFLAGS	+= -Wall -Wextra -W $(INCLUDE) -g # -Werror

INCLUDE = -I./include -I./lib/my/include

all:  lib $(NAME)

$(NAME): $(OBJ)
	make -C ./lib/my
	@gcc -o $(NAME) $(OBJ) -L./lib/my -lmy && \
		$(ECHO) $(BOLD_T)$(GREEN_C)"\n[✔] COMPILED:" $(DEFAULT)$(LIGHT_GREEN) "$(NAME)\n"$(DEFAULT) || \
		$(ECHO) $(BOLD_T)$(RED_C)"[✘] "$(UNDLN_T)"BUILD FAILED:" $(LIGHT_RED) "$(NAME)\n"$(DEFAULT)

lib:
	make -C ./lib/my

lib_re:
	make re -C ./lib/my

lib_fclean:
	make fclean -C lib/my

clean:
	rm -f  $(OBJ)
	rm -f *.gcda
	rm -f *.gcno

fclean:	clean
	rm -f $(NAME)

re:	fclean all

reall:	fclean all lib_re

tests_run:
	gcc -o $(NAME) $(SRC_UT) $(INCLUDE) -L./lib/my -lmy -lcriterion --coverage && ./$(NAME)

.PHONY :        clean fclean re

ECHO	=	/bin/echo -e
DEFAULT	=	"\e[0m"
BOLD_T	=	"\e[1m"
DIM_T	=	"\e[2m"
UNDLN_T	=	"\e[4m"
BLACK_C	=	"\e[30m"
RED_C	=	"\e[31m"
GREEN_C	=	"\e[32m"
YELLO_C	=	"\e[33m"
BLUE_C	=	"\e[34m"
MAGEN_C	=	"\e[35m"
CYAN_C	=	"\e[36m"
WHITE_C	=	"\e[97m"
DEFAULT_C	=	"\e[39m"
LINE_RETURN	=	$(ECHO) ""
