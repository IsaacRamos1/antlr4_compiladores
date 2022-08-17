from antlr4 import *
from gen.expr2022_ativ3 import expr2022_ativ3
from tkinter import *
from tkinter.filedialog import askopenfilename
from tkinter import ttk

def abrirAqruivo():
    path = askopenfilename(filetypes=[('Python Files', '*.py'), ('Text Files', '*.txt')])
    if path == '':
        return
    with open(path, 'r') as file:           # Open => abrir o diretório para abrir um código existente
        code = file.read()
        editorText.delete('1.0', END)
        editorText.insert('1.0', code)


def analise():
    out.delete('1.0', END)
    code = editorText.get('1.0', END)
    data = InputStream(code)                # "enviar" a entrada pra arquivo .g4
    lexer = expr2022_ativ3(data)
    tokens = CommonTokenStream(lexer)
    list_tokens = lexer.getAllTokens()     # vamos receber a lista de tokens

    file = open('lexica.txt', 'w+')
    file.write("==============================================\n")            # abrir ou criar um arquivo txt
    file.write("{:<18} {:<10}\n".format('Token', 'Type'))

    for token in list_tokens:
        nomeEtoken = expr2022_ativ3.symbolicNames[token.type]             # get nome e token
        file.write("\n{:18} {:<10}".format(token.text, nomeEtoken))  # escrever no .txt

    out.insert('1.0', '\n\n---- AntLR com Python: -----\nAlunos:\nIsaac Silva Santos Ramos\nPedro Gonçalves Neto')

    file.seek(0)
    out.insert('1.0', 'Process finished with exit code 0\n' + file.read())
    lexer.reset()
    file.close()

if __name__ == '__main__':
    window = Tk()
    window.iconbitmap('pusheen.ico')
    window.title('Lexer Analyzer')          # objeto Interface
    window.geometry('700x700')
    window.resizable(True, True)

    editorText = Text(height=20, font=("Consolas", 18))
    editorText.config(bg='#333333', fg='#b08102', insertbackground='white')  # área de código/entrada
    editorText.pack(fill=X)

    out = Text(height=window.winfo_reqheight())
    out.config(bg='#212020', fg='#249903')          # área de saída
    out.pack(fill=X)

    out.insert('1.0', '\n\n---- AntLR com Python: -----\nAlunos:\nIsaac Silva Santos Ramos\nPedro Gonçalves Neto')

    bar = Menu(Menu(window), tearoff=0)
    bar.add_command(label='Open', command=abrirAqruivo)     # Open Analyzer Quit
    bar.add_command(label='Analyze', command=analise)
    bar.add_command(label='Quit', command=exit)

    sizegrip = ttk.Sizegrip(window)
    sizegrip.pack(side="right", anchor=SE)

    window.config(menu=bar)
    window.mainloop()


