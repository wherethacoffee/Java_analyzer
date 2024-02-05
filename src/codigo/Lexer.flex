package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( entero | caracteres | logico | lista | decimal ) {lexeme=yytext(); return T_dato;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Diagonal */
( "/" ) {lexeme=yytext(); return Diagonal;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Marcador de inicio de codigo */
( "main" ) {lexeme=yytext(); return Main;}

/* Dos puntos*/
( ":" ) {lexeme=yytext(); return Dos_puntos;}

/* Doble dos puntos */
( "::" ) {lexeme=yytext(); return Dd_puntos;}

/* Coma */
( "," ) {lexeme=yytext(); return Coma;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Operadores logicos */
( ":=:" | "&&" | "||" | "+}" | "-}" | "*}" | "/}" | "<<" | ">>" | "<:=" | ">:=" | "=:=" | "!:=" | "<" | ">" ) {lexeme=yytext(); return Op_logico;}

/* Palabras Reservadas */
(variables | identificador | bloque | inicio | final | regresar | mientras | ciclo | repitiendo | condicion | para | en | imprimir | longitud | imprimiendo | absolute | leyendo | real | cadena | ordenar | texto | sino | default | rango | redondear | mayuscula | minuscula) {lexeme=yytext(); return P_reservada;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}