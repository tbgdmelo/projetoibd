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

class ModeloChoiceField(ModelChoiceField):
    def label_from_instance(self, Modelo):
        return "%s" % Modelo.nome

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

class EditClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__"