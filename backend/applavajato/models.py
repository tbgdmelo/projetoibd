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

class Cliente(models.Model):
   registro_pessoal = models.CharField(primary_key=True, max_length=11)
   nome = models.CharField(max_length=85)
   endereco = models.CharField(max_length=150)
   telefone1 = models.CharField(max_length=14)
   telefone2 = models.CharField(max_length=14)
   class Meta:
       db_table = 'cliente'
   def __str__(self):
      return self.nome

class Modelo(models.Model):
   id_modelo = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=30)
   class Meta:
      db_table = 'modelo'
   def __str__(self):
      return self.nome

class Fabricante(models.Model):
   id_fabricante = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=30)
   class Meta:
      db_table = 'fabricante'
   def __str__(self):
      return self.nome

class Veiculo(models.Model):
   TIPOS_CHOICES = [
      ["0", "Aluguel"],
      ["1", "Pesado"],
      ["2", "Particular"]
   ]
   placa = models.CharField(primary_key=True, max_length=7)
   cor = models.CharField(max_length=25)
   avarias = models.CharField(max_length=400, blank=True, null=True)
   modelo = models.ForeignKey(Modelo, on_delete=models.DO_NOTHING,null=False,  related_name='modelos')
   fabricante = models.ForeignKey(Fabricante,on_delete=models.DO_NOTHING, null=False,  related_name='fabricantes')
   tipo_veiculo = models.CharField(max_length=1, choices=TIPOS_CHOICES)
   cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, related_name='veiculos')
   
   class Meta:
      db_table = 'veiculo'
   def __str__(self):
      return self.placa

class Funcionario(models.Model):
   NIVEIS_CHOICES = [
      ["0", "Comum"],
      ["1", "Administrador"]
   ]
   matricula = models.AutoField(primary_key=True)
   registro_pessoal = models.CharField(max_length=11)
   nome = models.CharField(max_length=85)
   endereco = models.CharField(max_length=150)
   funcao = models.CharField(max_length=30)
   usuario = models.CharField(max_length=32)
   senha = models.CharField(max_length=20)
   nivel = models.CharField(max_length=1, choices=NIVEIS_CHOICES)
   telefone1 = models.CharField(max_length=14)
   telefone2 = models.CharField(max_length=14)
   class Meta:
       db_table = 'funcionario'
   def __str__(self):
      return self.nome

class Servico(models.Model):
   id_servico = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=50)
   valor = models.DecimalField(max_digits=5, decimal_places=2)
   class Meta:
       db_table = 'servico'
   def __str__(self):
      return self.nome
 
class NotaFiscal(models.Model):
   PAGAMENTO_CHOICES = [
      ["0", "Dinheiro"],
      ["1", "Crédito"],
      ["2", "Débito"]
   ]
   id_nota = models.AutoField(primary_key=True)
   data_inicio = models.DateTimeField()
   data_fim = models.DateTimeField(blank=True, null=True)
   forma_pagamento = models.CharField(max_length=1, choices=PAGAMENTO_CHOICES)
   agendado = models.BooleanField()
   cliente = models.ForeignKey(Cliente, on_delete=models.DO_NOTHING, related_name='notas')
   veiculo = models.ForeignKey(Veiculo, on_delete=models.DO_NOTHING, related_name='veiculos')
   funcionario = models.ForeignKey(Funcionario, on_delete=models.DO_NOTHING, related_name='veiculos')
   servicos = models.ManyToManyField(Servico)

   class Meta:
       db_table = 'nota_fiscal'
   def __str__(self):
      return self.id_nota

