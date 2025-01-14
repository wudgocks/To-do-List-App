import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/user.dart';
import 'model/todoproject.dart';
import 'model/todonotification.dart';
import 'model/todo.dart';

class FirebaseController {
  /* User */
  /// static accessors
  static get userCollection => FirebaseFirestore.instance.collection('Users');
  static get userOrdered => userCollection.orderBy('uid', descending: true);
  static get userGet => userOrdered.get();
  static get userSnapshots => userOrdered.snapshots();

  /// static methods
  // firebase query methods (add, update & delete)
  static Future<DocumentReference> addUser(User user) => userCollection.add(user.toJson());
  static void updateUser(User user) => userCollection.doc(user.uid).set(user.toJson());
  static void deleteUser(String uid) => userCollection.doc(uid).delete();

  /* Project */
  /// static accessors
  static get projectCollection => FirebaseFirestore.instance.collection('Projects');
  static get projectOrdered => projectCollection.orderBy('pid', descending: true);
  static get projectGet => projectOrdered.get();
  static get projectSnapshots => projectOrdered.snapshots();

  /// static methods
  // firebase query methods (add, update & delete)
  static Future<DocumentReference> addProject(TodoProject project) => projectCollection.add(project.toJson());
  static void updateProject(TodoProject project) => projectCollection.doc(project.pid).set(project.toJson());
  static void deleteProject(String pid) => projectCollection.doc(pid).delete();

  /* Todo */
  /// static accessors
  static get todoCollection => FirebaseFirestore.instance.collection('Todos');
  static get todoOrdered => todoCollection.orderBy('tid', descending: true);
  static get todoGet => todoCollection.get();
  static get todoSnapshots => todoCollection.snapshots();

  /// static methods
  // firebase query methods (add, update & delete)
  static Future<DocumentReference> addTodo(Todo todo) => todoCollection.add(todo.toJson());
  static void updateTodo(Todo todo) => todoCollection.doc(todo.tid).set(todo.toJson());
  static void deleteTodo(String tid) => todoCollection.doc(tid).delete();
}