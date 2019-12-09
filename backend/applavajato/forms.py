from django import forms
from applavajato.models import *
from django.forms import ModelChoiceField

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        fields = "__all__"

class ServicoForm(forms.ModelForm):
    class Meta:
        model = Servico
        fields = "__all__"

#Mostra um combolist com todos os modelos
class ModeloChoiceField(ModelChoiceField):
    def label_from_instance(self, Modelo):
        return "%s" % Modelo.nome

#Mostra um combolist com todos os fabricantes
class FabricanteChoiceField(ModelChoiceField):
    def label_from_instance(self, Fabricante):
        return "%s" % Fabricante.nome

class VeiculoForm(forms.ModelForm):
    id_modelo = ModeloChoiceField(label="Modelo", queryset=Modelo.objects.all())
    id_fabricante = FabricanteChoiceField(label="Fabricante", queryset=Fabricante.objects.all())
    class Meta:
        model = Veiculo
        fields = "__all__"

class EditVeiculoForm(forms.ModelForm):
    class Meta:
        model = Veiculo
        fields = "__all__"

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__"

class ClienteVeiculoForm(forms.ModelForm):
    class Meta:
        model = ClienteVeiculo
        fields = ['registro_pessoal','placa']

class EditClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__"

#Mostra um combolist com todos os clientes
class ClientesChoiceField(ModelChoiceField):
    def label_from_instance(self, Cliente):
        return "%s" % Cliente.nome

#Mostra um combolist com todos os funcionarios
class FuncionariosChoiceField(ModelChoiceField):
    def label_from_instance(self, Funcionario):
        return "%s" % Funcionario.nome

#Mostra um combolist com todos os veiculos dos clientes
class VeiculosChoiceField(ModelChoiceField):
    def label_from_instance(self, Veiculo):
        return "%s" % Veiculo.placa

#Resolvendo a data
class DateInput(forms.DateInput):
    input_type = 'date'

#Mostra um combolist com todos os serviços
class ServicoChoiceField(ModelChoiceField):
    def label_from_instance(self, Servico):
        return "%s" % Servico.nome

class NotaFiscalForm(forms.ModelForm):
    registro_pessoal = ClientesChoiceField(label="Solicitante",queryset=Cliente.objects.all())
    placa = VeiculosChoiceField(label="Veiculo", queryset=Veiculo.objects.all())
    matricula = FuncionariosChoiceField(label="Funcionario", queryset=Funcionario.objects.all())
    #servicos = ServicoChoiceField(label="Serviços", queryset=Servico.objects.all())
    class Meta:
        model = NotaFiscal
        fields = ['id_nota','data_inicio','data_fim','forma_pagamento','agendado','placa']
        labels = {'Nº Nota','Data de entrada', 'Data de finalização', 'Forma de Pagamento'}
        widgets={
            'data_inicio': DateInput(),
            'data_fim': DateInput()
        }
