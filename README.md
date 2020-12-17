# Sample Login com MeuID
Sejam bem-vindos! 
Neste README você encontra o passo a passo a ser feito para adicionar o Login com MeuID em seu app iOS (Swift e Objective C). Caso prefira, também temos os Samples dos dois apps aqui, basta baixar a pasta inteira. Para acessar o projeto em Swift, vá em `sampleloginmeuid-ios > Swift > SampleLoginMeuID` e para acessar o projeto em ObjC, vá em `sampleloginmeuid-ios > Obj-c > SampleLoginMeuID`.

# Swift

## 1. Adicionando o botão
No projeto Sample, adicionamos o botão na Storyboard e configuramos seu layout na ViewController, definindo os 3 diferentes layouts que temos disponíveis. Criamos um enum para indicar o tipo do botão, porém se seu app vai usar apenas um estilo, não há a necessidade de colocar essa lógica em seu código. Segue o enum:
```
enum ButtonStyle {
    case Purple
    case WhiteWithoutBorder
    case WhiteWithBorder
}
```

Em nossa [documentação](<adicionar_link_da_doc>) mostramos os layouts disponíveis.

Adicionamos as imagens do logo do MeuID na pasta `Assets.xcassets` com os seguintes nomes:
- logo roxo: logo_meuid_purple
- logo branco: logo_meuid_white

Para aplicar apenas o layout roxo com texto em branco, adicione o seguinte código:
```
loginButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
loginButton.setTitle("Login com MeuID", for: .normal)
loginButton.layer.cornerRadius = 8.0
loginButton.backgroundColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
let logo = UIImage(named: "logo_meuid_white")
loginButton.setImage(logo , for: .normal)
loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
```

Para aplicar apenas o layout branco com texto roxo e sem borda, adicione o seguinte código:
```
loginButton.tintColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
loginButton.setTitleColor(#colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1), for: .normal)
loginButton.setTitle("Login com MeuID", for: .normal)
loginButton.layer.cornerRadius = 8.0
loginButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let logo = UIImage(named: "logo_meuid_purple")
loginButton.setImage(logo , for: .normal)
loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
```

Para aplicar apenas o layout branco com texto roxo e com borda roxa, adicione o seguinte código:
```
loginButton.tintColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
loginButton.setTitleColor(#colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1), for: .normal)
loginButton.setTitle("Login com MeuID", for: .normal)
loginButton.layer.cornerRadius = 8.0
loginButton.layer.borderColor = #colorLiteral(red: 0.4528235197, green: 0.3076393604, blue: 1, alpha: 1)
loginButton.layer.borderWidth = 1.0
loginButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let logo = UIImage(named: "logo_meuid_purple")
loginButton.setImage(logo , for: .normal)
loginButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 20)
```

## 2. Adicionando a ação do botão
Como nosso Sample envolve uma Storyboard, puxamos um `IBAction` na ViewController e adicionamos ali a ação que deve ser feita ao clicar em nosso botão: abrir o deeplink que redirecionará para o app do MeuID.

```
@IBAction func didTapLogin(_ sender: UIButton) {
    if let url = URL(string: getDeepLink()) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
```

Nessa função, chamamos uma outra função que criamos, com o nome de `getDeeplink()`. Essa outra função, como diz o nome, serve para pegar o deeplink correto, e separamos ele para melhor entendimento de como o deeplink deve ser gerado.

Como dito em nossa documentação, cada aplicativo que quer usar o Login com MeuID deve ter um `application id` para que o MeuID consiga identificar qual aplicativo está chamando. Sendo assim, no código abaixo você deve substituir o `aplication_id` para o id que representa seu aplicativo.

```
let aplicationID = "application_id"

func getDeepLink() -> String {
    return "meuid://meuid?action=MEUID_AUTHENTICATION&applicationId=\(aplicationID)&parameters=eyJvcmlnaW4iOiAiTU9CSUxFIn0="
}
```

## 3. Configurando a volta do Login com MeuID
Agora falta apenas o retorno recebido pelo app do MeuID!

Para que seu aplicativo receba a resposta de maneira correta do MeuID, deve ser adicionada uma configuração na raiz do projeto: 
- Abrir `SeuProjeto > SeuTarget > Info > URL Types`
- Clicar no botão `+` para adicionar uma URL Type
- Em `URL Schemes`, adicionar: `meuid-application_id` (lembrando que este `application_id` é o mesmo que foi adicionado na ViewController. Sendo assim, o padrão é `meuid-` + seu application id)

