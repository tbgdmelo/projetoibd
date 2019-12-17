# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect, get_object_or_404

from applavajato.forms import *

from applavajato.models import *

#from django.contrib.auth.forms import UserCreationForm

#from django.contrib.auth.models import User

from django.contrib.auth import get_user_model
User = get_user_model()
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordChangeForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db import connection
from collections import namedtuple

# Create your views here.

#INICIO
@login_required(login_url='/')
def homepage(request):
    return render(request, 'applavajato/homepage.html')

#VIEWS DO LOGIN
def logar_usuario(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        usuario = authenticate(username=username, password=password)
        if usuario is not None:
            login(request, usuario)
            return redirect('/homepage')
        else:
            form_login = AuthenticationForm()
    else:
        form_login = AuthenticationForm()
    return render(request, 'applavajato/login.html', {'form_login': form_login})

def deslogar_usuario(request):
    logout(request)
    return redirect('/')


#VIEWS DE FUNCIONARIOS
@login_required(login_url='/')
def cadastro_func(request):
    if request.method == "POST":
        form = FuncionarioForm(request.POST)
        form_usuario = CustomUserCreationForm(request.POST) #Form de cadastro de usuario do sistema
        if form.is_valid() and form_usuario.is_valid():
            try:
                #Guarda o objeto do login novo
                new_user = form_usuario.save()
                #Objeto funcionario é criado sem ser salvo
                new_func = form.save(commit=False)
                #A chave estrangeira funcionario vai apontar para o seu login
                new_func.usuario = new_user
                #Finalmente salva o novo login no BD
                new_func.save()
                return redirect('/show_all_func')
            except:
                pass
    else:
        form = FuncionarioForm()
        form_usuario = CustomUserCreationForm()
    return render(request, 'applavajato/add_funcionario.html', {'form':form, 'form_usuario':form_usuario})

@login_required(login_url='/')
def show_all_func(request):
    funcionarios = Funcionario.objects.all()
    return render(request, 'applavajato/show_all_funcionarios.html', {'funcionarios':funcionarios})

@login_required(login_url='/')
def show_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    return render(request, 'applavajato/show_funcionario.html', {'funcionario': funcionario})

@login_required(login_url='/')
def edit_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

@login_required(login_url='/')
def update_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    if request.method == "POST":
        form = FuncionarioForm(request.POST, instance=funcionario)
        if form.is_valid():
            funcionario = form.save(commit=False)
            funcionario.save()
            return redirect('/show_all_func')
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

@login_required(login_url='/')
def delete_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    funcionario.delete()
    return redirect('/show_all_func')

#VIEWS DE SERVICOS
@login_required(login_url='/')
def cadastro_serv(request):
    if request.method == "POST":
        form = ServicoForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/show_all_serv')
            except:
                Exception("Form not valid!")
    else:
        form = ServicoForm()
    return render(request, 'applavajato/add_servico.html', {'form':form})

@login_required(login_url='/')
def show_all_serv(request):
    servicos = Servico.objects.all()
    return render(request, 'applavajato/show_all_servicos.html', {'servicos':servicos})

@login_required(login_url='/')
def show_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    return render(request, 'applavajato/show_servico.html', {'servico': servico})

@login_required(login_url='/')
def edit_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

@login_required(login_url='/')
def update_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    if request.method == "POST":
        form = ServicoForm (request.POST, instance=servico)
        if form.is_valid():
            servico = form.save(commit=False)
            servico.save()
            return redirect('/show_all_serv')
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

@login_required(login_url='/')
def delete_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    servico.delete()
    return redirect('/show_all_serv')


#VIEWS DE VEICULOS
@login_required(login_url='/')
def cadastro_veic(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    if request.method == "POST":
        form = VeiculoForm(request.POST)
        if form.is_valid():
            new_veiculo = form.save(commit=False)
            new_veiculo.cliente = cliente
            new_veiculo.save()
            return redirect('/show_all_cli')
    else:
        form = VeiculoForm()
    return render(request, 'applavajato/add_veiculo.html', {'form':form, 'cliente':cliente})

@login_required(login_url='/')
def show_all_veic(request):
    veiculos = Veiculo.objects.all()    
    return render(request, 'applavajato/show_all_veiculos.html', {'veiculos':veiculos})

@login_required(login_url='/')
def show_veic_cli(request, registro_pessoal):
    veiculos = Veiculo.objects.filter(cliente_id=registro_pessoal)
    return render(request, 'applavajato/show_veiculos_cli.html', {'veiculos':veiculos})

@login_required(login_url='/')
def show_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    return render(request, 'applavajato/show_veiculo.html', {'veiculo': veiculo})

@login_required(login_url='/')
def edit_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    modelos = Modelo.objects.all()
    fabricantes = Fabricante.objects.all()
    return render(request, 'applavajato/edit_veiculo.html', {'veiculo': veiculo,'modelos':modelos,'fabricantes':fabricantes})

@login_required(login_url='/')
def update_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    if request.method == "POST":
        form = VeiculoForm (request.POST, instance=veiculo)
        if form.is_valid(): 
            veiculo = form.save(commit=False)
            veiculo.save()
            return redirect('/show_all_veic')
    return render(request, 'applavajato/edit_veiculo.html', {'veiculo': veiculo})

@login_required(login_url='/')
def delete_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    veiculo.delete()
    return redirect('/show_all_veic')


#VIEWS DE CLIENTE
@login_required(login_url='/')
def cadastro_cli(request):
    if request.method == "POST":
        form = ClienteForm(request.POST)
        form2 = VeiculoForm(request.POST)
        #form_usuario = CustomUserCreationFormCliente(request.POST) #Form de cadastro de usuario do sistema
        if form.is_valid() and form2.is_valid():
            #Guarda o objeto do login novo
            #new_user = form_usuario.save()
            #Objeto cliente é criado sem ser salvo
            new_cliente = form.save(commit=False)
            #A chave estrangeira cliente vai apontar para o seu login
            #new_cliente.usuario = new_user
            #Salva o cliente
            new_cliente.save()
            #Objeto carro é criado sem ser salvo
            new_veiculo = form2.save(commit=False)
            #A chave estrangeira do veiculo vai apontar para o cliente
            new_veiculo.cliente = new_cliente
            #Finalmente salva o novo veiculo no BD
            new_veiculo.save()
            return redirect('/show_all_cli')
        else:
            return render(request, 'applavajato/add_cliente.html', {'form':form, 'form2':form2})
    else:
        form = ClienteForm()
        form2 = VeiculoForm()
        #form_usuario = CustomUserCreationFormCliente()
    return render(request, 'applavajato/add_cliente.html', {'form':form, 'form2':form2})

@login_required(login_url='/')
def show_all_cli(request):
    clientes = Cliente.objects.all()
    return render(request, 'applavajato/show_all_clientes.html', {'clientes':clientes})

@login_required(login_url='/')
def show_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    return render(request, 'applavajato/show_cliente.html', {'cliente': cliente})

@login_required(login_url='/')
def edit_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    return render(request, 'applavajato/edit_cliente.html', {'cliente': cliente})

@login_required(login_url='/')
def update_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    if request.method == "POST":
        form = ClienteForm (request.POST, instance=cliente)
        if form.is_valid():
            cliente = form.save(commit=False)
            cliente.save()
            return redirect('/show_all_cli')
    return render(request, 'applavajato/edit_cliente.html', {'cliente': cliente})

@login_required(login_url='/')
def delete_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    cliente.delete()
    return redirect('/show_all_cli')

#VIEWS DE NOTA
@login_required(login_url='/')
def cadastro_nota(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    
    if request.method == "POST":
        form = NotaFiscalForm(request.POST)
        if form.is_valid():
            new_nota = form.save(commit=False)
            new_nota.cliente = cliente
            new_nota.save()
            form.save_m2m()
            return show_nota(request, new_nota.id_nota)
    else:
        form = NotaFiscalForm() 
    return render(request, 'applavajato/add_nota.html', {'form':form, 'cliente':cliente})

@login_required(login_url='/')
def show_all_notas(request):
    notas = NotaFiscal.objects.all()
    return render(request, 'applavajato/show_all_notas.html', {'notas':notas})

@login_required(login_url='/')
def edit_nota(request, id_nota):
    nota = get_object_or_404(NotaFiscal, id_nota=id_nota)
    return render(request, 'applavajato/edit_nota.html', {'nota': nota})

@login_required(login_url='/')
def show_nota(request, id_nota):
    nota = get_object_or_404(NotaFiscal, id_nota=id_nota)
    result = query_transacao_servicos(id_nota)
    dados =[]
    dados = list(result)
    #print(dados)
    dados = dict(dados)
    #print(dados)
    result1 = query_transacao_valor_total(id_nota)
    dados1 = []
    dados1 = list(result1)
    dados1 = dict(dados1)
    return render(request, 'applavajato/show_nota.html', {'nota': nota, 'dados': dados, 'dados1': dados1})

@login_required(login_url='/')
def delete_nota(request, id_nota):
    nota = get_object_or_404(NotaFiscal, id_nota=id_nota)
    nota.delete()
    return redirect('/show_all_notas')

#VIEWS DOS RELATORIOS POR TIPOS DE VEICULOS
def query_relatorio3_pesado():
    with connection.cursor() as cursor:
        cursor.execute("SELECT nome,count(nome) from nota_fiscal inner join nota_fiscal_servicos on id_nota = notafiscal_id inner join veiculo on veiculo_id = placa inner join servico on servico_id = id_servico where tipo_veiculo='Pesado' group by nome;")
        rows = cursor.fetchall()
        return rows

@login_required(login_url='/')
def relatorio_veiculo_pesado(request):
    result = query_relatorio3_pesado()
    dados =[]
    dados = list(result)
    #print(dados)
    dados = dict(dados)
    #print(dados)
    return render(request, 'applavajato/relatorio_veiculo_pesado.html', {'dados':dados})

def query_relatorio3_aluguel():
    with connection.cursor() as cursor:
        cursor.execute("SELECT nome,count(nome) from nota_fiscal inner join nota_fiscal_servicos on id_nota = notafiscal_id inner join veiculo on veiculo_id = placa inner join servico on servico_id = id_servico where tipo_veiculo='Aluguel' group by nome;")
        rows = cursor.fetchall()
        return rows

@login_required(login_url='/')
def relatorio_veiculo_aluguel(request):
    result = query_relatorio3_aluguel()
    dados =[]
    dados = list(result)
    #print(dados)
    dados = dict(dados)
    #print(dados)
    return render(request, 'applavajato/relatorio_veiculo_aluguel.html', {'dados':dados})

def query_relatorio3_particular():
    with connection.cursor() as cursor:
        cursor.execute("SELECT nome,count(nome) from nota_fiscal inner join nota_fiscal_servicos on id_nota = notafiscal_id inner join veiculo on veiculo_id = placa inner join servico on servico_id = id_servico where tipo_veiculo='Particular' group by nome;")
        rows = cursor.fetchall()
        return rows

@login_required(login_url='/')
def relatorio_veiculo_particular(request):
    result = query_relatorio3_particular()
    dados =[]
    dados = list(result)
    #print(dados)
    dados = dict(dados)
    #print(dados)
    return render(request, 'applavajato/relatorio_veiculo_particular.html', {'dados':dados})

#FUNCAO QUE DEFINE O MES SELECIONADO
def define_mes(mes):
    result = []
    if(mes == "1"):
        result.append("2019-01-01")
        result.append("2019-01-31")
    elif(mes == "2"):
        result.append("2019-02-01")
        result.append("2019-02-29")
    elif(mes == "3"):
        result.append("2019-03-01")
        result.append("2019-03-31")
    elif(mes == "4"):
        result.append("2019-04-01")
        result.append("2019-04-30")
    elif(mes == "5"):
        result.append("2019-05-01")
        result.append("2019-06-31")
    elif(mes == "6"):
        result.append("2019-06-01")
        result.append("2019-06-30")
    elif(mes == "7"):
        result.append("2019-07-01")
        result.append("2019-07-31")
    elif(mes == "8"):
        result.append("2019-08-01")
        result.append("2019-08-31")
    elif(mes == "9"):
        result.append("2019-09-01")
        result.append("2019-09-30")
    elif(mes == "10"):
        result.append("2019-10-01")
        result.append("2019-10-31")
    elif(mes == "11"):
        result.append("2019-11-01")
        result.append("2019-11-30")
    elif(mes == "12"):
        result.append("2019-12-01")
        result.append("2019-12-31")

    return result

def namedtuplefetchall(cursor):
    #Return all rows from a cursor as a namedtuple
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]

#QUERY QUE BUSCA O RESULTADO DO MES
def query_relatorio1(mes):
    intervalo = []
    intervalo = define_mes(mes)
    with connection.cursor() as cursor:
        cursor.execute("select servico.nome, sum(valor)as faturamento, count(distinct(funcionario.nome))as trabalhadores from nota_fiscal_servicos inner join nota_fiscal on notafiscal_id = id_nota inner join servico on servico_id=id_servico inner join funcionario on matricula = funcionario_id  where data_inicio between %s and %s group by servico.nome;", (intervalo[0], intervalo[1]))
        rows = namedtuplefetchall(cursor)
        #print(rows)
        return rows

#VIEW DO RELATORIO 1
@login_required(login_url='/')
def relatorio_servico(request):
    form = RelatorioForm()
    return render(request, 'applavajato/relatorio_servico.html',{'form':form})

@login_required(login_url='/')
def relatorio_servico_mes(request):
    form = RelatorioForm()
    if request.method == "POST":
        mes = request.POST.get("mes", None)
        dados = query_relatorio1(mes)
        
        return render(request, 'applavajato/relatorio_servico.html',{'form':form,'dados':dados})
    else:
        return render(request, 'applavajato/relatorio_servico.html',{'form':form})
              
def query_transacao_valor_total(id):
    with connection.cursor() as cursor:
        cursor.execute("Select notafiscal_id, sum(valor) as valor_total from servico inner join nota_fiscal_servicos on id_servico = servico_id inner join nota_fiscal on id_nota = notafiscal_id where notafiscal_id = %s;", [str(id)])
        rows = cursor.fetchall()
        print(rows)
        return rows

def query_transacao_servicos(id):
    with connection.cursor() as cursor:
        cursor.execute("Select nome, valor from servico inner join nota_fiscal_servicos on id_servico = servico_id inner join nota_fiscal on id_nota = notafiscal_id where notafiscal_id = %s;", [str(id)])
        rows = namedtuplefetchall(cursor)
        print(rows)
        return rows

#QUERY QUE BUSCA O RESULTADO DO MES DO FUNCIONARIO
def query_relatorio2(mes,funcionario):
    intervalo = []
    intervalo = define_mes(mes)
    with connection.cursor() as cursor:
        cursor.execute("select servico.nome as servico,count(servico.nome) as vezes  from nota_fiscal_servicos inner join nota_fiscal on notafiscal_id = id_nota inner join funcionario on funcionario_id = matricula inner join servico on servico_id=id_servico where funcionario.matricula = %s and data_inicio between %s and %s group by servico.nome;", (funcionario, intervalo[0], intervalo[1]))
        rows = namedtuplefetchall(cursor)
        #print(rows)
        return rows

#VIEWS DO RELATORIO 2
@login_required(login_url='/')
def relatorio_funcionario(request):
    form = Relatorio2Form()
    return render(request, 'applavajato/relatorio_funcionario.html',{'form':form})

@login_required(login_url='/')
def relatorio_funcionario_mes(request):
    form = Relatorio2Form()
    if request.method == "POST":
        mes = request.POST.get("mes", None)
        funcionario = request.POST.get("funcionario", None)
        dados = query_relatorio2(mes, funcionario)

        return render(request, 'applavajato/relatorio_funcionario.html',{'form':form,'dados':dados})
    else:
        return render(request, 'applavajato/relatorio_funcionario.html',{'form':form})
