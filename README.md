Criando Ambiente Escalavel com Zabbix, Projeto tem como objetivo Auxiliar comunidade Zabbix .

Neste Deploy teremos Seguintes Serviços.
  - Zabbix Server
  - Zabbix Front
  - Zabbix DB (MYSQL 8)
  - Particionamento Banco MYSQL
  - Zabbix Proxy
  - Instalação dos Agentes Linux e Windows
  - Adcionar Templates Automaticamente 
  - Adcionar hosts Automaticamente 

E Muito Mais ......................

Sistema Operacional Ultilizado no Projeto - Rocky Linux 8 com Banco de Dados MYSQL.

https://rockylinux.org/

Requirements
------------

Necessario para deploy das tasks, Maquinas Previamente Instaladas e com Ansible configurado e comunicando com hosts. 

Foi adcionado um vagrantfile Para Exemplo, Ajuste Para ambiente conforme sua necessidade.
-----------------------------------------------------------------------------

Para mais informações Segue Link Abaixo do website do Ansible e Vagrant .

https://docs.ansible.com/

https://www.vagrantup.com/

Procedures Particionamento do Banco de Dados Zabbix.

Agradecimentos ao Script de Particionamento Everaldo.
https://everaldoscabral.blogspot.com/2020/01/sobre-o-zabbix-particionamento-do-banco.html


Dependencies:
------------

  - python3 
  - ansible-galaxy collection install community.zabbix
  - zabbix-api >= 0.5.4 

Obs: Alterar conforme sua necessidade o arquivo ansible.cfg para sua arquitetura.

Neste Projeto foram ultilizados 6 Servidores:

  - Frontend zabbix / Grafana Server
  - Zabbix-server
  - Zabbix-Proxy
  - Banco de Dados

Servidores Windows - Ultilizado para Testes de Instalaçao do agente zabbix e adcionar ao frontend do zabbix.

  - DC01
  - DC02

O que Projeto de Automação Obterá apos a Implementação.
-------------------------------------------------------

Roles do Projeto: 
-----------------  

  - zabbix_server
  - zabbix_proxy
  - zabbix_front
  - zabbix_db
  - grafana_server
  - zabbix_agent + linux ou Windows
  - zabbix_agent_windows
  - api_add_linux
  - api_add_windows
  
Padronização do Ambiente 

  - Common_Linux
  - Common_Windows

Variables
--------------
Arquivo hosts - Ajustar os IPs Conforme sua infraestrutura .

Observação Variaveis em group_vars, Alterar conforme sua necessidade.

Exemplo de Ultilização 
----------------

ansible-playbook deploy.zabbix.yml

  roles:
   
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

License
-------
O software do Zabbix é lançado sob a versão 2 da GNU General Public License (GPL). O conteúdo da GPL pode ser encontrado em http://www.fsf.org/licenses/.

Vocá pode distribuí-lo e/ou modificá-lo sob os termos da GNU GPL conforme publicado pela Free Software Foundation; tanto a versão 2 da Licença, ou opcionalmente qualquer versão posterior.

Para obter detalhes adicionais, incluindo informações comuns sobre a GPL, consulte as Perguntas e Respostas gerais da Free Software Foundation em http://www.fsf.org/licenses/gpl-faq.html.

Zabbix é um software de código aberto e gratuito, entretanto, se vocá usar o Zabbix comercialmente, pedimos que vocá apoie o desenvolvimento do Zabbix adquirindo algum nível de suporte comercial.
