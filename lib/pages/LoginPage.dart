import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterBlocOriginal/cubit/login_cubit.dart';
import 'package:flutterBlocOriginal/pages/DashBoard.dart';
import 'package:flutterBlocOriginal/pages/AlluniversityBlocExample.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

   TextEditingController userName = TextEditingController(text:'siva@g.com');
   TextEditingController password = TextEditingController(text : '123');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: buildListener,
        builder: (context, state) {
          return loadInitialWidget(context);
        },
      ),
    );
  }

  void buildListener(BuildContext context, LoginState state) {
    if (state is LoginLoadedState) {
      Navigator.push(
          context, MaterialPageRoute(builder: (
          _) => const DashBoard()));
    }else if(state is LoginLoadedErrorState){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error In login')));
    }
  }

  Widget loadInitialWidget(BuildContext context) {
   return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: userName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context)
                    .checkUserNamePassword(userName.text.toString(),
                    password.text.toString());
                /*Navigator.push(
                          context, MaterialPageRoute(builder: (
                          _) => const Dashboard()));*/
              },
              child:  const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          const Text('New User? Create Account')
        ],
      ),
    );
  }
}