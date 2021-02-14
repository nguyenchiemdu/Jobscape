import 'package:flutter/material.dart';

class IndustryIntro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
          child: InkWell(
            hoverColor: Colors.grey,
            onTap: () {},
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://www.protocol.com/media-library/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vYXNzZXRzLnJibC5tcy8yMjg3NTQ2MC9vcmlnaW4uanBnIiwiZXhwaXJlc19hdCI6MTY1MTk1MjUxNH0.y5MlWdBtdIP-B3bYAgeOF7fJjnobvqiVZbK49bLHElE/image.jpg?width=1245&quality=85&coordinates=0%2C53%2C0%2C53&height=700',
                    width: double.infinity, height: 110.0),
              ),),
          )
      ),
    );


  }
}