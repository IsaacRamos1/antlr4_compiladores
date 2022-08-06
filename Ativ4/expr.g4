grammar expr;

line: expr '\n'
    ;

expr returns [int val]
    : expr op=('+'|'-') term #Soma
    | term          #ExprTerm
    ;

term returns [int val]
    : term '*' fator    #Mult
    | fator             #TermFator
    ;

fator returns [int val]
    : '(' expr ')'   #FatorExpr
    | NUM  #Numero
    ;

NUM: [0-9]+;
WS: [ \t\r\n] -> skip;
