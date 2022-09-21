
<h1 align="center">
  <br>
  <img src="https://user-images.githubusercontent.com/7094345/191499215-6bbbcb3e-9fad-439b-a051-2b95c149254b.png" alt="KN Movie" width="200"></a>
</h1>

<h4 align="center">Flutter App de Filme, que mostra um filme de minha escolha aleatório feito em Clean Architecture, TDD e SOLID.</h4>

<h1 align="center">
  <img align="center" alt="KN Movei" title="#screen" width="250px" src="./assets/gif/preview_app.gif" />
</h1>

## Clean Architecture
![clean_arch](https://user-images.githubusercontent.com/7094345/153762252-8fe06389-1d3d-41a7-8c96-5b0274a773f7.png)

* ##### Data & Platform layer
A camada de dados está localizada na camada mais externa. Essa camada consiste em código-fonte de dados, como consumir API REST, acesso ao banco de dados local, Firebase ou outras fontes. Além disso, nessa camada, geralmente existe o código da plataforma que cria a interface do usuário (widgets).


* ##### Presentation Layer
A camada de apresentação consiste no código para acessar os dados do aplicativo a partir de um repositório.Além disso, existe o código para gerenciamento de estado, aqui foi utilizado o GetX.



* ##### Domain Layer
A camada de domínio é a mais profunda da arquitetura limpa. Essa camada contém o código para aplicativos de lógica de negócios, como entidades e casos de uso.

## Packages
- [equatable](https://pub.dev/packages/equatable)
- [dartz](https://pub.dev/packages/dartz)
- [dio](https://pub.dev/packages/dio)
- [get](https://pub.dev/packages/get)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [intl](https://pub.dev/packages/intl)
- [lottie](https://pub.dev/packages/lottie)
## Test Packages
- [mockito](https://pub.dev/packages/mockito)
## Credits

- [RenanKanu](https://www.renankanu.com.br/)

---
## License

MIT

---