## 4. Obtendo os parâmetros do retorno do MeuID


# Objective C

## 1. Adicionando o botão
No projeto Sample, adicionamos o botão na Storyboard e configuramos seu layout na ViewController, definindo os 3 diferentes layouts que temos disponíveis. Criamos três funções diferentes para indicar o tipo do botão, porém se seu app vai usar apenas um estilo, não há a necessidade de colocar essa lógica em seu código. 

Em nossa [documentação](<adicionar_link_da_doc>) mostramos os layouts disponíveis.

Adicionamos as imagens do logo do MeuID na pasta `Assets.xcassets` com os seguintes nomes:
- logo roxo: logo_meuid_purple
- logo branco: logo_meuid_white

Para aplicar apenas o layout roxo com texto em branco, adicione o seguinte código:
```
- (void)setupLoginButtonPurple {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: UIColor.whiteColor];
    [self.loginButton setBackgroundColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_white"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}
```

Para aplicar apenas o layout branco com texto roxo e sem borda, adicione o seguinte código:
```
- (void)setupLoginButtonWhiteWithoutBorder {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    [self.loginButton setTitleColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor: UIColor.whiteColor];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_purple"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}
```

Para aplicar apenas o layout branco com texto roxo e com borda roxa, adicione o seguinte código:
```
- (void)setupLoginButtonWhiteWithBorder {
    [self.loginButton setTitle: @"Login com MeuID" forState:UIControlStateNormal];
    [self.loginButton setTintColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00]];
    [self.loginButton setTitleColor: [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor: UIColor.whiteColor];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.layer.borderColor = [UIColor colorWithRed: 0.43 green: 0.31 blue: 0.96 alpha: 1.00].CGColor;
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.clipsToBounds = YES;
    UIImage *logo = [UIImage imageNamed:@"logo_meuid_purple"];
    [self.loginButton setImage:logo forState:UIControlStateNormal];
    [self.loginButton setImageEdgeInsets:UIEdgeInsetsMake(8.0, 0.0, 8.0, 20.0)];
}
```

## 2. Adicionando a ação do botão
Como nosso Sample envolve uma Storyboard, puxamos um `IBAction` na ViewController e adicionamos ali a ação que deve ser feita ao clicar em nosso botão: abrir o deeplink que redirecionará para o app do MeuID. O IBAction no arquivo .m da ViewController fica assim:

```
- (IBAction)didTapLogin:(UIButton *)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString: [self getDeeplink]];
    [application openURL:URL options:@{} completionHandler:nil];
}
```

Nessa função, chamamos uma outra função que criamos, com o nome de `[getDeeplink]`. Essa outra função, como diz o nome, serve para pegar o deeplink correto, e separamos ele para melhor entendimento de como o deeplink deve ser gerado.

Como dito em nossa documentação, cada aplicativo que quer usar o Login com MeuID deve ter um `application id` para que o MeuID consiga identificar qual aplicativo está chamando. Sendo assim, no código abaixo você deve substituir o `aplication_id` para o id que representa seu aplicativo. No arquivo .h da ViewController, adicionamos a propriedade do `aplication_id`:

```
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
```

E no .m da ViewController, temos a função que define o deeplink correto:

```
- (NSString *)getDeeplink {
    _applicationID = @"applicationID";
    return [NSString stringWithFormat:@"meuid://meuid?action=MEUID_AUTHENTICATION&applicationId=%@&parameters=eyJvcmlnaW4iOiAiTU9CSUxFIn0=", _applicationID];
}
```

## 3. Configurando a volta do Login com MeuID
Agora falta apenas o retorno recebido pelo app do MeuID!

Para que seu aplicativo receba a resposta de maneira correta do MeuID, deve ser adicionada uma configuração na raiz do projeto: 
- Abrir `SeuProjeto > SeuTarget > Info > URL Types`
- Clicar no botão `+` para adicionar uma URL Type
- Em `URL Schemes`, adicionar: `meuid-application_id` (lembrando que este `application_id` é o mesmo que foi adicionado na ViewController. Sendo assim, o padrão é `meuid-` + seu application id)

## 4. Obtendo os parâmetros do retorno do MeuID
