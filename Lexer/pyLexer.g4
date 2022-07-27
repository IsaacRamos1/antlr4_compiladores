lexer grammar pyLexer;

PR: 'True'|'False'|'None'|'and'|'or'|'not'|'in'|'is'|'if'|'else'|'elif'|'for'|'while'|'break'|'continue'|'print'|'range'
    |'def'|'main'|'void'|'int'|'float'|'string'|'boolean'|'class'|'with'|'as'|'pass'|'import'|'from'|'try'|'except'
    |'raise'|'return'|'finally'|'input';

ID : [a-zA-Z][a-zA-Z0-9]*;

NUMERO: [0-9]+[.]?[0-9]*;

SIMBOLO: '\''|'"'|'!'|'%'|'*'|'('|')'|'-'|'+'|'='|'{'|'}'|'['|']'|'<'|'>'|'<='|'>='|'=='|'!='|'**'|'<>'|':'|';'|','|'.'
        |'#'|'/'|'?';

WS: [ \t\r\n] -> skip;
