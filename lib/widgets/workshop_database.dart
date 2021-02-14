import 'package:cloud_firestore/cloud_firestore.dart';
import 'workshop_card.dart';

class DatabaseManager {

  final CollectionReference workshops = FirebaseFirestore.instance.collection('workshops');

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
      await workshops.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          workshopList.add(element.data);
        });
      });
      return workshopList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}