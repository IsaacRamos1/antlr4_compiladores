//grammar expr2022;
grammar expr2022;

prog: listaComando;


// -------------- corpo da linguagem ------------
listaComando: global funcao* blocoMain;

funcao: 'def' ID '(' params ')' tipo '{' decVars* atribSemTipo* comandos* return* '}' //listaComando* '}'
    ;

blocoMain: 'def' 'main' '(' ')' '{' decVars* comandos* return*'}'
    ;
// ---------------------------------------------

global: decVars*; // variaveis globais

comandos: entrada ';'
    | saida ';'
    | condicao
    | chamadaFunc ';'
    | repeticao
    ;

// ------------------------------------ declaração de variáveis
decVars: declaracao ';' // int a;
    | declaracao ',' cadeiaVars ';' // int a, b, c;
    | declaracao '=' (CADEIA|exprAritmetica|exprRelacional|entrada) ';' // int a = 10;
    | declaracao '=' (CADEIA|exprAritmetica|exprRelacional) ',' listaAtrib ';' // int a = 10, b = 10;
    | declaracao ',' decVars SB cadeia ';' // int a, b, c, d;
    ;
// ----------------------------------------------

atribSemTipo: ID '=' (CADEIA|exprAritmetica|exprRelacional|entrada) ';' // a = 10; dentro de funções e da main
    ;

listaAtrib: ID SB (CADEIA|exprAritmetica|exprRelacional) ',' listaAtrib
    | ID SB (CADEIA|exprAritmetica|exprRelacional)
    ;

declaracao: tipo ID
    ;

cadeiaVars: (ID|CADEIA|NUM|BOOL) ',' cadeiaVars
    | (ID|CADEIA|NUM|BOOL)
    ;

cadeia: (exprAritmetica|exprRelacional|CADEIA) ',' cadeia
    | (exprAritmetica|exprRelacional|CADEIA)
    ;

exprAritmetica: exprAritmetica ('+'|'-') termoAritmetico
    | termoAritmetico
    ;

termoAritmetico: termoAritmetico ('*'|'/') fatorAritmetico
    | fatorAritmetico
    ;

fatorAritmetico: '(' exprAritmetica ')'
    | NUM
    | ID
    | chamadaFunc
    ;

saida: 'print' '(' (ID | CADEIA) ')'
    | 'print' '(' CADEIA ',' cadeiaVars ')' // print("resultado: ", valor, valor ...)?
    ;

tipo: 'int'
    | 'float'
    | 'bool'
    | 'string'
    | 'void'
    ;

entrada: 'input' '(' ')'
    //| ID '=' 'input' '(' ')'
    ;

tipoParam: declaracao
    ;

params: tipoParam ',' params
    | tipoParam
    ;

exprRelacional: exprRelacional ('||' | '&&') termoRelacional
    | termoRelacional;

termoRelacional: exprAritmetica (SB|'||' | '&&') exprAritmetica
    | '(' exprRelacional ')'
    | 'True' | 'False'
    ;

// ------------------------------------------------------------------ corpo da condição
condicao: 'if' exprRelacional '{' comandos* return* break* '}'
    | 'if' exprRelacional '{' comandos* return* break* '}' 'else' '{' comandos* return* break* '}'
   ;
// --------------------------------------------------------------------------------

return: 'return' ';'
    | 'return' (cadeiaVars|exprRelacional|exprAritmetica) ';'
    ;

chamadaFunc: ID '(' (params|exprAritmetica|exprRelacional|chamadaFunc) ')'
    ;

repeticao: 'for' ID 'in' 'range' '(' NUM ':' NUM ')' '{' atribSemTipo* comandos* break* '}'
    | 'for' ID 'in' 'range' '(' NUM ':' NUM ':' NUM ')' '{' atribSemTipo* comandos* break* '}'
    | 'do' '{' atribSemTipo* comandos* break* '}' 'while' '(' exprRelacional ')' ';'
    ;

break: 'break' ';'
    ;

PR: 'for'|'in'|'range'|'None'|'if'|'else'|'elsif'
    |'while'|'do'|'continue'|'break'|'input'|'main'|'def'|'float'|'int'
    |'bool'|'string'|'class'|'as'|'try'|'catch'|'exception'|'import'|'from'|'return'
    |'list'|'dict'|'tuple'|'print';

ID: [a-zA-Z][a-zA-Z0-9]*;
NUM: [-]?[0-9]*;
CADEIA: '"' [a-zA-Z ][a-zA-Z0-9:?=! ]* '"';
BOOL: 'True' | 'False';

SB: '"'|'?'|'/'|'!'|'#'|'%'|'+'|'-'|'*'|'='|'=='|'<'|'>'|'('|')'|'['|']'|'{'
    |'}'|'<='|'>='|'!='|'**'|':'|';'|','|'.'|'+='|'-='|'*='|'/='|'&&'|'||';

WS: [ \t\r\n] -> skip;

// FALTA REPETICAO
