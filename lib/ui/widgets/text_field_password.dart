import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/state.dart';

class customFormPassword extends StatelessWidget {
  final String hinttext;
  final bool obscure;
  final IconData suufixicon;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  const customFormPassword({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    required this.validator,
   required this.obscure,
    required this.suufixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: mycontroller,
        
        
        validator: validator,
        obscureText: obscure ,
        decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon:   Consumer<MyModel>(
            builder: (context, value, child) {
              return IconButton(
                icon: Icon(suufixicon),
                onPressed: () {
                  value.chnageabs();
                },
              );
            },
          ),
              
            
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 184, 184, 184))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}