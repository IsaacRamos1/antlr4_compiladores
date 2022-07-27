lexer grammar expr2022;

PR: 'True'|'False'|'for'|'in'|'range'|'None'|'and'|'or'|'not'|'if'|'else'|'elsif'
    |'while'|'do'|'continue'|'break'|'input'|'main'|'def'|'float'|'int'
    |'bool'|'string'|'class'|'as'|'try'|'catch'|'exception'|'import'|'from'|'return'
    |'list'|'dict'|'tuple'|'print';

ID: [a-zA-Z][a-zA-Z0-9]*;
NUM: [0-9]+[.]?[0-9]*;

SB: |'"'||'?'|'/'|'!'|'#'|'%'|'+'|'-'|'*'|'='|'=='|'<'|'>'|'('|')'|'['|']'|'{'
    |'}'|'<='|'>='|'!='|'**'|':'|';'|','|'.';

WS: [ \t\r\n] -> skip;
