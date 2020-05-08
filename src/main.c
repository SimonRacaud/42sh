/*
** EPITECH PROJECT, 2020
** PSU_42sh_2019
** File description:
** main function
*/

#include "shell.h"

int main(int argc, char **argv, char **env)
{
    shell_t minishell;
    int ret;

    (void)argc;
    (void)argv;
    if (shell_create(&minishell, env)) {
        return EXIT_ERROR;
    } else {
        ret = shell_run(&minishell);
        shell_destroy(&minishell);
        return ret;
    }
}
