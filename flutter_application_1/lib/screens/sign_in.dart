import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/widget_.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);
  
  @override
  _SignInState createState() => _SignInState();
}

 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
class _SignInState extends State<SignIn> {
 
  @override
  Widget build(BuildContext context) {
    final data= MediaQuery.of(context);
    return Scaffold(
            appBar:myappBar(),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                  
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 400.h,),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white
                        ),
                       keyboardType: TextInputType.number,
                       maxLength: 10,
                       validator: (value){
                         if(value!.length!=10){
                           return "Mobile number should be 10 charactors";
                         }
                         else if(value==""){
                           return "Name cannot be empty";
                         }
                         return null; 
                       },              
                        decoration: textFieldInputDecoration("Mobile Number"),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white
                        ),
                        keyboardType: TextInputType.text,
                         validator: (value){
                         if(value!.length<6){
                           return "Password should more than 6 charactors";
                         }  
                         else if(value==""){
                           return "password cannot be empty";
                         }
                         return null;
                       },  
                        decoration: textFieldInputDecoration("Password"),

                      ),
                      SizedBox(height: 30.h,),
                       SizedBox(
                        width: 400.w,
                        height: 50.h,
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                    primary:  Colors.blue.shade900
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 10.w),
                              child: Text("Sign In",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white
                                      ),
                              ),
                            ),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                              return const HomePage();
                             }));
                              }
                              
                             } 
                            
                            ),
                        ),
                      ) 

                    ],
                  ),
                ),
              ),
            ),      
    );
  }
}

