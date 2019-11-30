from django.urls import path
from . import views

urlpatterns = [
    path('', views.login, name='tela_login'),
    path('cadastro_cli', views.cadastro_cli, name='cadatro_clientes'),
    path('cadastro_veic', views.cadastro_veic, name='cadastro_veiculo'),
    path('select_report', views.select_report, name='tipo_relatorio'),
    path('cadastro_serv', views.cadastro_serv, name='cadastro_servico'),
    path('cadastro_nota', views.cadastro_nota, name='cadastro_nota'),
    path('cadastro_func', views.cadastro_func, name='cadastro_funcionario'),
    path('show_func', views.show_func, name='mostrar_funcionarios'),
    path('edit_func/<int:matricula>', views.edit_func, name='editar_funcionario'),
    path('update_func/<int:matricula>', views.update_func, name='atualizar_funcionario'),
    path('delete_func/<int:matricula>', views.delete_func, name='deletar_funcionario')
]