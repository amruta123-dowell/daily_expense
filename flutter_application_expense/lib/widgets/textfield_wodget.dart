import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController tecController;
  const TextFieldWidget(
      {super.key, required this.tecController, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red))
              ]),
        ),
        // Text(
        //   title,
        // ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.purple,
              )),
          child: TextFormField(
            controller: tecController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                fillColor: Colors.grey,
                labelText: null,
                hintText: null,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
