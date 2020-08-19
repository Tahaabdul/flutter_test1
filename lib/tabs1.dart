import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class StoreList extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _StoreListState();
  }
}

class _StoreListState extends State<StoreList> {
  Stream<QuerySnapshot> _Stores;
@override
void initState() {
  super.initState();
  _Stores = Firestore.instance.collection('customers').orderBy('name').snapshots();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _Stores,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: const Text('Loading...'));
          }
          final documents = snapshot.data.documents;
          SizedBox(height: 10.0);
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (builder, index) {
              final document = documents[index];
              return Card(
                child: ListTile(
                  title: Text(document['name']), 
                  subtitle: Text(document['contact']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}