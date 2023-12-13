import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/model/products.dart';
import 'package:game/service/dataClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

PageController controller = PageController();
Color color = Colors.grey.shade100;

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Hello"),
        Text('Welcome to laza'),
        ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_voice),
          ),
        ),
        Text('Chosse brand'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Text('New Arrival'),
        IconButton(
            onPressed: () {
              setState(() {
                color = Colors.red;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: color,
            )),
        FutureBuilder(
            future: QuestionServiceImp().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic temp = snapshot.data;

                List<Products> data = temp as List<Products>;
                return PageView.builder(
                  controller: controller,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    print(data);
                    print(data.length);
                    return Column(
                      children: [
                        // Image.network(data[index].product.images[0])
                        Text(data[index].limit.toString())
                      ],
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            })
      ]),
    );
  }
}
