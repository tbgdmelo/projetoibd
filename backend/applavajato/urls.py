from django.urls import path
from . import views

urlpatterns = [
    path('', views.login, name='tela_login'),
    path('cadastro_cli', views.cadastro_cli, name='cadatro_clientes'),
    path('cadastro_func', views.cadastro_func, name='cadastro_funcionario'),
    path('cadastro_veic', views.cadastro_veic, name='cadastro_veiculo'),
    path('select_report', views.select_report, name='tipo_relatorio'),
    path('cadastro_serv', views.cadastro_serv, name='cadastro_servico'),
    path('cadastro_nota', views.cadastro_nota, name='cadastro_nota'),
]