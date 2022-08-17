//grammar expr2022;
grammar expr2022;


prog: listaComando;

listaComando: decVars* funcao* blocoMain;
//prog: listaComando;

/*listaComando: decFuncs listaComando
    | decFuncs
    | funcao
    | return
    ;
*/
/*decFuncs: decVars
    | entrada ';'
    | saida ';'
    | condicao
    ;
    // | repeticao;
*/
funcao: 'def' ID '(' params ')' tipo '{' comandos* '}' //listaComando* '}'
    ;

comandos: entrada ';'
    | saida ';'
    | condicao
    ;

decFuncs:; //entrada ';' //decVars* decFuncs*
    //| saida ';' //decVars* decFuncs*
    //| condicao //decVars* decFuncs*
    //'def' ID '(' params ')' tipo '{' '}' //decVars* decFuncs* return* '}' decVars*
    //| 'def' ID '(' ')' tipo '{' '}' //decVars* decFuncs* '}'
    //;


decVars: declaracao ';' // int a;
    | declaracao ',' cadeiaVars ';' // int a, b, c;
    | declaracao SB (CADEIA|exprAritmetica|exprRelacional) ';' // int a = 10;
    | declaracao SB (CADEIA|exprAritmetica|exprRelacional) ',' listaAtrib ';' // int a = 10, b = 10;
    | declaracao ',' decVars SB cadeia ';' // int a, b, c, d;
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
//    | INT
//    | FLOAT
    | NUM
    | ID
    | chamadaFunc
    ;

saida: 'print' '(' (ID | CADEIA) ')' // e o print("resultado: ", valor, valor ...)?
    ;

tipo: 'int'
    | 'float'
    | 'bool'
    | 'string'
    | 'void'
    ;

entrada: 'input' '(' ')'
    ;

tipoParam: declaracao
    ;

params: tipoParam ',' params
    | tipoParam                 // estouro de memoria???
    ;

exprRelacional: exprRelacional ('||' | '&&') termoRelacional
    | termoRelacional;

termoRelacional: exprAritmetica (SB|'||' | '&&') exprAritmetica
    | '(' exprRelacional ')'
    | 'True' | 'False'
    ;


condicao: 'if' exprRelacional '{' comandos* return* '}'
    | 'if' exprRelacional '{' comandos* return* '}' 'else' '{' comandos* return* '}'
   ;

/*decFuncs: entrada ';' decVars* decFuncs*
    | saida ';' decVars* decFuncs*
    | condicao decVars* decFuncs*
    | 'def' ID '(' params ')' tipo '{' decVars* decFuncs* return* '}' decVars*
    | 'def' ID '(' ')' tipo '{' decVars* decFuncs* '}'
    ;*/

blocoMain: 'def' 'main' '(' ')' '{' decVars* funcao* return*'}'
    ;

return: 'return' ';'
    | 'return' (cadeiaVars|exprRelacional|exprAritmetica) ';'
    ;

chamadaFunc: ID '(' ')'
    ;

PR: 'for'|'in'|'range'|'None'|'if'|'else'|'elsif'
    |'while'|'do'|'continue'|'break'|'input'|'main'|'def'|'float'|'int'
    |'bool'|'string'|'class'|'as'|'try'|'catch'|'exception'|'import'|'from'|'return'
    |'list'|'dict'|'tuple'|'print';

ID: [a-zA-Z][a-zA-Z0-9]*;
//INT: [0-9]*;
//FLOAT: [0-9]+[.][0-9]*;                 // COMO POE NEGATIVO?
NUM: [-]?[0-9]*;
CADEIA: '"' [a-zA-Z ][a-zA-Z0-9 ]* '"';
BOOL: 'True' | 'False';

SB: '"'|'?'|'/'|'!'|'#'|'%'|'+'|'-'|'*'|'='|'=='|'<'|'>'|'('|')'|'['|']'|'{'
    |'}'|'<='|'>='|'!='|'**'|':'|';'|','|'.'|'+='|'-='|'*='|'/='|'&&'|'||';

WS: [ \t\r\n] -> skip;

// FALTA REPETICAO
