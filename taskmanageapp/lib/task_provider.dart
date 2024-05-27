import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';

class TaskProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(Task task) async {
    await _firestore.collection('tasks').add(task.toMap());
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await _firestore.collection('tasks').doc(task.id).update(task.toMap());
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {
    await _firestore.collection('tasks').doc(id).delete();
    notifyListeners();
  }

  Stream<List<Task>> getTasks() {
    return _firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
