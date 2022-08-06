from antlr4 import *
if __name__ is not None and "." in __name__:
    from .exprParser import exprParser
else:
    from exprParser import exprParser

# evita sobreposição
class exprListener(ParseTreeListener):

    # Exit a parse tree produced by exprParser#Numero.
    def exitNumero(self, ctx: exprParser.NumeroContext):
        ctx.val = int(ctx.NUM().getText())

    def exitTermFator(self, ctx:exprParser.TermFatorContext):
        ctx.val = ctx.fator().val

    def exitMult(self, ctx:exprParser.MultContext):
        ctx.val = ctx.term().val * ctx.fator().val

    def exitExprTerm(self, ctx:exprParser.ExprTermContext):
        ctx.val = ctx.term().val

    def exitSoma(self, ctx: exprParser.SomaContext):
        if(ctx.op.text == '+'):
            ctx.val = ctx.expr().val + ctx.term().val
        else:
            ctx.val = ctx.expr().val - ctx.term().val

    def exitLine(self, ctx: exprParser.LineContext):
        print("Resultado: ", ctx.expr().val)





