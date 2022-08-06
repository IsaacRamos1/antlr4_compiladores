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
        #print(ctx.NUM().getText())

    def exitTermFator(self, ctx:exprParser.TermFatorContext):
        ctx.val = ctx.fator().val

    def exitMultDivPow(self, ctx:exprParser.MultDivPowContext):
        if(ctx.op.text == '*'):
            ctx.val = ctx.term().val * ctx.fator().val
        elif (ctx.op.text == '/'):
            ctx.val = ctx.term().val / ctx.fator().val
        else:
            ctx.val = ctx.term().val ** ctx.fator().val

    def exitExprTerm(self, ctx:exprParser.ExprTermContext):
        ctx.val = ctx.term().val

    def exitFatorExpr(self, ctx:exprParser.FatorExprContext):
        ctx.val = ctx.expr().val

    def exitSomaSub(self, ctx: exprParser.SomaSubContext):
        if(ctx.op.text == '+'):
            ctx.val = ctx.expr().val + ctx.term().val
        else:
            ctx.val = ctx.expr().val - ctx.term().val

    def exitLine(self, ctx: exprParser.LineContext):
        print("Resultado: ", ctx.expr().val)





