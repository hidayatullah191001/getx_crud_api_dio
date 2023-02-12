import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Icon(
            Icons.remove,
            color: Colors.grey[600],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                TextField(
                  controller: controller.titleC,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Title...',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Title',
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.noteC,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Body...',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Body',
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.createNote();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'Save Note',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
