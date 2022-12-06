import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 Assignment',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 4 Assignment'),
      ),
      body: Column(
        children: [
          studentlist(),
        ],
      ),
    );
  }
}

class studentlist extends StatefulWidget {
  @override
  _studentlist createState() => _studentlist();
}

class _studentlist extends State<studentlist> {
  final List<Student> students = [];
  final idCont = TextEditingController();
  final nameCont = TextEditingController();
  final surnameCont= TextEditingController();
  final gpaCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'ID'),
                  controller: idCont,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: nameCont,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Surname'),
                  controller: surnameCont,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'GPA'),
                  controller: gpaCont,
                ),
                TextButton(
                  child: Text('Add Student'),
                  onPressed: () {
                    addStudent(int.parse(idCont.text),nameCont.text,surnameCont.text,double.parse(gpaCont.text));
                  },
                ),
              ],
            ),
          ),
        ),
        Column(
          children: students.map((student) => Material(
            child: Container(
              width: MediaQuery.of(context).size.height,
              height: 30,
              child: Row(children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text('ID : ${student.id}')),
                      Expanded(
                          child: Text('GPA : ${student.gpa}')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child:
                          Text('Name : ${student.name}')),
                      Expanded(child: Text('Surname : ${student.surname}')),
                    ],
                  ),
                ),
              ]),
            ),
          ))
              .toList(), //map
        ),
      ],
    ); //column
  }
  void addStudent(int txid, String txname, String txsurname, double txgpa){
    final newTx = Student(id: txid, name: txname, surname: txsurname, gpa: txgpa);
    setState(() {
      students.add(newTx);
    });
  }
}
class Student {
  final int id;
  final String name;
  final String surname;
  final double gpa;


  Student(
      {required this.id,
        required this.name,
        required this.surname,
        required this.gpa,
      });
}