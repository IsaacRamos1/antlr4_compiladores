grammar teste_gram2022;

programa: listaComando;

exprAritmetica: exprAritmetica '+' termoAritmetico
    | exprAritmetica '-' termoAritmetico
    | fatorAritmetico;

termoAritmetico: termoAritmetico '*' fatorAritmetico
    | termoAritmetico '/' fatorAritmetico
    | fatorAritmetico;

fatorAritmetico: INT | FLOAT | ID | '(' exprAritmetica ')';

exprRelacional: exprRelacional operadorBooleano termoRelacional
    | termoRelacional;

termoRelacional: exprAritmetica ('==' | '<' | '>' | '<=' | '>=' | '!=') exprAritmetica
    | '(' exprRelacional ')';

operadorBooleano: 'and' | 'or';

listaComando: comando listaComando
    | comando;

comando: atrib
    | entrada
    | saida
    | condicao
    | repeticao;

atrib: ('int' | 'float') ID SB exprAritmetica ';'
    | 'bool' ID SB ('True' | 'False') ';'
    | ID SB CADEIA
    ;
entrada: 'input(' ID ')' ';'
    | ID
    | INT
    | FLOAT
    ;
saida: 'print' '(' (ID | CADEIA) ')' ';'
    ;

condicao: 'if' exprRelacional '{' comando '}' ';'
    | 'if' exprRelacional '{' comando '}' 'else' '{' comando '}' ';'
    | 'if' exprRelacional '{' comando '}' 'elif' '{' comando '}' 'else' '{' comando '}' ';'
    ;

repeticao: 'for' ID 'in range' '(' INT ',' INT ')' '{' comando '}' ';'
    | 'for' ID 'in range' '(' INT ')' '{' comando '}' ';'                       // break opcional
    | 'for' ID 'in range' '(' INT ':' INT ')' '{' comando '}' ';'
    | 'for' ID 'in range' '(' INT ':' INT ':' INT ')' '{' comando '}' ';'
    | 'while' exprRelacional '{' comando '}' ';'
    | 'do' '{' comando '}' 'while' '{' exprRelacional '}' ';'
    | 'do' '{' comando '}' ';'
    ;

PR: 'for'|'in'|'range'|'None'|'and'|'or'|'not'|'if'|'else'|'elsif'
    |'while'|'do'|'continue'|'break'|'input'|'main'|'def'|'float'|'int'
    |'bool'|'string'|'class'|'as'|'try'|'catch'|'exception'|'import'|'from'|'return'
    |'list'|'dict'|'tuple'|'print';

ID: [a-zA-Z][a-zA-Z0-9]*;
INT: [0-9]*;
FLOAT: [0-9]+[.][0-9]*;
CADEIA: '"' [a-zA-Z][a-zA-Z0-9]* '"';
BOOL: 'True' | 'False';

SB: '"'|'?'|'/'|'!'|'#'|'%'|'+'|'-'|'*'|'='|'=='|'<'|'>'|'('|')'|'['|']'|'{'
    |'}'|'<='|'>='|'!='|'**'|':'|';'|','|'.';

WS: [ \t\r\n] -> skip;