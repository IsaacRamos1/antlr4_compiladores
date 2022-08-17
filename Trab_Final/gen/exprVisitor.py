# Generated from C:/Users/isac_/PycharmProjects/antlr4_compiladores\expr.g4 by ANTLR 4.10.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .exprParser import exprParser
else:
    from exprParser import exprParser

# This class defines a complete generic visitor for a parse tree produced by exprParser.

class exprVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by exprParser#line.
    def visitLine(self, ctx:exprParser.LineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#ExprTerm.
    def visitExprTerm(self, ctx:exprParser.ExprTermContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#SomaSub.
    def visitSomaSub(self, ctx:exprParser.SomaSubContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#MultDivPow.
    def visitMultDivPow(self, ctx:exprParser.MultDivPowContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#TermFator.
    def visitTermFator(self, ctx:exprParser.TermFatorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#FatorExpr.
    def visitFatorExpr(self, ctx:exprParser.FatorExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by exprParser#Numero.
    def visitNumero(self, ctx:exprParser.NumeroContext):
        return self.visitChildren(ctx)



del exprParser