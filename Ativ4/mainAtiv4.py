from antlr4 import *

from gen.exprLexer import exprLexer
from gen.exprParser import exprParser
from gen.exprMyListener import  exprListener

if __name__ == '__main__':
    print('AntLR com Python: ')
    exp = "3 + 2 ^ 3 + 2\n"
    print(exp)
    data = InputStream(exp)

    # Lexer
    lexer = exprLexer(data)
    tokens = CommonTokenStream(lexer)

    # Parser
    parser = exprParser(tokens)
    tree = parser.line()

    #Listener: ideia de você herdar a classe, assim você sobrepõe com suas ações
    l = exprListener()
    walker = ParseTreeWalker()
    walker.walk(l, tree)