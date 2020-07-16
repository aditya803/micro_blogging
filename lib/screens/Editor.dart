import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  ZefyrController _controller; //Allows to control the editor and the document.
  FocusNode _focusNode; //Zefyr editor like any other input field requires a focus node.
  @override
  void initState() {

    super.initState();
    //here we must load the document and pass it to zefyr controller.
    final document=_loadDocument();
    _controller=ZefyrController(document);
    _focusNode=FocusNode();
  }
  NotusDocument _loadDocument(){
    final Delta delta=Delta()..insert("Write here...\n");
    return NotusDocument.fromDelta(delta);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xFFD5A893),
          title: Text(
            "Write a blog...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: ZefyrScaffold(
            child: ZefyrEditor(
              padding: EdgeInsets.all(16),
              controller: _controller,
              focusNode: _focusNode,
            ),
          ),
        ),
      );

  }
}
