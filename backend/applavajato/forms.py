from django import forms
from applavajato.models import Funcionario

niveis= (
    ('0','Comum'),
    ('1','Administrador')
)

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        fields = "__all__"

