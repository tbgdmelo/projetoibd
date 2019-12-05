from django import forms
from applavajato.models import *

niveis= (
    ('0','Comum'),
    ('1','Administrador')
)

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        fields = "__all__"

class ServicoForm(forms.ModelForm):
    class Meta:
        model = Servico
        fields = "__all__"

class VeiculoForm(forms.ModelForm):
    class Meta:
        model = Veiculo
        fields = "__all__"

class EditVeiculoForm(forms.ModelForm):
    class Meta:
        model = Veiculo
        fields = ['cor', 'modelo', 'fabricante', 'avarias']