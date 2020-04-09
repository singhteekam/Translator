
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';
void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Translate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Translate extends StatefulWidget {
  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
   String text="";
    String str="";
    String textF="English",textT="Hindi";
  // english,hindi,tamil,french,bengali,german,spanish,gujrati,italian,japanesh,nepali,punjabi,russian,telegu,turkish,urdu
    List<String> _opt = ['en', 'hi', 'ta', 'fr','bn','de','es','gu','it','ja','ne','pa','ru','te','tr','ur']; 
  String _selected="en",_selected2="hi";


  Future<void> callback(String s) async{
    setState(() {
      str=s;
    });
  }

  options(String newVal){
    if(newVal=="en")
      return "English";
    else if(newVal=="hi")
      return "Hindi";
    else if(newVal=="ta")
      return "Tamil";
    else if(newVal=="fr")
    return "French";
    else if(newVal=="bn")
      return "Bengali";
    else if(newVal=="de")
      return "German";
    else if(newVal=="es")
    return "Spanish";
    else if(newVal=="gu")
      return "Gujrati";
    else if(newVal=="it")
      return "Italian";
    else if(newVal=="ja")
    return "Japanesh";
    else if(newVal=="ne")
      return "Nepali";
    else if(newVal=="pa")
      return "Punjabi";
    else if(newVal=="ru")
    return "Russian";
    else if(newVal=="te")
      return "Telugu";
    else if(newVal=="tr")
      return "Turkish";
    else if(newVal=="ur")
    return "Urdu";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Translator"),
      ),
      body: ListView(
        children:<Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
              DropdownButton(
            hint: Text('From'), // Not necessary for Option 1
            value: _selected,
            onChanged: (newValue) {
              setState(() {
                _selected = newValue;
                textF= options(newValue);
              });
            },
            items: _opt.map((valn) {
              return DropdownMenuItem(
                child: new Text(valn),
                value: valn,
              );
            }).toList(),
          ),
          Text("To"),
           DropdownButton(
            hint: Text('To'), 
            value: _selected2,
            onChanged: (newValue2) {
              setState(() {
                _selected2 = newValue2;
                textT= options(newValue2);
              });
            },
            items: _opt.map((val2) {
              return DropdownMenuItem(
                child: new Text(val2),
                value: val2,
              );
            }).toList(),
          ),
           ],
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("$textF",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
              Text(" "),
              Text("$textT",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            ],
          ),
          Padding(padding: const EdgeInsets.all(10)),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (value) => text = value,
              decoration: InputDecoration(
                labelText: "Enter any Text...",
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))
              ),
            ),
         ),

          Padding(padding: const EdgeInsets.all(4)),
          FloatingActionButton(onPressed: () async{
            if(text==""){
              Fluttertoast.showToast(msg: "Plz enter some text");
            }
            else{
            final translator = new GoogleTranslator();
            translator.translate(text, from: _selected, to: _selected2).then((s) {
             //print(s);
             callback(s);
          }
          );
          }},
          child: Icon(Icons.g_translate),
          ),
          Padding(padding: const EdgeInsets.all(4)),
            Text("Resulted Text:",textAlign: TextAlign.center,
             style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,decoration: TextDecoration.underline),),
           
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
               // width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  str,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
          )
          ]
      ),
    );
  }
}