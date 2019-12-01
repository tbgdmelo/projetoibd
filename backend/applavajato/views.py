# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect

from applavajato.forms import *

from applavajato.models import *

# Create your views here.

def login(request):
    return render(request, 'applavajato/login.html', {})

def cadastro_cli(request):
    return render(request, 'applavajato/add_cliente.html',{})

def cadastro_veic(request):
    return render(request, 'applavajato/add_veiculo.html', {})

def select_report(request):
    return render(request, 'applavajato/select_relatorio.html', {})

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

def cadastro_nota(request):
    return render(request, 'applavajato/add_nota.html', {})

def cadastro_func(request):
    if request.method == "POST":
        form = FuncionarioForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/show_all_func')
            except:
                pass
    else:
        form = FuncionarioForm()
    return render(request, 'applavajato/add_funcionario.html', {'form':form})

def show_all_func(request):
    funcionarios = Funcionario.objects.all()
    return render(request, 'applavajato/show_all_funcionarios.html', {'funcionarios':funcionarios})

def show_func(request, matricula):
    funcionario = Funcionario.objects.get(matricula=matricula)
    return render(request, 'applavajato/show_funcionario.html', {'funcionario': funcionario})

def edit_func(request, matricula):
    funcionario = Funcionario.objects.get(matricula=matricula)
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

def update_func(request, matricula):
    funcionario = Funcionario.objects.get(matricula=matricula)
    if request.method == "POST":
        form = FuncionarioForm(request.POST, instance=funcionario)
        if form.is_valid():
            funcionario = form.save(commit=False)
            funcionario.save()
            return redirect('/show_all_func')
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

def delete_func(request, matricula):
    funcionario = Funcionario.objects.get(matricula=matricula)
    funcionario.delete()
    return redirect('/show_all_func')

def show_all_serv(request):
    servicos = Servico.objects.all()
    return render(request, 'applavajato/show_all_servicos.html', {'servicos':servicos})

def show_serv(request, id_servico):
    servico = Servico.objects.get(id_servico=id_servico)
    return render(request, 'applavajato/show_servico.html', {'servico': servico})

def edit_serv(request, id_servico):
    servico = Servico.objects.get(id_servico=id_servico)
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

def update_serv(request, id_servico):
    servico = Servico.objects.get(id_servico=id_servico)
    if request.method == "POST":
        form = ServicoForm (request.POST, instance=servico)
        if form.is_valid():
            funcionario = form.save(commit=False)
            funcionario.save()
            return redirect('/show_all_serv')
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

def delete_serv(request, id_servico):
    servico = Servico.objects.get(id_servico=id_servico)
    servico.delete()
    return redirect('/show_all_serv')