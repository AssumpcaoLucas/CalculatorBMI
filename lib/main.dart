import 'package:flutter/material.dart';
import 'package:my_project/widgets/left_bar.dart';
import 'package:my_project/widgets/right_bar.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      //Pesquisar depois o que é theme 
      theme: ThemeData(
        primaryColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

//Criando o HomeSceen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    //Declarando as variáveis (controller)
    TextEditingController _heightController = TextEditingController();
    TextEditingController _weightController = TextEditingController();
    double _bmiResult = 0;
    String _textResult = "";


    return Scaffold(

      //Upper Bar
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w300
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      //Backgroud
      backgroundColor: Color.fromARGB(255, 45, 45, 45),
      
      //Define uma tela preenchida por um Scroll e começa a fazer a tela
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    //Coloca o controller no text field
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )
                    )
                  )
                ),
                Container(
                  width: 130,
                  child: TextField(
                    //Coloca o controller no text field
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25){
                    _textResult = "Você está obeso";
                  }
                  else if (_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "Você está no peso normal";
                  }
                  else{
                    _textResult = "Você está desnutrido";
                  } 
                });
                

              },
              child: Container(
                child: Text("Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  )
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              )
            ),
            SizedBox(height: 30,),
            //Acrescenta a função visibility junto com o visible: _textResult
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue
                ),
                ),
              ),
            ),
            SizedBox(height: 80,),
            leftBar(barWidth: 40),
            SizedBox(height: 20,),
            leftBar(barWidth: 20),
            SizedBox(height: 20),
            rightBar(barWidth: 20),
            SizedBox(height: 20,),
            rightBar(barWidth: 40),

          ],
        ),
      ),
    );
  }
}