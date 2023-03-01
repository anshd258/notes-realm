import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();

}

class _page2State extends State<page2> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 168, 20),
      appBar: AppBar(
        leading: BackButton(),
        title: Text('ADD YOUR NOTE'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          
          width:Adaptive.w(70),
      height: Adaptive.h(40),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 208, 208, 208),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        
      ),
      child: Column(
        children: <Widget>[
          Text('xx/xx/xxxx'),
          TextField(
            textAlign: TextAlign.center,
            controller: _controller,

          ),

          FloatingActionButton.extended(onPressed: (){},label:Text("ADD"),backgroundColor: Colors.green,)
        ],
      ),
        ),
      )),
    );
     // ignore: dead_code
     @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  }
}
