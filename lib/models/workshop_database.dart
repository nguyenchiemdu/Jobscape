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
  Future AddWorkshop(Map<String, dynamic> data) async {
    await workshops.add(data).then((value) {
      print('add workshop completed');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future getAllWorkshop() async {
    List workshopList = [];
    Map workshop;
    try {
      await workshops.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          workshop = element.data();
          workshop['id'] = element.id;
          workshopList.add(workshop);
        });
      });
      return workshopList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getRemindWorkshopList(List ids) async {
    List workshopList = [];
    Map workshop;
    try {
      for (String id in ids) {
        await workshops
            // .where("projOwner", whereIn: ids)
            .doc(id)
            .get()
            .then((element) {
          workshop = element.data();
          workshop['id'] = element.id;
          Timestamp date = workshop['date'];
          if (date.toDate().compareTo(DateTime.now()) >= 0)
            workshopList.add(workshop);
        });
      }
      return workshopList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
