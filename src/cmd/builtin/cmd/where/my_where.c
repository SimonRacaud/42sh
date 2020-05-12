/*
** EPITECH PROJECT, 2020
** PSU_42sh_2019
** File description:
** Created: 2020-05-12T14:06:13+02:00 | Author: simon
*/

#include "shell.h"

extern const char *BUILTIN_NAME[];

static const char *ERR_FEW_ARG = "where: Too few arguments.";
static const char *INFO_BUILTIN = " is a shell built-in";
const char *ERR_NO_SENSE = "where: / in command makes no sense";

static bool is_builtin_cmd(const char *cmd_name)
{
    for (size_t i = 0; BUILTIN_NAME[i] != NULL; i++) {
        if (strcmp(BUILTIN_NAME[i], cmd_name) == 0) {
            printf("%s%s\n", cmd_name, INFO_BUILTIN);
            return true;
        }
    }
    return false;
}

static int process_command_name(const char *cmd_name, shell_t *shell,
bool *not_found)
{
    if (is_builtin_cmd(cmd_name) == true) {
        return EXIT_SUCCESS;
    }
    if (where_show_all_path(cmd_name, shell) == EXIT_ERROR) {
        *not_found = true;
    }
    return EXIT_SUCCESS;
}

int my_where(char **cmd, shell_t *shell)
{
    bool not_found = false;

    if (word_array_len(cmd) == 1) {
        shell->exit_status = ERROR_STATUS;
        printf("%s\n", ERR_FEW_ARG);
        return EXIT_SUCCESS;
    }
    for (size_t i = 1; cmd[i] != NULL; i++) {
        if (process_command_name(cmd[i], shell, &not_found) != EXIT_SUCCESS) {
            return EXIT_ERROR;
        }
    }
    if (not_found == true) {
        shell->exit_status = ERROR_STATUS;
    } else {
        shell->exit_status = SUCCESS_STATUS;
    }
    return EXIT_SUCCESS;
}
