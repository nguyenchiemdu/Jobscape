import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopDatabase {
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

  Future getWorkshopList(String status) async {
    List workshopList = [];
    try {
        await workshops.where("status", isEqualTo: status).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          workshopList.add(element.data());
        });
      });
      return workshopList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
