import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BOOKS",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: CatergoryScreen(),
      routes: {
        '/category-books': (ctx) => CategoryBooksScreen(),
      },
    );
  }
}

class CatergoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 229),
      appBar: AppBar(
        title: Text("BOOKS"),
        leading: IconButton(
          icon: Icon(Icons.book_outlined),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(catData.id, catData.title, catData.color))
              .toList(),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/category-books",
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 254, 229)),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class CategoryBooksScreen extends StatefulWidget {
  @override
  _CategoryBooksScreen createState() => _CategoryBooksScreen();
}

class _CategoryBooksScreen extends State<CategoryBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs["title"]!;
    final String categoryId = routeArgs['id']!;
    final categoryBooks = DUMMY_BOOKS.where((book) {
      return book.categories.contains(categoryId);
    }).toList();
    void AddBook(String titlex) {
      final newBook = Book(id: 'b20', categories: [categoryId], title: titlex);
      setState(() {
        DUMMY_BOOKS.add(newBook);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      backgroundColor: Color.fromARGB(255, 255, 254, 229),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: categoryBooks.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: Offset(0, 5))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          height: 75,
                          child: ListTile(
                            title: Text(
                              categoryBooks[index].title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 255, 254, 229),
            onTap: ((value) {
              if (value == 1) {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      final titleCont = TextEditingController();
                      return Container(
                        padding: EdgeInsets.all(10),
                        height: 500,
                        child: Column(
                          children: [
                            TextField(
                              controller: titleCont,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Title",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: (() {
                                      AddBook(titleCont.text);
                                    }),
                                    child: Text("Add Book")),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }
              if (value == 0) {
                Navigator.pop(context);
              }
            }),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Category {
  final String id;
  final String title;
  final Color color;
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Literature',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Self-Help',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Horror',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'History',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Mysteries',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Romance',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Westerns',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Comics',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Health anf Fitness',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Hobbies and Crafts',
    color: Colors.teal,
  ),
  Category(
    id: 'c11',
    title: 'Religion',
    color: Colors.purpleAccent,
  ),
  Category(
    id: 'c12',
    title: 'Science Fiction (Sci-Fi)',
    color: Colors.cyanAccent,
  ),
  Category(
    id: 'c13',
    title: 'Short Stories',
    color: Colors.pink,
  ),
  Category(
    id: 'c14',
    title: 'Suspense and Thrillers',
    color: Colors.amber,
  ),
  Category(
    id: 'c15',
    title: 'Home and Garden',
    color: Colors.black12,
  ),
  Category(
    id: 'c16',
    title: 'Medical',
    color: Colors.teal,
  ),
  Category(
    id: 'c17',
    title: 'Parenting',
    color: Colors.pink,
  ),
];

final DUMMY_BOOKS = [
  Book(
    id: 'b1',
    categories: [
      'c1',
      'c3',
    ],
    title: 'Treasure Island -  Robert Louis Stevenson',
  ),
  Book(
    id: 'b2',
    categories: [
      'c1',
    ],
    title: 'Little Women and Other Novels - Louisa May Alcott',
  ),
  Book(
    id: 'b3',
    categories: [
      'c1',
    ],
    title: 'Frankenstein - Mary Shelley',
  ),
  Book(
    id: 'b4',
    categories: [
      'c1',
    ],
    title: 'To Kill a Mockingbird - Harper Lee',
  ),
  Book(
    id: 'b5',
    categories: [
      'c1',
    ],
    title: 'Pride and Prejudice - Jane Austen',
  ),
  Book(
    id: 'b6',
    categories: [
      'c1',
    ],
    title: 'Pride and Prejudice - Jane Austen',
  ),
  Book(
    id: 'b7',
    categories: [
      'c1',
    ],
    title: 'Pride and Prejudice - Jane Austen',
  ),
  Book(
    id: 'b8',
    categories: [
      'c1',
    ],
    title: 'Pride and Prejudice - Jane Austen',
  ),
  Book(
    id: 'b9',
    categories: [
      'c1',
    ],
    title: 'Pride and Prejudice - Jane Austen',
  ),
  Book(
    id: 'b10',
    categories: [
      'c2',
    ],
    title: 'The Alchemist by Paulo Coelho',
  ),
  Book(
    id: 'b11',
    categories: [
      'c2',
    ],
    title: 'Atomic Habits by James Clear',
  ),
  Book(
    id: 'b12',
    categories: [
      'c2',
    ],
    title: 'Thinking Fast And Slow by Daniel Kahneman',
  ),
  Book(
    id: 'b13',
    categories: [
      'c2',
    ],
    title: 'The Four Agreements by Don Miguel Ruiz',
  ),
  Book(
    id: 'b14',
    categories: [
      'c2',
    ],
    title: 'The 7 Habits Of Highly Effective People by Stephen R. Covey',
  ),
  Book(
    id: 'b15',
    categories: [
      'c2',
    ],
    title: 'Best Self by Mike Bayer',
  ),
  Book(
    id: 'b16',
    categories: [
      'c2',
    ],
    title:
        'The Subtle Art of Not Giving a F*ck by Mark Manson Best Self Help Books for Women',
  ),
  Book(
    id: 'b17',
    categories: [
      'c2',
    ],
    title: 'Girl, Wash Your Face by Rachel Hollis',
  ),
  Book(
    id: 'b18',
    categories: [
      'c2',
    ],
    title: '12 Rules For Life by Jordan Peterson',
  ),
  Book(
    id: 'b19',
    categories: [
      'c2',
    ],
    title: 'Big Magic by Elizabeth Gilbert',
  ),
];

class Book {
  String id;
  List<String> categories;
  String title;

  Book({
    required this.id,
    required this.categories,
    required this.title,
  });
}
