import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Álcool ou Gasolina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController precoAlcool = TextEditingController();
  TextEditingController precoGasolina = TextEditingController();

  String resposta = '';

  void _qualMelhor() {
    String valorAlcool = precoAlcool.text;
    String valorGasolina = precoGasolina.text;
    double precoAlcoolDouble = double.tryParse(valorAlcool) ?? 0.0;
    double precoGasolinaDouble = double.tryParse(valorGasolina) ?? 0.0;
    setState(() {
      if (precoAlcoolDouble > 0 && precoGasolinaDouble > 0) {
        if (precoGasolinaDouble/10 > precoAlcoolDouble/8) {
          resposta = 'É melhor abastecer com Álcool.';
        } else {
          resposta = 'É melhor abastecer com Gasolina.';
        }
      } else {
        resposta = '';
      }
      precoAlcool.clear();
      precoGasolina.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'lib/images/logo.png'
              ),
              SizedBox(height: 32,),
              Text(
                "Saiba qual a melhor opção para abastecimento do seu carro.",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço alcool, ex: 1.59',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  )
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: precoAlcool,               
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço gasolina, ex: 3.15',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  )
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: precoGasolina,               
              ),
              SizedBox(height: 20,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                ),
                onPressed: () {
                  _qualMelhor();
                }, 
                child: Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                resposta,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
