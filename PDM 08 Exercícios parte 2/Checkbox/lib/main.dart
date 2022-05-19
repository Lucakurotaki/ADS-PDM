import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Políticas de Privacidade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<bool?> isChecked = [false, false, false, false];
  bool allTrue = false;

  void checkItem(bool hasAllCheckValue, [bool? allCheckValue]){
    
    if(hasAllCheckValue){
      if(allCheckValue == true){
        for(int i=0; i<isChecked.length-1; i++){
          isChecked[i] = true;
          allTrue = true;
        }
        isChecked[3] = true;
      }else if(allCheckValue == null && allTrue == true){
        for(int i=0; i<isChecked.length-1; i++){
          isChecked[i] = false;
        }
        isChecked[3] = false;
        allTrue = false;
      }else if(allCheckValue == null){
        isChecked[3] = false;
      }else if(allCheckValue == false){
        for(int i=0; i<isChecked.length-1; i++){
          isChecked[i] = true;
        }
        isChecked[3] = true;
        allTrue = true;
      }

    }else{
      if((isChecked[0] == true) && (isChecked[1] == true) && (isChecked[2] == true)){
        setState(() {
          isChecked[3] = true;
          allTrue = true;
        });
      }else if((isChecked[0] == false) && (isChecked[1] == false) && (isChecked[2] == false)){
        setState(() {
          isChecked[3] = false;
        });
      }else if(isChecked[0] == true || isChecked[1] == true || isChecked [2] == true){
        setState(() {
          isChecked[3] = null;
          allTrue = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'É a partir do seu consentimento que tratamos os seus dados pessoais. O consentimento é a manifestação livre, informada e inequívoca pela qual você autoriza a (nome empresarial simplificado) a tratar seus dados. Assim, em consonância com a Lei Geral de Proteção de Dados, seus dados só serão coletados, tratados e armazenados mediante prévio e expresso consentimento. O seu consentimento será obtido de forma específica para cada finalidade acima descrita, evidenciando o compromisso de transparência e boa-fé da (nome empresarial simplificado) para com seus usuários/clientes, seguindo as regulações legislativas pertinentes. Ao utilizar os serviços da (nome empresarial simplificado) e fornecer seus dados pessoais, você está ciente e consentindo com as disposições desta Política de Privacidade, além de conhecer seus direitos e como exercê-los. A qualquer tempo e sem nenhum custo, você poderá revogar seu consentimento. É importante destacar que a revogação do consentimento para o tratamento dos dados pode implicar a impossibilidade da performance adequada de alguma funcionalidade do site que dependa da operação. Tais consequências serão informadas previamente.',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      value: isChecked[0],
                      onChanged: (bool? value){
                        setState(() {
                          isChecked[0] = value!;
                          checkItem(false);
                        });
                      },
                    ),
                    const Text('Aceito os Termos e Condições', style: TextStyle(decoration: TextDecoration.underline))
                  ],
                ),

                Row(
                  children: [
                    Checkbox(
                      value: isChecked[1],
                      onChanged: (bool? value){
                        setState(() {
                          isChecked[1] = value!;
                          checkItem(false);
                        });
                      },
                    ),
                    const Text('Aceito a Política de Uso de Dados', style: TextStyle(decoration: TextDecoration.underline))
                  ],
                ),
                
                Row(
                  children: [
                    Checkbox(
                      value: isChecked[2],
                      onChanged: (bool? value){
                        setState(() {
                          isChecked[2] = value!;
                          checkItem(false);
                        });
                      },
                    ),
                    const Text('Quero receber e-mails sobre novidades', style: TextStyle(decoration: TextDecoration.underline))
                  ],
                ),

                Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      value: isChecked[3],
                      onChanged: (bool? value){
                        setState(() {
                          checkItem(true, value);
                        });
                      },
                    ),
                    const Text('Aceitar todos os itens acima', style: TextStyle(decoration: TextDecoration.underline))
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
