from antlr4 import *
from gen.pyLexer import pyLexer
from tkinter import *
from tkinter.filedialog import askopenfilename


def main():
    window = Tk()
    window.title('Analisador Léxico')
    window.resizable(False, False)

    def abrirArq():
        path = askopenfilename(filetypes=[('Python Files', '*.py'), ('Text Files', '*.txt')])
        if path == '':
            return
        with open(path, 'r') as file:
            code = file.read()
            textEditor.delete('1.0', END)
            textEditor.insert('1.0', code)

    def analisarArq():
        code = textEditor.get('1.0', END)
        lexer = pyLexer(InputStream(code))
        tokenList = lexer.getAllTokens()
        f = open("analiseLexica.txt", "w+")
        f.write("--------------------------------------")
        f.write("\n{:<15} {:<8}".format('Token', 'Tipo'))
        f.write("\n--------------------------------------")
        for token in tokenList:
            nomeToken = pyLexer.symbolicNames[token.type]
            f.write("\n{:<15} {:<8}".format(token.text, nomeToken))
        f.seek(0)
        msg = "Disponível em analiseLexica.txt\n\n"+f.read()
        output.insert('1.0', msg)

    textEditor = Text(height=15)
    textEditor.config(bg='#362f2e', fg='#d2ded1', insertbackground='white')
    textEditor.pack()

    output = Text(height=10)
    output.config(bg='#362f2e', fg='#1dd604')
    output.pack()

    menuBar = Menu(window)

    fileBar = Menu(menuBar, tearoff=0)
    fileBar.add_command(label='Abrir', command=abrirArq)
    fileBar.add_command(label='Analisar', command=analisarArq)
    fileBar.add_command(label='Sair', command=exit)

    window.config(menu=fileBar)
    window.mainloop()


if __name__ == '__main__':
    main()
