import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class RecipeBottomWidget extends StatefulWidget {
  const RecipeBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipeBottomWidget> createState() => _RecipeBottomWidgetState();
}

class _RecipeBottomWidgetState extends State<RecipeBottomWidget> {
  int _buttonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(16.0)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildButton(0, "Intro"),
              buildButton(1, "Ingredients"),
              buildButton(2, "Steps"),
            ],
          ),
          SizedBox(
            height: getHeight(24.0),
          ),
          Text(
            'Mendengar kata-kata Sup pastinya yang terbayang dibenak kita adalah sesuatu yang enak dan lezat. Bagaimana tidak menu makanan yang satu ini adalah salah satu menu yang digemari diseluruh pelosok Indosesia. Makanan yang membuat kita lebih bersemangat untuk makan lebih banyak dari poris biyasanya. Kali ini saya akan sedikti mberikan sedikit informasi bagi ibu-ibu rumah tangga yang hobi akan memasak tentang Sup Makaroni yang mungkin bisa dijadikan salah satu menu masakan spesial untuk keluarga tercinta anda dirumah. Agar pembahasan kita tidak melebar kemana-mana mari kita langsung saja masuk kepembahasan utama kita tentang Sup Makaroni. Silahkan disimak langkah-langkah dibawah ini',
            style: TextStyle(
              height: getHeight(2.4),
            ),
          ),
          SizedBox(
            height: getHeight(18.0),
          ),
          Text(
            'Source',
            style: TextStyle(
              fontSize: getFont(20.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: getHeight(18.0),
          ),
          Text(
            'https://www.fimela.com/lifestyle-relationsh',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: getHeight(32.0),
          ),
        ],
      ),
    );
  }

  Widget buildButton(int index, String title) {
    Color textColor = Colors.grey;
    Color buttonColor = Colors.white;

    if (_buttonIndex == index) {
      textColor = Colors.white;
      buttonColor = Colors.orange;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: getHeight(8.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: buttonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
