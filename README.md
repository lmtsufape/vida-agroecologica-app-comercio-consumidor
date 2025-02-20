# Vida Agroecológica - Aplicativo do Consumidor

<p align="center">
  <table>
    <tr>
      <td><img src="lib/assets/images/logoVidaAgro.png" alt="Logo Vida Agroecológica" width="200"/></td>
      <td><img src="lib/assets/images/logo_lmts.png" alt="Logo LMTS" width="200"/></td>
      <td><img src="lib/assets/images/ufape-logo.png" alt="Logo UFAPE" width="200"/></td>
    </tr>
  </table>
</p>


[![Versão Flutter](https://img.shields.io/badge/Flutter->=2.17.6-blue.svg)](https://flutter.dev)
[![Versão](https://img.shields.io/badge/versão-1.1.0-green.svg)](VERSION)
[![Estilo: Flutter](https://img.shields.io/badge/estilo-flutter_lints-blue)](https://pub.dev/packages/flutter_lints)

## Visão Geral

O Vida Agroecológica é um aplicativo de e-commerce desenvolvido em Flutter que conecta produtores rurais e consumidores urbanos em Bonito-PE. Este projeto é uma colaboração entre a Universidade Federal do Agreste de Pernambuco (UFAPE) e comunidades agrícolas locais.

### Principais Funcionalidades

- Catálogo de produtos com suporte a cache de imagens
- Autenticação segura e gerenciamento de perfil
- Acompanhamento de pedidos em tempo real
- Notificações locais para atualizações de pedidos
- Persistência de dados offline
- Integração de pagamentos
- Visualização e download de documentos PDF
- Sistema de avaliação e feedback
- Suporte a múltiplos idiomas
- Design responsivo para diversos tamanhos de tela

## Stack Tecnológica

### Dependências Principais
- Flutter SDK: >=2.17.6
- Dart: Com suporte a null safety
- Gerenciamento de Estado: Provider & GetX
- Rede: Dio & HTTP
- Armazenamento: 
  - Shared Preferences
  - Flutter Secure Storage
  - Path Provider
  - Flutter Downloader

### Componentes de Interface
- Google Fonts
- Flutter SVG
- Animações Lottie
- Ícones Font Awesome
- Framework Responsivo
- Device Preview
- Photo View
- Badges

### Validação e Formatação de Dados
- Validador de CPF/CNPJ
- Validador de Email
- Brasil Fields
- Formatador de Máscara para Texto

### Configuração do Ambiente de Desenvolvimento

```bash
# Versão do Flutter necessária
flutter --version  # Deve ser >=2.17.6

# Instalar dependências
flutter pub get

# Executar servidor de desenvolvimento
flutter run

# Gerar versão de produção
flutter build apk --release  # Para Android
flutter build ios --release  # Para iOS
```

### Estrutura do Projeto
```
lib/
├── assets/
│   └── images/
├── screens/
│   ├── banca/
│   ├── carrousel/
│   ├── cesta/
│   ├── favorito/
│   ├── pedidos/
│   ├── produto/
│   ├── profile/
│   └── auth/
├── components/
├── shared/
└── main.dart
```

## Detalhamento das Funcionalidades

### Autenticação e Segurança
- Armazenamento local seguro para dados sensíveis
- Autenticação baseada em token
- Gerenciamento de permissões
- Suporte a autenticação biométrica

### Recursos Offline
- Cache de imagens
- Persistência local de dados
- Sincronização em segundo plano

### Experiência do Usuário
- Notificações personalizadas
- Diálogo de avaliação do app
- Seleção e manipulação de arquivos
- Visualização de PDF
- Zoom e manipulação de imagens
- Design responsivo para todos os dispositivos

## Implantação

### Requisitos Android
- SDK Mínimo: Android 6.0 (API level 23)
- SDK Alvo: Última versão estável
- Permissões:
  - Internet
  - Armazenamento
  - Câmera (para fotos de perfil)
  - Notificações

### Requisitos iOS
- Versão mínima do iOS: 12.0
- Recursos necessários:
  - Uso da câmera
  - Acesso à biblioteca de fotos
  - Notificações push

## Como Contribuir

1. Faça um fork do repositório
2. Crie sua branch de feature
3. Instale as dependências e configure o ambiente
4. Faça suas alterações
5. Execute os testes
6. Envie um pull request

## Suporte e Contato

- Suporte Técnico: suporte@vidaagroecologica.com.br
- Site do Projeto: N/A
- Parceria UFAPE: [Detalhes de Contato]

## Licença

<!-- Este projeto está licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para obter detalhes. -->

Está em fase de Registro

---

<p align="center">
Desenvolvido com ❤️ pela equipe do LMTS ( Laberatório Multidisciplinar de Tecnologias Sociais)
</p>