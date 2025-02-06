# IVR

IVR é uma aplicação que eu desenvolvi com base em um repositório que contém vários desafios técnicos backend, com diversas linguagens.
O intuito era reproduzir uma feature específica de uma empresa. A feature se chama <strong>Call Forwarding</strong>

### Repositório

```shell
https://github.com/CollabCodeTech/backend-challenges?tab=readme-ov-file
```

### Caso de uso
- O cliente está tentando entrar em contato com o número da empresa
- Ele deverá pressionar `1` para ser encaminhado para uma outra chamada. Com o atendente.
- Ele deverá pressionar `2` para deixar uma mensagem de voz. Caso seu problema não tenha urgência
- A chamada deverá ser salva no banco de dados
- Uma página exibindo os detalhes da chamada como: Id, duração, status e link para a mensagem de voz (caso o usuário tenha deixado)

### Passos principais
- Pegar um número de teste no twilio
- Integrar a api do twilio com a aplicação rails
- Configurar ngrok para que o endereço estivesse disponível publicamente
- Configurar webhook no twilio para a porta de entrada da aplicação
- Gerar os comandos via twiml
- Configurar aplicação para que usasasse Turbo Streams, para que ela pudesse ser atualizada automaticamente. Já que as requisições feitas para a aplicação não vinham do usuário, e sim do próprio twilio

## Licença
“O código deste projeto está licenciado sob a licença MIT.”