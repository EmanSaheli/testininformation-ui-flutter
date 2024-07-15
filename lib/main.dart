
import "package:flutter/material.dart";

import 'app_prain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
AppPrain appPrain =AppPrain();

void main() {
  runApp(const MyWidget());
}
 class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar:AppBar(
        backgroundColor: Colors.grey,
        title: const Text('بنك معلومات'),
        
      ) ,
      body:const Padding(
        padding: EdgeInsets.all(20.0),
        child: ExamPage(),
      ),
      
      ),
    );
  }
}

  class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
  
  
     }

class _ExamPageState extends State<ExamPage> {
    List< Widget>  anser= [
      //Icon(Icons.thumb_up),
    ];
    int trouans=0;
    void chicaAnswer(whatuserPicked){
       bool corect= appPrain.getQutionAnsaer();
         setState(() {
              if(whatuserPicked==corect){
                trouans++;
               anser.add(const Padding(
                 padding: EdgeInsets.all(3.0),
                 child: Icon(Icons.thumb_up,color: Colors.green,),
               ));
               // print('اجابه صح');
              }
                 else {
                anser.add(const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.thumb_down,color: Colors.red,),
                  ));
                 } 
                 if (appPrain.isfinsh() == true){
                    Alert(
                context: context,
                type: AlertType.error,
                  title: "انتهى الاختبار",
                    desc: " لقد اجبت على $trouans  بطريقة صحيحة من اصل 3",
                     buttons: [
                     DialogButton(
                       onPressed: () => Navigator.pop(context),
                          width: 120,
                       child: const Text(
                         "ابدا من جديد",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
                            ],
                            ).show();
                            appPrain.rest();
                                 anser=[];
                                 trouans=0;
                                }else{
                                 appPrain.nextQut();
                                  }
             
                                
                
  } 
  );

   }
     
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
            Row(children: anser,
            
            ),
        Expanded(
          flex: 9,
          child: Column(
          children: [
           Image.asset(appPrain.getQustionImage()),
           const SizedBox(height: 4.0,),
           Text(
            appPrain.getQustionText(),
           textAlign: TextAlign.center,
            style: const TextStyle(
               fontSize: 20.0,
               ),
                ),
             //const SizedBox(height: 10.0,),
             
          ],

        ),  
        ),
          
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical:5.0),
          child: ElevatedButton(
            child: const Text('صح',
              style: TextStyle(
                 fontSize: 20.0,
              backgroundColor:  Colors.blue)),
             onPressed: () {
                   chicaAnswer(true);
               
              // Your button action here
            },
          ),
        ),
        ),
      
         Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: ElevatedButton(
            child: const Text('خطا',
              style: TextStyle(
                 fontSize: 20.0,
              backgroundColor:  Colors.blue)),
             onPressed: () {
               chicaAnswer(false);
                
              // Your button action here
            },
          ),
        ),
        ),
      ],
     
    );
  }
}