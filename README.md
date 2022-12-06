# jogadores_da_copa

Projeto de exemplo - Listagem dos jogadores da Copa do Mundo FIFA Qatar 2022.

Versão do Flutter utilizada: 3.3.9

Para rodar o projeto é necessário copiar e arquivo .env.example e colar com o nome .env na pasta raiz do projeto. 

Plataformas testadas e funcionais:
- Android
- iOS

Exemplo de arquivo .env:
```
BASE_URL=https://v3.football.api-sports.io
REST_CLIENT_CONNECT_TIMEOUT=60000
REST_CLIENT_RECEIVE_TIMEOUT=60000
APISPORTS_KEY=c0digodach4v3
```
Onde:

A ```BASE_URL``` é obrigatório utilizar o mesmo valor atribuido no exemplo acima;

O ```REST_CLIENT_CONNECT_TIMEOUT``` e o ```REST_CLIENT_RECEIVE_TIMEOUT``` é definida em milissegundos;

A ```APISPORTS_KEY``` é a chave de acesso da API


**IMPORTANTE**

Para conseguir acesso a chave, é necessário se registrar ou fazer login em https://api-sports.io/. Ao fazer login, você será redirecionado ao site https://dashboard.api-football.com/. No menu lateral esquerdo selecionar Apis -> Football, e então
clicar na opção Live Demo. Copie e cole o valor do campo API KEY como valor da var APISPORTS_KEY no arquivo .env

Sem a chave, não será possível consumir os dados da API.
