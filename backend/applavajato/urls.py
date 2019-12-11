from django.urls import path
from . import views

urlpatterns = [
    #INICIO
    path('homepage', views.homepage, name="pagina_inicial"),

    #URL DE LOGIN
    path('', views.logar_usuario, name='tela_inicial'),    
    path('deslogar_usuario', views.deslogar_usuario, name="deslogar_usuario"),
   
    #URLS PARA FUNCIONARIOS
    path('cadastro_func', views.cadastro_func, name='cadastro_funcionario'),
    path('show_all_func', views.show_all_func, name='mostrar_funcionarios'),
    path('show_func/<int:matricula>', views.show_func, name='mostrar_um_funcionario'),
    path('edit_func/<int:matricula>', views.edit_func, name='editar_funcionario'),
    path('update_func/<int:matricula>', views.update_func, name='atualizar_funcionario'),
    path('delete_func/<int:matricula>', views.delete_func, name='deletar_funcionario'),

    #URLS PARA SERVICOS
    path('cadastro_serv', views.cadastro_serv, name='cadastro_servico'),
    path('show_all_serv', views.show_all_serv, name='mostrar_servicos'),
    path('show_serv/<int:id_servico>', views.show_serv, name='mostrar_um_servico'),
    path('edit_serv/<int:id_servico>', views.edit_serv, name='editar_servico'),
    path('update_serv/<int:id_servico>', views.update_serv, name='atualizar_servico'),
    path('delete_serv/<int:id_servico>', views.delete_serv, name='deletar_servico'),

    #URLS PARA VEICULOS
    path('cadastro_veic/<str:registro_pessoal>', views.cadastro_veic, name='cadastro_veiculo'),
    path('show_all_veic', views.show_all_veic, name='mostrar_veiculos'),
    path('show_veic/<str:placa>', views.show_veic, name='mostrar_um_veiculo'),
    path('show_veic_cli/<str:registro_pessoal>', views.show_veic_cli, name='mostrar_veiculos_cliente'),
    path('edit_veic/<str:placa>', views.edit_veic, name='editar_veiculo'),
    path('update_veic/<str:placa>', views.update_veic, name='atualizar_veiculo'),
    path('delete_veic/<str:placa>', views.delete_veic, name='deletar_veiculo'),

    #URLS PARA CLIENTES
    path('cadastro_cli', views.cadastro_cli, name='cadatro_cliente'),
    path('show_all_cli', views.show_all_cli, name='mostrar_clientes'),
    path('show_cli/<str:registro_pessoal>', views.show_cli, name='mostrar_um_cliente'),
    path('edit_cli/<str:registro_pessoal>', views.edit_cli, name='editar_cliente'),
    path('update_cli/<str:registro_pessoal>', views.update_cli, name='atualizar_cliente'),
    path('delete_cli/<str:registro_pessoal>', views.delete_cli, name='deletar_cliente'),

    #URLS PARA NOTAS
    path('cadastro_nota/<str:registro_pessoal>', views.cadastro_nota, name='cadastro_nota'),
    path('show_all_notas', views.show_all_notas, name='mostrar_notas'),
    path('edit_nota/<str:id_nota>', views.edit_nota, name='editar_nota'),
    path('show_nota/<int:id_nota>', views.show_nota, name='mostrar_uma_nota'),
    path('delete_nota/<int:id_nota>', views.delete_nota, name='deletar_nota'),
]