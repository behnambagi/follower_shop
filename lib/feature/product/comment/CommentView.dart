import 'package:follower_shop/core/AppData.dart';
import 'package:follower_shop/feature/product/comment/pageComment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class Comments extends StatefulWidget {
  int idProduct = 0;
  int commentAll = 1;
  String title = '';
  List<dynamic> listComment;

  Comments(this.idProduct, this.listComment, this.title);

  @override
  CommentView createState() => CommentView(idProduct, listComment);
}

class CommentView extends State<Comments> {
  int moreComment = 1;
  int page = 1;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loading(widget.idProduct);
      }
    });
  }

  CommentView(idProduct, List<dynamic> listComment) {
    if (listComment.length == 0) {
      _loading(idProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = moreComment == 1
        ? widget.listComment.length + 1
        : widget.listComment.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.length > 25
            ? widget.title.substring(0, 30) + "..."
            : widget.title),
      ),
      body: (
          widget.listComment.length > 0
          ? Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, index) {
              return commentModel(index);
            },
            itemCount: itemCount,
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  AppData.go(context,
                      CommentPage(widget.idProduct), 1, 0);
                },
                child: Icon(Icons.add),
              ))
        ],
      )
          : widget.commentAll == 1
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                    "نظری وجود ندارد اگر میخواهید نظر بدهید + زیر را فشار دهید "),
              ),
              Text(
                  "نظری وجود ندارد اگر میخواهید نظر بدهید + زیر را فشار دهید "),
            ],
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  AppData.go(context,
                      CommentPage(widget.idProduct), 1, 0);
                },
                child: Icon(Icons.add),
              ))
        ],
      ))



    );
  }

  Widget commentModel(int index) {
    double w = MediaQuery.of(context).size.width -90;
    if (index == widget.listComment.length) {
      return Container(
        height: 100,
        width: w,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(7),
                    child: ListTile(
                      title: Text(
                        widget.listComment[index]['name'].length>11? widget.listComment[index]['name'].substring(0, 11) + "...": widget.listComment[index]['name'],
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          widget.listComment[index]['name'][0],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.cyan,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Expanded(
                    child: Text(
                  "ارسالی در:" + widget.listComment[index]['date'],
                  textAlign: TextAlign.left,
                )),
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25) ,topRight: Radius.circular(1), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
              padding:
                  EdgeInsets.only(left: 8, right: 10, bottom: 20, top: 20),
              width: w,
              child: Text(widget.listComment[index]['content'])),
        ],
      );
    }
  }

  void _loading(int idProduct) {
    String url = "http://f.nicetel.ir/?action=get_comment&id_product=" +
        idProduct.toString() +
        "&page=" +
        page.toString();
    http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          if (response.body == "[]") {
            moreComment = 0;
            widget.commentAll = 0;
          } else {
            widget.listComment =
                widget.listComment + convert.jsonDecode(response.body);
          }
        });
        page = page + 1;
      }
    });
  }
}
