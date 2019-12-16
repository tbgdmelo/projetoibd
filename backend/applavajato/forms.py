from django import forms
from applavajato.models import *
from django.forms import ModelChoiceField
from django.forms.widgets import HiddenInput

class CustomUserCreationForm(forms.Form):
    NIVEIS=[
        ["0","Comum"],
        ["1","Administrador"]
    ]
    username = forms.CharField(label='Usuario', min_length=4, max_length=150)
    password1 = forms.CharField(label='Senha', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirme a senha', widget=forms.PasswordInput) 
    superuser = forms.ChoiceField(choices=NIVEIS,label="Nível de Usuário")
    
    def clean_username(self):
        username = self.cleaned_data['username'].lower()
        r = User.objects.filter(username=username)
        if r.count():
            raise  ValidationError("Usuario já existe")
        return username
 
    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
 
        if password1 and password2 and password1 != password2:
            raise ValidationError("Senhas não são iguais!")
 
        return password2
 
    def save(self, commit=True):
        superuser = self.cleaned_data.get('superuser')
        if superuser == "1":
            user = User.objects.create_superuser(
                self.cleaned_data['username'],
                self.cleaned_data['password1'],
            )
            return user
        else:
            user = User.objects.create_user(
                self.cleaned_data['username'],
                self.cleaned_data['password1'],
            )
            return user

class CustomUserCreationFormCliente(forms.Form):
    username = forms.CharField(label='Usuario', min_length=4, max_length=150)
    password1 = forms.CharField(label='Senha', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirme a senha', widget=forms.PasswordInput)

    def clean_username(self):
        username = self.cleaned_data['username'].lower()
        r = User.objects.filter(username=username)
        if r.count():
            raise  ValidationError("Usuario já existe")
        return username
 
    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
 
        if password1 and password2 and password1 != password2:
            raise ValidationError("Senhas não são iguais!")
 
        return password2
 
    def save(self, commit=True):
        user = User.objects.create_user(
            self.cleaned_data['username'],
            self.cleaned_data['password1'],
        )
        return user

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        fields = "__all__"
        exclude = ("usuario",)

class ServicoForm(forms.ModelForm):
    class Meta:
        model = Servico
        fields = "__all__"

class VeiculoForm(forms.ModelForm):
    class Meta:
        model = Veiculo
        fields = "__all__"
        exclude = ("cliente",)

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__"
        exclude = ("usuario",)

class NotaFiscalForm(forms.ModelForm):
    class Meta:
        model = NotaFiscal
        fields = "__all__"
        exclude = ("cliente",)

class RelatorioForm(forms.Form):
    MESES=[
        [1,"Janeiro"],
        [2,"Fevereiro"],
        [3,"Março"],
        [4,"Abril"],
        [5,"Maio"],
        [6,"Junho"],
        [7,"Julho"],
        [8,"Agosto"],
        [9,"Setembro"],
        [10,"Outubro"],
        [11,"Novembro"],
        [12,"Dezembro"]
    ]
    mes = forms.ChoiceField(choices=MESES,label="Selecione o Mês")

class Relatorio2Form(forms.Form):
    MESES=[
        [1,"Janeiro"],
        [2,"Fevereiro"],
        [3,"Março"],
        [4,"Abril"],
        [5,"Maio"],
        [6,"Junho"],
        [7,"Julho"],
        [8,"Agosto"],
        [9,"Setembro"],
        [10,"Outubro"],
        [11,"Novembro"],
        [12,"Dezembro"]
    ]
    mes = forms.ChoiceField(choices=MESES,label="Selecione o Mês")
    funcionario = forms.ModelChoiceField(queryset=Funcionario.objects.all(), label="Selecione o Funcionario")