![Resilia Database](https://github.com/HannaJacob/Grupo5_Modulo1/assets/144841827/7a210b43-ae7c-4c2d-bbf0-1a0991f38786)
<p align="center">
<img src="https://img.shields.io/static/v1?label=License&message=Apache&color=green&style=for-the-badge"/>
<img src="http://img.shields.io/static/v1?label=STATUS&message=CONCLUIDO&color=GREEN&style=for-the-badge"/>
</p>
Este script SQL foi desenvolvido como parte do esforço de modernização da Resilia, com o objetivo de aprimorar o armazenamento e a gestão de dados relacionados à estrutura de ensino da empresa. O código cria um banco de dados denominado "Resilia" e define tabelas essenciais para organizar informações sobre cursos, turmas, alunos, módulos, disciplinas, turnos, facilitadores e boletins.

A estrutura do banco de dados busca superar os desafios associados ao armazenamento disperso de dados em planilhas, proporcionando uma base consolidada e eficiente para a extração de informações estratégicas. Além disso, o script inclui um gatilho que registra automaticamente mudanças de status dos alunos, contribuindo para uma trilha de auditoria completa.

Este projeto visa facilitar a administração e análise de dados acadêmicos dentro da Resilia, contribuindo para uma gestão mais eficaz e informada da estrutura educacional da empresa.

## 🔨 Funcionalidades
:heavy_check_mark: `Funcionalidade 1` `Tabelas`:
  
- **Curso:** Esta tabela armazena informações sobre os cursos. Cada curso tem um Id_Curso (chave primária), Nome, Carga_horaria, Data_Inicio e Data_termino.
- **Turma:** Esta tabela armazena informações sobre as turmas. Cada turma tem um Id_Turma (chave primária), Nome_Turma e Id_Curso (chave estrangeira que referencia Id_Curso na tabela Curso). Isso significa que cada turma está associada a um curso.
- **Aluno:** Esta tabela armazena informações sobre os alunos. Cada aluno tem um Id_Aluno (chave primária), Nome, Status, Id_Turma (chave estrangeira que referencia Id_Turma na tabela Turma) e Id_Curso (chave estrangeira que referencia Id_Curso na tabela Curso). Isso significa que cada aluno está associado a uma turma e a um curso.
- **Módulo:** Esta tabela armazena informações sobre os módulos. Cada módulo tem um Id_Módulo (chave primária), Nome e Id_Curso (chave estrangeira que referencia Id_Curso na tabela Curso). Isso significa que cada módulo está associado a um curso.
- **Disciplina:** Esta tabela armazena informações sobre as disciplinas. Cada disciplina tem um Id_Disciplina (chave primária), Nome, Carga_Horaria, Dias, Data_inic, Data_term, Id_Curso (chave estrangeira que referencia Id_Curso na tabela Curso) e Id_Módulo (chave estrangeira que referencia Id_Módulo na tabela Módulo). Isso significa que cada disciplina está associada a um curso e a um módulo.
- **Turno:** Esta tabela armazena informações sobre os turnos. Cada turno tem um Id_Turno (chave primária), Horario e Id_Turma (chave estrangeira que referencia Id_Turma na tabela Turma). Isso significa que cada turno está associado a uma turma.
- **Facilitador:** Esta tabela armazena informações sobre os facilitadores. Cada facilitador tem um Id_Facilitador (chave primária), Nome e Id_Disciplina (chave estrangeira que referencia Id_Disciplina na tabela Disciplina). Isso significa que cada facilitador está associado a uma disciplina.
- **Facilitador_Turma:** Esta tabela é uma tabela de junção que associa facilitadores a turmas. Ela tem um Id_Facilitador (chave estrangeira que referencia Id_Facilitador na tabela Facilitador) e um Id_Turma (chave estrangeira que referencia Id_Turma na tabela Turma).
- **Boletim:** Esta tabela armazena informações sobre os boletins dos alunos. Ela tem um Id_Curso (chave estrangeira que referencia Id_Curso na tabela Curso), um id_Disciplina (chave estrangeira que referencia id_Disciplina na tabela Disciplina), um Id_Aluno (chave estrangeira que referencia Id_Aluno na tabela Aluno), Notas_Aluno, Frequência e Situação.
- **LogStatus:** Esta tabela armazena informações sobre as mudanças de status dos alunos. Ela tem um Id_Log (chave primária), um Id_Aluno (chave estrangeira que referencia Id_Aluno na tabela Aluno), Status_Antigo, Status_Novo e Data_Mudanca.
- **Disciplina_Curso:** Esta tabela proporciona uma melhora ao banco de dados, especialmente na normalização do esquema. Normalização é o processo de organização de um banco de dados para reduzir a redundância e dependências desnecessárias, promovendo a consistência e a integridade dos dados.
A tabela Disciplina_Curso cria uma relação muitos-para-muitos entre as tabelas "Disciplina" e "Curso", o que é uma abordagem mais flexível e normalizada do que incluir diretamente a chave estrangeira "Id_Curso" na tabela "Disciplina". Isso permite que uma disciplina possa estar associada a vários cursos e vice-versa.
A normalização ajuda a evitar redundâncias e a garantir que as relações entre as entidades sejam mantidas de forma consistente. Ela é especialmente útil à medida que o banco de dados cresce e é modificado ao longo do tempo.
Além disso, a normalização pode facilitar a manutenção do banco de dados, tornando as operações de inserção, atualização e exclusão mais diretas e menos propensas a erros. No entanto, a eficácia das mudanças depende também das necessidades específicas do sistema e da forma como os dados são consultados e manipulados.

Portanto, a adição da tabela Disciplina_Curso é uma prática recomendada em muitos casos, promovendo uma estrutura mais normalizada e flexível para o banco de dados.


:heavy_check_mark: `Funcionalidade 2` `Gatilhos (trigger)`:

- **AtualizacaoStatus:** É um gatilho que é acionado após uma atualização na tabela Aluno. Este gatilho tem a função de registrar informações importantes na tabela LogStatus. As informações registradas incluem o ID do aluno, o status antigo, o novo status e a data da mudança. Essencialmente, o gatilho cria uma trilha de auditoria que permite acompanhar as mudanças nos status dos alunos ao longo do tempo. Isso é fundamental para monitorar e analisar as alterações no estado dos alunos, proporcionando uma visão histórica que pode ser valiosa para fins de auditoria e análise de tendências.

:heavy_check_mark: `Funcionalidade 3` `Visualizações (Views)`:

- **EvasaoPorTurma:** É uma visualização(View) que calcula o percentual de evasão por turma.
 
:heavy_check_mark: `Funcionalidade 4` `Consultas Exemplo`:

- Apresenta consultas SQL de exemplo para realizar operações específicas:

1 - Identificar alunos aprovados em uma turma específica.

2 - Encontrar facilitadores associados a mais de uma turma.

3 - Selecionar a quantidade total de estudantes cadastrados no banco.
 
:heavy_check_mark: `Funcionalidade 6` `Configurações Adicionais`:

Utiliza o delimitador // para definir o final do comando em determinadas partes do script, especialmente para a correta criação do gatilho (AtualizacaoStatus).

## :books: Técnicas e tecnologias utilizadas 

- ``MySQL``

## 📁 Acesso ao projeto
Você pode acessar os arquivos do projeto clicando [aqui](https://github.com/lastfirefly/ProjetoGrupo_3/tree/main/SQL).

## 📃 Licença

Este projeto está licenciado sob a Licença Apache - consulte o arquivo [LICENSE](LICENSE) para obter mais detalhes.
