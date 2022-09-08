import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const defaultTextValue = 'Informe seus dados!';
  String _infoText = defaultTextValue;

  void _resetFields() {
    weightController.clear();
    heightController.clear();
    setState(() {
      _infoText = defaultTextValue;
      _formKey = GlobalKey<FormState>();  
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      String imcString = imc.toStringAsPrecision(4);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso ($imcString)";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal ($imcString)";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso ($imcString)";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I ($imcString)";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II ($imcString)";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III ($imcString)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um valor!';
                  }
                },
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um valor!';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: SizedBox(
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculate();
                      } else {
                        setState(() {
                          _infoText = defaultTextValue;
                        });
                      }
                    },
                    child: const Text("CALCULAR"),
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_infoText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
