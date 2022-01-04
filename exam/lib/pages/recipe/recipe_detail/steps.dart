import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: getHeight(20)),
      child: Row(
        children: [
          Expanded(
            child: Text("Atque distinctio assumenda nam placeat illum aut consectetur ipsa natus molestiae illo non, nobis veritatis explicabo alias error? Quia, expedita rerum rem reprehenderit quod, amet excepturi tenetur porro placeat laudantium suscipit optio hic voluptatibus laboriosam, minus laborum commodi repellendus facere alias tempore sint modi harum pariatur deleniti! Sequi incidunt voluptatum quod, iste sunt, cum nam exercitationem molestias ipsa debitis nemo in deleniti atque minus? Quo, nam totam rerum aperiam nesciunt hic non, nobis placeat suscipit ut nihil beatae quasi cum architecto deserunt modi quos. Quasi laboriosam delectus perferendis dignissimos, voluptates ea quisquam dolores est similique officiis quia alias animi libero nostrum recusandae, in, adipisci maiores!",
              textAlign: TextAlign.left,
              style: TextStyle(
                height: 2
              ),
            ),
            flex: 90,
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                showBottomSheet(context: context, builder: (context){
                  return bottomSheet();
                });
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
            flex: 15,
          ),
        ],
      ),
    );
  }
  Widget bottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
      height: getHeight(160),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: getHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getWidth(60),
                height: getHeight(6),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(10),
          ),
          buildFunc("edit", Icons.edit, () {}),
          buildFunc("delete", Icons.delete, () {}),
        ],
      ),
    );
  }

  buildFunc(String title, IconData icon, Function) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: getWidth(20),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: getFont(16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}