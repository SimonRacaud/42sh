/*
** EPITECH PROJECT, 2020
** PSU_42sh_2019
** File description:
** Created: 2020-05-18T11:08:45+02:00 | Author: simon
*/

#ifndef SUBST_VAR_H
#define SUBST_VAR_H

bool is_command_name(token_t *token);
int try_subst_alias(token_t *tok, shell_t *shell);

int try_subst_variable(token_t *tok, shell_t *shell);

// MAIN FUNCTIONS
int substr_variables(shell_t *shell, cmd_t *cmd);

#endif
