# Generated from /home/isaac/PycharmProjects/pythonProject/expr.g4 by ANTLR 4.10.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .exprParser import exprParser
else:
    from exprParser import exprParser

# This class defines a complete listener for a parse tree produced by exprParser.
class exprListener(ParseTreeListener):

    # Enter a parse tree produced by exprParser#line.
    def enterLine(self, ctx:exprParser.LineContext):
        pass

    # Exit a parse tree produced by exprParser#line.
    def exitLine(self, ctx:exprParser.LineContext):
        pass


    # Enter a parse tree produced by exprParser#Soma.
    def enterSoma(self, ctx:exprParser.SomaContext):
        pass

    # Exit a parse tree produced by exprParser#Soma.
    def exitSoma(self, ctx:exprParser.SomaContext):
        pass


    # Enter a parse tree produced by exprParser#ExprTerm.
    def enterExprTerm(self, ctx:exprParser.ExprTermContext):
        pass

    # Exit a parse tree produced by exprParser#ExprTerm.
    def exitExprTerm(self, ctx:exprParser.ExprTermContext):
        pass


    # Enter a parse tree produced by exprParser#Mult.
    def enterMult(self, ctx:exprParser.MultContext):
        pass

    # Exit a parse tree produced by exprParser#Mult.
    def exitMult(self, ctx:exprParser.MultContext):
        pass


    # Enter a parse tree produced by exprParser#TermFator.
    def enterTermFator(self, ctx:exprParser.TermFatorContext):
        pass

    # Exit a parse tree produced by exprParser#TermFator.
    def exitTermFator(self, ctx:exprParser.TermFatorContext):
        pass


    # Enter a parse tree produced by exprParser#FatorExpr.
    def enterFatorExpr(self, ctx:exprParser.FatorExprContext):
        pass

    # Exit a parse tree produced by exprParser#FatorExpr.
    def exitFatorExpr(self, ctx:exprParser.FatorExprContext):
        pass


    # Enter a parse tree produced by exprParser#Numero.
    def enterNumero(self, ctx:exprParser.NumeroContext):
        pass

    # Exit a parse tree produced by exprParser#Numero.
    def exitNumero(self, ctx:exprParser.NumeroContext):
        pass



del exprParser