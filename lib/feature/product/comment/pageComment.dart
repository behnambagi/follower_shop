import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  final int product_id;

  CommentPage(this.product_id);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  String _name = "";
  String _email = "";
  String _comment1 = "";
  bool send = false;

  final _testFielde = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("ثبت نظر جدید"),
        elevation: 0.0,
      ),
      body: Center(
        child:
            Container(

              padding: EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width - 50,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white),

              child: Stack(children: [

                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _testFielde,
                    child: Column(
                      children: [

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _name = value!;
                            },
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'لطفا نام و نام خانوادگی خود را وارد کنید';
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: " نام و نام خانوادگی",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextFormField(
                            onSaved: (value) {
                              _email = value!;
                            },
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "لطفا ایمیل خود را وارد کنید";
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "ایمیل شما",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            maxLines: 10,
                            minLines: 5,
                            onSaved: (value) {
                              _comment1 = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "لطفا نظر خود را وارد کنید";
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.comment),
                                labelText: "نظر شما",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              if (_testFielde.currentState!.validate()) {
                                _testFielde.currentState!.save();
                                setState(() {
                                  send = true;
                                });
                                _commentAdd();
                              }
                            },
                            icon: Icon(Icons.schedule_send),
                            label: Text("ارسال نظر")),
                      ],
                    ),
                  ),
                ),
                send == true
                    ? Opacity(
                        opacity: .3,
                        child: Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                          color: Colors.white,
                        ),
                      )
                    : Text("")
              ]),
            ),
    )
    )
        ;

  }

  _commentAdd() {
    String url = "http://f.nicetel.ir/?action=add_comment&id_product=" +
        widget.product_id.toString();
    http.post(Uri.parse(url), body: {
      "name": _name,
      "email": _email,
      "comment": _comment1
    }).then((response) {
      setState(() {
        send = false;
        _testFielde.currentState!.reset();
      });
    });
  }
}
