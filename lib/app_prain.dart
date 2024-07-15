import 'Question.dart';
class AppPrain{
  int _qutnum =0;
  List<Question>  qutionGrop= [
           const Question(   'انزل القران كاملا',  'images/image-1.png',  false,),
          
          const Question(   ' الصيام ركن',  'images/image-2.png',  true,),
          
          const Question(   'الصين تقع في القارة الافريقية',  'images/image-3.png',  false,),
          
          ];

          void nextQut(){
            if (_qutnum<qutionGrop.length-1){
              _qutnum++;
            }
          }

    String getQustionText() {
      return qutionGrop[_qutnum].qutionText;
    }   
     String getQustionImage() {
      return qutionGrop[_qutnum].qutionImage;
    }  

     bool getQutionAnsaer() {
      return qutionGrop[_qutnum].qutionAnsaer;
    } 
    bool isfinsh(){
      if(_qutnum>= qutionGrop.length-1){
        return true;
      }else {
        return false;
      }
    } 
    void rest(){
      _qutnum=0;
    }
}