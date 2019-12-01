# -*- coding: utf-8 -*-
from __future__ import unicode_literals
 
from django.db import models
 
# Create your models here.
 
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.

class Aluguel(models.Model):
   placa = models.ForeignKey('Veiculo', on_delete=models.CASCADE, db_column='placa', primary_key=True)
   empresa = models.CharField(max_length=15)
   class Meta:
      #  managed = False
       db_table = 'aluguel'
 
class Cliente(models.Model):
   registro_pessoal = models.CharField(primary_key=True, max_length=11)
   nome = models.CharField(max_length=85)
   endereco = models.CharField(max_length=150)
   telefone1 = models.CharField(max_length=14)
   telefone2 = models.CharField(max_length=14)
   class Meta:
      #  managed = False
       db_table = 'cliente'
 
class ClienteSolicServico(models.Model):
   registro_pessoal = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='registro_pessoal', primary_key=True)
   id_servico = models.ForeignKey('Servico', on_delete=models.CASCADE, db_column='id_servico')
   class Meta:
      #  managed = False
       db_table = 'cliente_solic_servico'
       unique_together = (('registro_pessoal', 'id_servico'),)
 
class ClienteVeiculo(models.Model):
   registro_pessoal = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='registro_pessoal', primary_key=True)
   placa = models.ForeignKey('Veiculo', on_delete=models.CASCADE, db_column='placa')
   class Meta:
      #  managed = False
       db_table = 'cliente_veiculo'
       unique_together = (('registro_pessoal', 'placa'),)
 
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
      #  managed = False
       db_table = 'funcionario'
 
class OrdemServico(models.Model):
   id_ordem = models.AutoField(primary_key=True)
   data_inicio = models.DateTimeField()
   data_fim = models.DateTimeField(blank=True, null=True)
   matricula = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='matricula')
   placa = models.ForeignKey('Veiculo', on_delete=models.CASCADE, db_column='placa')
   class Meta:
      #  managed = False
       db_table = 'ordem_servico'
 
class Particular(models.Model):
   placa = models.ForeignKey('Veiculo', on_delete=models.CASCADE, db_column='placa', primary_key=True)
   tipo = models.CharField(max_length=20)
   class Meta:
      #  managed = False
       db_table = 'particular'
 
class Pesado(models.Model):
   placa = models.ForeignKey('Veiculo', on_delete=models.CASCADE, db_column='placa', primary_key=True)
   cargas = models.CharField(max_length=20)
   class Meta:
      #  managed = False
       db_table = 'pesado'
 
class Servico(models.Model):
   id_servico = models.AutoField(primary_key=True)
   nome = models.CharField(max_length=50)
   valor = models.DecimalField(max_digits=5, decimal_places=2)
   class Meta:
      #  managed = False
       db_table = 'servico'
 
class ServicoNaOrdem(models.Model):
   id_ordem = models.ForeignKey(OrdemServico, on_delete=models.DO_NOTHING, db_column='id_ordem', primary_key=True)
   id_servico = models.ForeignKey(Servico, on_delete=models.DO_NOTHING, db_column='id_servico')
   class Meta:
      #  managed = False
       db_table = 'servico_na_ordem'
       unique_together = (('id_ordem', 'id_servico'),)

"""
class TelefoneCli(models.Model):
   registro_pessoal = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='registro_pessoal', primary_key=True)
   telefone = models.CharField(max_length=14)
   class Meta:
      #  managed = False
       db_table = 'telefone_cli'
       unique_together = (('registro_pessoal', 'telefone'),)

class TelefoneFunc(models.Model):
   matricula = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='matricula', primary_key=True)
   telefone = models.CharField(max_length=14)
   class Meta:
      #  managed = False
       db_table = 'telefone_func'
       unique_together = (('matricula', 'telefone'),)
 """
class Veiculo(models.Model):
   placa = models.CharField(primary_key=True, max_length=7)
   cor = models.CharField(max_length=25)
   modelo = models.CharField(max_length=30)
   fabricante = models.CharField(max_length=15)
   avarias = models.CharField(max_length=400, blank=True, null=True)

   class Meta:
      db_table = 'veiculo'