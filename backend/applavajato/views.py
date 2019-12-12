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

# Create your views here.

#INICIO
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
            return redirect('/show_all_cli')
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
    return render(request, 'applavajato/show_nota.html', {'nota': nota})

@login_required(login_url='/')
def delete_nota(request, id_nota):
    nota = get_object_or_404(NotaFiscal, id_nota=id_nota)
    nota.delete()
    return redirect('/show_all_notas')