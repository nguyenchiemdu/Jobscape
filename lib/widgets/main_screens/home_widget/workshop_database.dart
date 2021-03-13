import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference workshops =
      FirebaseFirestore.instance.collection('workshops');

  // Future<void> createWorkshop()
  // async {
  //   return await workshops.add({
  //     'title': title,
  //     'speaker': speaker,
  //     'image_source': image_source,
  //     'link': link,
  //     'date': date
  //   });
  // }

  Future getWorkshopList() async {
    List workshopList = [];

    try {
      await workshops
          .orderBy('date', descending: true)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          workshopList.add(element.data());
        });
      });
      List result = [];
      Timestamp now = Timestamp.now();
      for (Map element in workshopList) {
        if (now.compareTo(element['date']) <= 0)
          result.add(element);
        else
          break;
        // print(now.compareTo(element['date']).toString());
      }
      // print(workshopList);
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
