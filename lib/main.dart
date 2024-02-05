import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ClothesPicker(),
    );
  }
}


class ClothesPicker extends StatefulWidget {
  const ClothesPicker({super.key});

  @override
  State<ClothesPicker> createState() => _ClothesPickerState();
}

// class _ClothesPickerState extends State<ClothesPicker> {
//   List<String> _clothes = [];
//
//   void addClothes(){
//     showDialog(context: context, builder: (BuildContext context){
//       String newClothing = "";
//       return AlertDialog(
//         title: Text("Add new clothing"),
//         content: TextField(
//           onChanged: (value){
//             newClothing = value;
//           },
//         ),
//         actions: [
//           ElevatedButton(
//               onPressed: (){
//                 setState(() {
//                   if(newClothing.isNotEmpty){
//                     _clothes.add(newClothing);
//                   }
//                   Navigator.pop(context);
//                 });
//               },
//               child: const Text("Add"))
//         ],
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Clothes Picker"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: ListView.builder(
//         itemCount: _clothes.length,
//           itemBuilder: (context,index){
//           return Card(
//             child: ListTile(
//               title: Text(_clothes[index], style: TextStyle(fontSize: 18),),
//               trailing: IconButton(
//                 icon: const Icon(Icons.delete_rounded), onPressed: () {
//                   setState(() {
//                     _clothes.removeAt(index);
//                   });
//                },)
//             ),
//           );
//       }),
//       floatingActionButton: FloatingActionButton(onPressed: addClothes,
//         backgroundColor: Colors.deepPurpleAccent,
//         child: const Icon(Icons.add_box_outlined),
//       ),
//     );
//   }
//}

class _ClothesPickerState extends State<ClothesPicker> {
  List<String> _clothes = [];

  void addClothes() {
    showDialog(context: context, builder: (BuildContext context) {
      String newClothing = "";
      return AlertDialog(
        title: const Text("Add new clothing",
          style: TextStyle(color: Colors.blue),
        ),
        content: TextField(
          onChanged: (value) {
            newClothing = value;
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (newClothing.isNotEmpty) {
                  _clothes.add(newClothing);
                }
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.red
            ),
            child: const Text("Add"),
          )
        ],
      );
    });
  }

  void editClothes(int index) {
    showDialog(context: context, builder: (BuildContext context) {
      String editedClothing = _clothes[index];
      return AlertDialog(
        title: const Text("Edit clothing",
          style: TextStyle(color: Colors.blue),
        ),
        content: TextField(
          onChanged: (value) {
            editedClothing = value;
          },
          controller: TextEditingController(text: _clothes[index]),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _clothes[index] = editedClothing;
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.red),
            child: const Text("Save"),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothes Picker"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _clothes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_clothes[index], style: const TextStyle(fontSize: 18)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () => editClothes(index),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("Edit"),
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _clothes.removeAt(index);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addClothes,
        backgroundColor: Colors.lightGreenAccent,
        foregroundColor: Colors.red,
        // icon: const Icon(Icons.add_box_outlined),
        label: const Text("Add"),
      ),
    );
  }
}

