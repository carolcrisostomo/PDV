# Projeto Caixa - Delphi XE7

Versão transacional completa com arquitetura em camadas (Presentation, Application, Infrastructure).

## Conteúdo do pacote
- Project.dpr / ProjetoCaixaXE7.dproj (ponto de entrada e projeto XE7)
- Database/CriarTabelas_Firebird3.sql (Firebird 3.0)
- Aplicacao/ (Interfaces e Implementação dos controladores)
- Infraestrutura/ (Adaptadores e Persistência com dbExpress - Interbase)
- Apresentacao/ (Forms e Modais)

## Como abrir
1. Crie um banco Firebird 3.0 (arquivo .fdb).
2. Execute `Database/CriarTabelas_Firebird3.sql` no IBExpert/ISQL para criar tabelas e generators.
3. Abra `ProjetoCaixaXE7.dproj` no Delphi XE7.
4. Ajuste o caminho do banco em `Project.dpr` (linha com dmConexaoFirebird.ConfigurarConexao).
5. Compile e execute.

## Notas rápidas
- Acesso a dados usando componentes das abas *Interbase* e *Data Access* (TSQLConnection, TSQLDataSet, TDataSetProvider).
- Transações: StartTransaction / Commit / Rollback encapsuladas em `UUnidadeDeTrabalhoSimple`.
- UI usa TClientDataSet desconectado, fornecido pelos repositórios via TDataSetProvider.
