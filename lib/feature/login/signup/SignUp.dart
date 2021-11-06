import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body:
        ListView(
          padding: EdgeInsets.only(left: 20, right: 20),
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.person),
                    labelText: "first name"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.person_add_alt_1_sharp),
                    labelText: "last name"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.phone),
                    labelText: "phone"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.email),
                    labelText: "email"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                obscureText: true,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.password),
                    labelText: "password"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                cursorRadius: Radius.circular(100.0),
                cursorColor: Colors.red,
                obscureText: true,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                    prefixIcon: Icon(Icons.password_outlined),
                    labelText: "password again"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.assignment_ind_rounded),
                onPressed: () {

                },
                label: Text("sign up"),
              ),

            ),

          ],
        ));
  }
}
