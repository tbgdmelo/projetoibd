# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect

from applavajato.forms import FuncionarioForm

from applavajato.models import Funcionario

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
    return render(request, 'applavajato/add_servico.html', {})

def cadastro_nota(request):
    return render(request, 'applavajato/add_nota.html', {})

def cadastro_func(request):
    if request.method == "POST":
        form = FuncionarioForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/login')
            except:
                pass
    else:
        form = FuncionarioForm()
    return render(request, 'applavajato/add_funcionario.html', {'form':form})
