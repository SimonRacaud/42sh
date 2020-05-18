/*
** EPITECH PROJECT, 2020
** PSU_42sh_2019
** File description:
** Created: 2020-05-18T10:21:27+02:00 | Author: simon
*/

#include "shell.h"

int substr_variables(shell_t *shell, cmd_t *cmd)
{
    for (token_t *ptr = cmd->begin; ptr != NULL; ptr = ptr->next) {
        if (is_command_name(ptr) == true
            && try_subst_alias(ptr, shell) == EXIT_ERROR) {
            return EXIT_FAIL;
        }
        if (try_subst_variable(ptr, shell) == EXIT_ERROR) {
            return EXIT_FAIL;
        }
    }
    return EXIT_SUCCESS;
}
