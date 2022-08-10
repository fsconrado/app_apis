import 'package:flutter/material.dart';

const _titulo = "Aplicativo de APIs";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _pageController = PageController();
  var _index = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(_titulo)),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState((){
            _index=index;
          });
        },
        children: [
          Center(
              child: ElevatedButton(
                  child: const Text("Consultar CEP"),
                  onPressed: (){
                    Navigator.of(context).pushNamed("/cep");
                  },
              ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Consultar Futebol"),
              onPressed: (){
                Navigator.of(context).pushNamed("/futebol");
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Consultar Clima"),
              onPressed: (){},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (page) {
            setState(() {
              _index = page;
              _pageController.animateToPage(page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_post_office_outlined), label: "Cep"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer), label: "Futebol"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Clima"),
          ]),
    );
  }
}
