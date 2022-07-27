from antlr4 import *
from gen.expr2022 import expr2022

if __name__ == '__main__':
    print('AntLR com Python: ')
    # entrada dos dados ---------> implementação do front
    exp = "for i in range(1,100):"

    data = InputStream(exp)
    lexer = expr2022(data)
    tokens = CommonTokenStream(lexer)

    #print(tokens)
    # adquire os tokens

    list_tokens = lexer.getAllTokens()
    for token in list_tokens:
        nomeEtoken = expr2022.symbolicNames[token.type]
        print(token.text + " " + nomeEtoken)
    lexer.reset()

