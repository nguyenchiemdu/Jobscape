import 'package:cloud_firestore/cloud_firestore.dart';
// import 'workshop_card.dart';

class DatabaseManager {
  final CollectionReference industry =
      FirebaseFirestore.instance.collection('industry');

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

  Future getIndustryList() async {
    List industryList = [];

    try {
      await industry.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          industryList.add(element.data());
        });
      });
      return industryList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getIndustryField(String fieldId) async {
    dynamic industryField;

    try {
      Query it = industry.where("field", isEqualTo: fieldId);

      await it.get().then((querySnapshot) {
        // querySnapshot.docs.forEach((element) {
        //   itlist.add(element.data());
        // });
        industryField = querySnapshot.docs[0].data();
      });
      return industryField;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
