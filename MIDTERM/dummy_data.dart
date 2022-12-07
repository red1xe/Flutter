import 'package:flutter/material.dart';

import './model/category.dart';
import './model/book.dart';


const DUMMY_CATEGORIES = const [
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

 final DUMMY_BOOKS =  [
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
    title: 'The Subtle Art of Not Giving a F*ck by Mark Manson Best Self Help Books for Women',
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


