import 'package:flutter/material.dart';
import 'package:z1_app/widgets/common/custom_textformfield.dart';

import '../../../modules/home/page/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _firstNameNode = FocusNode();
  final _lastNameNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            Text(
              'FSC Super App',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              focusNode: _firstNameNode,
              controller: TextEditingController(text: 'hello'),
              onFieldSubmitted: (value) {
                _lastNameNode.requestFocus();
              },
              labelText: 'Firstname',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              focusNode: _lastNameNode,
              labelText: 'Lastname',
            ),
         
            TextButton(onPressed: 
            (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
            }, child: Text('Go'))
         
          ],
        ),
      ),
    );
  }
}
