import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('todo box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: todohomepage(),
    );
  }
}

class todohomepage extends StatefulWidget {
  const todohomepage({super.key});

  @override
  State<todohomepage> createState() => _todohomepageState();
}

class _todohomepageState extends State<todohomepage> {
  final TextEditingController addtaskcontroller = TextEditingController();
  final Box todobox = Hive.box('todo box');
  
  void addtask(){
    if(addtaskcontroller.text.isEmpty) return;
    todobox.add(addtaskcontroller.text);
    addtaskcontroller.clear();
    setState(() {
      
    });
  }
  
  void deletetask(int index){
    todobox.deleteAt(index);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App Offline version"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 35, 177, 118),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: addtaskcontroller,
                    decoration: InputDecoration(
                      hintText: "add your task here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                ElevatedButton(onPressed: addtask, child: Text("+")),
              ],
            ),
          ),
          Expanded(
            child: todobox.isEmpty
                ? Center(child: Text("No task Added"))
                : ListView.builder(
                    itemCount: todobox.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 210, 212, 243),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                todobox.getAt(index).toString(),
                                style: TextStyle(fontSize: 20 , fontStyle: FontStyle.italic ),
                                softWrap: true,
                                maxLines: null,
                                overflow : TextOverflow.visible,
                              ),
                            ),
                            
                            IconButton(onPressed: () => deletetask(index), icon: Icon(Icons.delete , color: Colors.redAccent,))
                                                        
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
