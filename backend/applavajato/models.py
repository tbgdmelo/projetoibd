# -*- coding: utf-8 -*-
from __future__ import unicode_literals
 
from django.db import models
from datetime import datetime
 
# Create your models here.
 
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.

#Classe do cliente
#Cliente é obrigatório ter endereço, e pelo menos um telefone
#Campo nome não pode ser em branco e/ou nulo
class Cliente(models.Model):
   registro_pessoal = models.CharField(primary_key=True, max_length=11)
   nome = models.CharField(max_length=85, null=False, blank=False)
   endereco = models.CharField(max_length=150, null=False, blank=False)
   telefone1 = models.CharField(max_length=14, null=False, blank=False)
   telefone2 = models.CharField(max_length=14, blank=True)
   class Meta:
       db_table = 'cliente'
   def __str__(self):
      return self.nome

#Classe sobre os modelos de veículos
#nome é unique para que não tenha o mesmo modelo cadastrado com nomes iguais
class Modelo(models.Model):
   id_modelo = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=30, null=False, blank=False, unique=True)
   class Meta:
      db_table = 'modelo'
   def __str__(self):
      return self.nome

#Classe sobre os fabricantes de veículos
#nome é unique para que não tenha o mesmo modelo cadastrado com nomes iguais
class Fabricante(models.Model):
   id_fabricante = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=30, null=False, blank=False, unique=True)
   class Meta:
      db_table = 'fabricante'
   def __str__(self):
      return self.nome

#Classe sobre os veículos
#Já possui uma lista com os tipos de veículos
#A lista de cores que um carro pode ter já possui as cores mais populares, porém o atributo pode ficar 
# em branco ou nulo caso caso a cor do veículo não esteja na lista
#O atributo avarias pode ser branco, caso não seja necessário listar nenhum problema do carro
class Veiculo(models.Model):
   TIPOS_CHOICES = [
      ["Aluguel", "Aluguel"],
      ["Pesado", "Pesado"],
      ["Particular", "Particular"]
   ]
   CORES_CHOICES = [
      ["Preto", "Preto"],
      ["Branco", "Branco"],
      ["Cinza", "Cinza"],
      ["Prata","Prata"],
      ["Vermelho", "Vermelho"],
      ["Verde","Verde"],
      ["Azul","Azul"],
      ["Marrom","Marrom"]
      ["Laranja", "Laranja"],
      ["Amarelo", "Amarelo"],
      ["Rosa","Rosa"],
   ]
   placa = models.CharField(primary_key=True, max_length=7)
   cor = models.CharField(max_length=25, blank=True, choices=CORES_CHOICES, null=True)
   avarias = models.CharField(max_length=400, blank=True, null=True)
   modelo = models.ForeignKey(Modelo, on_delete=models.DO_NOTHING,null=False,  related_name='modelo')
   fabricante = models.ForeignKey(Fabricante,on_delete=models.DO_NOTHING, null=False,  related_name='fabricante')
   tipo_veiculo = models.CharField(max_length=10, choices=TIPOS_CHOICES, blank=False, null=False)
   cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, related_name='cliente')
   
   class Meta:
      db_table = 'veiculo'
   def __str__(self):
      return self.placa

#Classe sobre os funcionários
#O atributo de registro pessoal (CPF ou doc. de estrangeiro) deve ser único e não null/branco para evitar duplicatas
#Funcionário deve possuir um endereço e pelo menos um número de telefone
class Funcionario(models.Model):
   matricula = models.AutoField(primary_key=True)
   registro_pessoal = models.CharField(max_length=11, null=False, blank=False, unique=True)
   nome = models.CharField(max_length=85, null=False, blank=False)
   endereco = models.CharField(max_length=150, null=False, blank=False)
   funcao = models.CharField(max_length=30, null=False, blank=False)
   telefone1 = models.CharField(max_length=14, null=False, blank=False)
   telefone2 = models.CharField(max_length=14, blank=True)
   class Meta:
       db_table = 'funcionario'
   def __str__(self):
      return self.nome

#Classe sobre os serviços da empresa
#Atributo nome não pode ser branco/nulo para não armazenar lixo e unico pra evitar ao máximo nomes iguais no BD
#Atributo valor não pode ser branco e pode ter valor máximo de 999,99
class Servico(models.Model):
   id_servico = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=50, null=False, blank=False, unique=True)
   valor = models.DecimalField(max_digits=5, decimal_places=2, blank=False, null=False)
   class Meta:
       db_table = 'servico'
   def __str__(self):
      return self.nome
 
#Classe sobre as notas fiscais
#Vai armazenar as informações sobre os serviços prestados
#Como as formas de pagamentos são sempre as mesmas então já possui uma lista com elas
#O atributo data inicio armazena quando foi feita a solicitação
#O atributo data fim pode ficar em branco, pois o funcionário deve modificar apenas quando finalizar o serviço
#O atributo valor_final armazena o valor total de todos os serviços feitos
#O atributo servicos é uma chave estrangeira N-N para todos os serviços da nota. Estes serviços estarão listados
# na tabela nota_fiscal_servicos
#Possui chave estrangeira para relacionar o cliente solicitante e uma para relacionar o funcionario responsável
class NotaFiscal(models.Model):
   PAGAMENTO_CHOICES = [
      ["Dinheiro", "Dinheiro"],
      ["Credito", "Crédito"],
      ["Debito", "Débito"]
   ]
   id_nota = models.AutoField(primary_key=True)
   data_inicio = models.DateTimeField()
   data_fim = models.DateTimeField(blank=True, null=True)
   forma_pagamento = models.CharField(max_length=8, choices=PAGAMENTO_CHOICES, null=False, blank=False)
   valor_final = models.DecimalField(max_digits=6, decimal_places=2, blank=False, null=False)
   cliente = models.ForeignKey(Cliente, on_delete=models.DO_NOTHING, related_name='nota')
   veiculo = models.ForeignKey(Veiculo, on_delete=models.DO_NOTHING, related_name='veiculo')
   funcionario = models.ForeignKey(Funcionario, on_delete=models.DO_NOTHING, related_name='funcionario')
   servicos = models.ManyToManyField(Servico)

   class Meta:
       db_table = 'nota_fiscal'
   def __str__(self):
      return self.id_nota

