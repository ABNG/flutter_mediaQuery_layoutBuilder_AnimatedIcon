import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  bool value = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MediaQuery.of(context).size.width < 600
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("width: ${MediaQuery.of(context).size.width}"),
                    Text("height: ${MediaQuery.of(context).size.height}"),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          value = !value;
                          value ? controller.forward() : controller.reverse();
                        });
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_arrow,
                        progress: controller,
                        semanticLabel: 'Show menu',
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                            "width: ${MediaQuery.of(context).size.width}")),
                    Expanded(
                        child: Text(
                            "height: ${MediaQuery.of(context).size.height}")),
                  ],
                )),
    );
  }
}
/*
LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth < 400) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("width: ${constraints.maxWidth}"),
                Text("height: ${constraints.maxHeight}"),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text("width: ${constraints.maxWidth}")),
                Expanded(child: Text("height: ${constraints.maxHeight}")),
              ],
            );
          }
        },
      )
 */
