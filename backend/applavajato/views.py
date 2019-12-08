# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect, get_object_or_404

from applavajato.forms import *

from applavajato.models import *

# Create your views here.

def login(request):
    return render(request, 'applavajato/login.html', {})

def cadastro_veic(request):
    if request.method == "POST":
        form = VeiculoForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/show_all_veic')
            except:
                pass
    else:
        form = VeiculoForm()
    return render(request, 'applavajato/add_veiculo.html', {'form':form})

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
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    return render(request, 'applavajato/show_funcionario.html', {'funcionario': funcionario})

def edit_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

def update_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    if request.method == "POST":
        form = FuncionarioForm(request.POST, instance=funcionario)
        if form.is_valid():
            funcionario = form.save(commit=False)
            funcionario.save()
            return redirect('/show_all_func')
    return render(request, 'applavajato/edit_funcionario.html', {'funcionario': funcionario})

def delete_func(request, matricula):
    funcionario = get_object_or_404(Funcionario, matricula=matricula)
    funcionario.delete()
    return redirect('/show_all_func')

def show_all_serv(request):
    servicos = Servico.objects.all()
    return render(request, 'applavajato/show_all_servicos.html', {'servicos':servicos})

def show_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    return render(request, 'applavajato/show_servico.html', {'servico': servico})

def edit_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

def update_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    if request.method == "POST":
        form = ServicoForm (request.POST, instance=servico)
        if form.is_valid():
            servico = form.save(commit=False)
            servico.save()
            return redirect('/show_all_serv')
    return render(request, 'applavajato/edit_servico.html', {'servico': servico})

def delete_serv(request, id_servico):
    servico = get_object_or_404(Servico, id_servico=id_servico)
    servico.delete()
    return redirect('/show_all_serv')

def show_all_veic(request):
    veiculos = Veiculo.objects.all()    
    return render(request, 'applavajato/show_all_veiculos.html', {'veiculos':veiculos,'modelos':modelos,'fabricantes':fabricantes})

def show_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    return render(request, 'applavajato/show_veiculo.html', {'veiculo': veiculo})

def edit_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    return render(request, 'applavajato/edit_veiculo.html', {'veiculo': veiculo})

def update_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    if request.method == "POST":
        form = EditVeiculoForm (request.POST, instance=veiculo)
        if form.is_valid():
            veiculo = form.save(commit=False)
            veiculo.save()
            return redirect('/show_all_veic')
    return render(request, 'applavajato/edit_veiculo.html', {'veiculo': veiculo})

def delete_veic(request, placa):
    veiculo = get_object_or_404(Veiculo, placa=placa)
    veiculo.delete()
    return redirect('/show_all_veic')

def cadastro_cli(request):
    if request.method == "POST":
        form = ClienteForm(request.POST)
        form2 = VeiculoForm(request.POST)
        if form.is_valid() and form2.is_valid():
            try:
                form.save()
                form2.save()
                return redirect('/show_all_cli')
            except:
                pass
    else:
        form = ClienteForm()
        form2 = VeiculoForm()
    return render(request, 'applavajato/add_cliente.html', {'form':form, 'form2':form2})

def show_all_cli(request):
    clientes = Cliente.objects.all()
    return render(request, 'applavajato/show_all_clientes.html', {'clientes':clientes})

def show_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    return render(request, 'applavajato/show_cliente.html', {'cliente': cliente})

def edit_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    return render(request, 'applavajato/edit_cliente.html', {'cliente': cliente})

def update_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    if request.method == "POST":
        form = EditClienteForm (request.POST, instance=cliente)
        if form.is_valid():
            cliente = form.save(commit=False)
            cliente.save()
            return redirect('/show_all_cli')
    return render(request, 'applavajato/edit_cliente.html', {'cliente': cliente})

def delete_cli(request, registro_pessoal):
    cliente = get_object_or_404(Cliente, registro_pessoal=registro_pessoal)
    cliente.delete()
    return redirect('/show_all_cli')