/*
** EPITECH PROJECT, 2020
** PSU_minishell2_2019
** File description:
** minishell main function
*/

#include "shell.h"

int minishell_create(shell_t *shell, char **env)
{
    if (my_env_create(&shell->env, env) != EXIT_SUCCESS) {
        return EXIT_ERROR;
    }
    shell->prev_path = NULL;
    shell->exit = false;
    shell->exit_status = EXIT_SUCCESS;
    shell->fd.stdin = dup(0);
    shell->fd.stdout = dup(1);
    shell->fd.prev_pipein = -1;
    if (shell->fd.stdin == -1 || shell->fd.stdout == -1) {
        return puterr("dup : fail\n", EXIT_ERROR);
    }
    return EXIT_SUCCESS;
}

int minishell_destroy(shell_t *shell)
{
    my_env_destroy(&shell->env);
    free(shell->prev_path);
    close(shell->fd.stdin);
    close(shell->fd.stdout);
    return EXIT_SUCCESS;
}
