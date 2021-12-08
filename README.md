Role Name
=========
FINALIZANDO PROJETO EM DESENVOLVIMENTO.

Padronização do Ambiente e Instalação do Zabbix 3 Camadas com particionamento banco de dados + Proxy + Agents + Adção de hosts Automaticamente e ++++++.

Sistema Operacional Ultilizado no Projeto - Rocky Linux 8 com Banco de Dados MYSQL.

https://rockylinux.org/

Requirements
------------

Necessario para deploy das tasks, Maquinas Previamente Instaladas e com Ansible configurado e comunicando com hosts. 

Foi adcionado um vagrantfile para os testes, Ajuste conforme sua necessidade.
-----------------------------------------------------------------------------

Para mais informações Segue Link Abaixo do website do Ansible e Vagrant .

https://docs.ansible.com/

https://www.vagrantup.com/

Procedures Particionamento do Banco de Dados Zabbix.

https://blog.zabbix.com/partitioning-a-zabbix-mysql-database-with-perl-or-stored-procedures/13531/


Dependencies:
------------

  - python3 
  - ansible-galaxy collection install community.zabbix
  - zabbix-api >= 0.5.4 

Neste Projeto foram ultilizados 4 Servidores:

  - Frontend zabbix / Grafana Server
  - Zabbix-server
  - Zabbix-Proxy
  - Banco de Dados

Projeto Realizado é uma forma de auxiliar comunidade Zabbix Com deploy Rapido do ambiente para Homologação.

O que Projeto de Automação Obterá apos a Implementação.
-------------------------------------------------------

Roles do Projeto: 
-----------------  
  - Zabbix Server 
  - Zabbix Frontend
  - MYSQL , banco de dados Particionando .
  - Grafana Server - Plugin Zabbix
  - Zabbix Proxy 
  - Adção de hosts Automaticos
  - Instalação dos Agentes Linux
  - Adcionar hosts Linux  / Templates
  - Adcionar hosts Windows / Templates
  - Instalação de Agentes Windows em Desenvolvimento.
  - Adcionado Configurações Monitoramento Apache 
  - Adcionado ao Projeto odbc Connector configurações do proxy e adcionado configurações basicas do odbc.ini
    Ajustar conforme sua necessidade e verificar versão do MYSQL , acessando banco e executando select version ();
  
Variables
--------------
Ajustar de Acordo seu Ambiente.

Arquivo hosts :

Ajustar os IPs Conforme sua infraestrutura .

Variaveis em group_vars:

ansible_python_interpreter: auto 
ansible_ssh_port: 22
ansible_become : True
ansible_become_user: root
ansible_user: root
ansible_pass: batatinha@2021

Exemplo de Ultilização 
----------------

ansible-playbook deploy.zabbix.yml

  roles:
   
    <!-- - role: Common_Linux
    - role: db_zabbix
      when: ansible_host == zbx_db
    - role: zabbix_server
      when: ansible_host == zbx_srv
    - role: zabbix_front
      when: ansible_host == zbx_front
    - role: zabbix_agent_linux
      when: ansible_host == zbx_front
    - role: zabbix_agent_linux
      when: ansible_host == zbx_db
    - role: grafana-server
      when: ansible_host == zbx_front
    - role: zabbix-proxy
      when: ansible_host == zbx_proxy
    - role: Common_Windows 
      when: ansible_host == DC01 -->

License
-------
O software do Zabbix é lançado sob a versão 2 da GNU General Public License (GPL). O conteúdo da GPL pode ser encontrado em http://www.fsf.org/licenses/.

Vocá pode distribuí-lo e/ou modificá-lo sob os termos da GNU GPL conforme publicado pela Free Software Foundation; tanto a versão 2 da Licença, ou opcionalmente qualquer versão posterior.

Para obter detalhes adicionais, incluindo informações comuns sobre a GPL, consulte as Perguntas e Respostas gerais da Free Software Foundation em http://www.fsf.org/licenses/gpl-faq.html.

Zabbix é um software de código aberto e gratuito, entretanto, se vocá usar o Zabbix comercialmente, pedimos que vocá apoie o desenvolvimento do Zabbix adquirindo algum nível de suporte comercial.
