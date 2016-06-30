# Teste backend SAGE

## Dependências

* Ruby 2.3.1
* Postgresql
* PhantomJS para executar os testes do RSpec

## Rodando a aplicação
Copie o arquivo `config/database.example.yml` para `config/database.yml` e configure de acordo com os dados da sua instância do postgresql.

`$ bundle install`

`$ rake db:create db:migrate`

`$ rails s`

## Considerações

rode a suíte de testes com:

`$ bundle exec rspec spec`