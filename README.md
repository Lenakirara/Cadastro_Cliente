# Boas vindas ao repositório Cadastro de Cliente!

Projeto de atividade final do nível básico [ABAP 4 Girls](https://abapforgirls.tech/)

<div align="center">
     
![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/a2f22a8b-e6af-4767-992c-dab477201c51)

</div>

## Habilidades desenvolvidas:
1. Criação e Manipulação de Dados:
     -  Criação de objetos de dicionário de dados e tabela
     -  Uso de tabelas internas e estruturas de dados para armazenamento temporário
2. Desenvolvimento de Interface de Usuário:
     - Utilização de parâmetros e select-options em telas de seleção
     - Implementação de radiobuttons para alternar entre diferentes operações
     - Controle de visibilidade e editabilidade de campos na interface com base na operação selecionada
3. Operações CRUD:
     - Desenvolvimento das operações de criação, leitura, atualização e exclusão de registros
4. Validação e Mensagens:
     - Validação de dados de entrada
     - Exibição de mensagens de erro e sucesso para o usuário
5. Interação com Banco de Dados:
     - Inserção, consulta, atualização e exclusão de registros na base de dados

## Objetivo do projeto
O projeto visa criar um sistema de gerenciamento de clientes, abrangendo operações CRUD (Create, Read, Update, Delete). Ele permite o cadastro de novos clientes com informações como nome, CPF, RG, data de nascimento e endereço. Além disso, oferece funcionalidades para exibir, editar e excluir dados de clientes. O sistema utiliza uma interface de usuário com rádio botões para alternar entre as operações e interage com uma tabela de clientes.

## Especificações do projeto
1. Radiobuttons:
     - `Cadastrar Cliente` DEFAULT 'X'
     -  `Exibir Dados do Cliente`
     -  `Editar Dados do Cliente`
     -  `Deletar Cadastro`
  
![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/adba3b80-38da-4242-8d06-3866f3dc1eaa)

2. Tela:  `Cadastrar Cliente`
   - Confirmar mensagem de sucesso quando cadastro for inserido.
   - Campos nome, cpf e rg precisam ser obrigatoriamente informados.
   
![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/941540e6-8bb4-4a19-99e1-91ba684d362c)

3. Tela: `Exibir Dados do Cliente`
   - Informar na tela todos os registros encontrados, com a descrição dos campos.
  
![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/48795cfe-2046-41e1-90b0-a2a01a41f8f3)

4. Tela: `Editar Dados do Cliente`
    - Verificar se cpf e rg estão preenchidos.
    - Selecionar o registro na tabela de acordo com cpf e rg informado. Caso encontrado realizar modificação da linha na nova tabela.

![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/f43b91dd-c606-4278-b109-27f6c247ce3e)

5. Tela: `Deletar Cadastro`
     - Realizar a exclusão do registro com base nos valores de cpf e rg fornecidos na entrada.
       
![image](https://github.com/Lenakirara/Cadastro_Cliente/assets/45247383/f264fd52-263c-4094-87ca-435c1a4d0992)





   
