/*
** EPITECH PROJECT, 2020
** PSU_42sh_2019
** File description:
** parser
*/

#ifndef T_PARSER_H_
#define T_PARSER_H_

#define EXIT_ERROR 84

typedef enum id {
    ID_WIHOUT,
    ID_SPACE,
    ID_TAB,
    ID_DOUBLE_QUOTE,
    ID_SIMPLE_QUOTE,
    ID_BACK_QUOTE,
    ID_PARENTHESE,
    ID_REDIRECTION,
    ID_DOUBLE_RIGHT,
    ID_RIGHT,
    ID_DOUBLE_LEFT,
    ID_LEFT,
    ID_OR,
    ID_AND,
    ID_SEP,
    ID_PIPE,
    ID_BACKGROUND,
    ID_IGNORE
} ID;

typedef enum type {
    D_NORMAL,
    D_DELIM,
    D_GET,
    D_SEPARATOR
} TYPE;

typedef struct parser_s {
    char *start;
    char *end;
    TYPE type;
    ID id;
} parser_t;

typedef struct token_s {
    char *token;
    ID id;
    TYPE type;
    struct token_s *next;
    struct token_s *prev;
} token_t;

#endif /* !PARSER_H_ */
