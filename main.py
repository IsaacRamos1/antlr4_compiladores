from antlr4 import *
from gen.expr2022 import expr2022
from tkinter import *
from tkinter.filedialog import askopenfilename
from tkinter import ttk
import threading

def abrirAqruivo():
    path = askopenfilename(filetypes=[('Python Files', '*.py'), ('Text Files', '*.txt')])
    if path == '':
        return
    with open(path, 'r') as file:
        code = file.read()
        editorText.delete('1.0', END)
        editorText.insert('1.0', code)


def analise():
    code = editorText.get('1.0', END)
    data = InputStream(code)
    lexer = expr2022(data)
    tokens = CommonTokenStream(lexer)
    list_tokens = lexer.getAllTokens()

    file = open('lexica.txt', 'w+')
    file.write("============================\n")
    file.write("{:<15} {:<8}\n".format('Token', 'Type'))
    file.write("============================\n")

    # Parser
    #parser = expr2022Parser(tokens)
    #tree = parser.expr()

    for token in list_tokens: #symbolicNames[token.type]
        nomeEtoken = expr2022.symbolicNames[token.type]
        file.write("\n{:15} {:<8}".format(token.text, nomeEtoken))

    file.seek(0)
    out.delete('1.0', END)
    out.insert('1.0', '\n\n---- AntLR com Python: -----\nAlunos:\nIsaac Silva Santos Ramos\nPedro Gonçalves Neto\n\n')
    out.insert('1.0', 'Process finished with exit code 0\n' + file.read())

    #lexer.reset()
    #file.close()

if __name__ == '__main__':
    window = Tk()
    window.title('Lexer Analyzer')
    window.geometry('500x500')

    window.tk.call('wm', 'iconphoto', window._w, PhotoImage(file='pusheen.png'))

    #print(window.winfo_reqheight())
    #print(window.winfo_reqheight(), window.winfo_reqwidth())
    editorText = Text(height=10, font=("Consolas", 18))
    editorText.config(bg='#333333', fg='#b08102', insertbackground='white')
    editorText.pack(fill=X)

    out = Text(height=window.winfo_reqheight())
    out.config(bg='#333333', fg='#249903')
    out.pack(fill=X)

    out.insert('1.0', '\n\n---- AntLR com Python: -----\nAlunos:\nIsaac Silva Santos Ramos\nPedro Gonçalves Neto')
    bar = Menu(Menu(window), tearoff=0)
    bar.add_command(label='Open', command=abrirAqruivo)
    bar.add_command(label='Analyze', command=analise)
    bar.add_command(label='Quit', command=exit)


    sizegrip = ttk.Sizegrip(window)
    sizegrip.pack(side="right", anchor=SE)
    #sizegrip.grid(row=1, sticky=SE)

    window.config(menu=bar)
    window.mainloop()


