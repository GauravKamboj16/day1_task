import 'package:day1_task/Constants/AppColors.dart';
import 'package:day1_task/modules/controller/SignupController.dart';
import 'package:day1_task/services/NetworkUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController=TextEditingController();
  final passController=TextEditingController();
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signupController=Provider.of<SignupController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            textFiledDesign( emailController,"Email",TextInputType.emailAddress,false),
            const SizedBox(height: 8,),
             textFiledDesign( passController,"Password",TextInputType.visiblePassword,true),
            const SizedBox(height: 8,),
             textFiledDesign( nameController,"name",TextInputType.name,false),
            const SizedBox(height: 8,),
             textFiledDesign( phoneController,"Phone number",TextInputType.phone,false),
            const SizedBox(height:18,),
            GestureDetector(
              onTap: () {
                 
                signupController.resisterUser(emailController.text, passController.text, nameController.text, "token", "+91", phoneController.text, context);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.iconBackground,
                    width: 2
                  )
                ),
                child: Center(
                  child: Text("Signup",style: GoogleFonts.lato(color:AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.w600),),
                ),
              ),
            )
             ],
        ),
      ),
    );
  }

Widget textFiledDesign(
      TextEditingController mController,String hint,TextInputType inputType,bool isObscure) {
    return TextField(
      keyboardType: inputType,
      obscureText: isObscure,
      
      controller: mController,
      style: GoogleFonts.lato(color: AppColors.whiteColor),
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        fillColor: AppColors.cardColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.iconBackground, width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.iconBackground, width: 1.5)),
      ),
    );
  }
}