import 'dart:convert';
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
bool hasDigit(String s){
    for (int i =0;i<s.length;i++){
      if (int.tryParse(s[i])!= null)
      return true;
    }
    return false;
}
String removeSpace(String s){
  while (s[0]==' ')
    s = s.substring(1);
  while(s[s.length-1]==' ')
    s = s.substring(0,s.length-1);
  s = s.replaceAll('\n', '');
  return s;
}
class CourseraCertificate{
  VisionText visionText;
  PickedFile image;
  String learner;
  String platform;
  String provider = '';
  String skill;
  CourseraCertificate(this.visionText,this.image){
    getLeftBlockRemoveTop();
  }
  String learnerDetection(){
    String temp;
    for (TextBlock block in visionText.blocks){
      if (block.text == 'has successfully completed')
        return temp;
      temp = block.text;
    }
    return null;
  }
  //  String dateDetection(VisionText visionText){
  //   for (TextBlock block in visionText.blocks){
  //     if(isDate(block.text))
  //       return block.text;
  //   }
  // }
  String skillDetection(){
    // String skill = _selectedLocation.toLowerCase();
    String skill = 'NodeJS'.replaceAll(' ', '').toLowerCase();

    for (TextBlock block in visionText.blocks){
      if (block.text.toLowerCase().replaceAll(' ', '').contains(skill))
        return block.text;
    }
    return 'invalid';
  }
  List getLeftBlock(){
    List res = [];
    final file = File(image.path);
    final size = ImageSizeGetter.getSize(FileInput(file));
    double width = size.width.toDouble();
    for (TextBlock block in visionText.blocks){
      double blockWidth = (block.boundingBox.left);
      if (blockWidth < width/2)
        res.add(block.text);
    }
    return res;
  }
  getLeftBlockRemoveTop(){
    List res = [];
    final file = File(image.path);
    final size = ImageSizeGetter.getSize(FileInput(file));
    double width = size.width.toDouble();
    double height = size.height.toDouble();
    for (TextBlock block in visionText.blocks){
      double blockWidth = (block.boundingBox.left);
      double blockHeight = block.boundingBox.top;
      if (blockWidth < width/2 && blockHeight > height/3 )
        res.add(block.text);
      if (blockWidth < width/2 && blockHeight < height/3)
        provider = provider + block.text +'\n';
    }
    
    if(hasDigit(provider))
      provider = 'Coursera';
    if (provider =='') provider ='Coursera';
    
    if( hasDigit(res[0]))
      res.remove(res[0]);
    learner = res[0];
    skill = res[2];

    // print(res);
  }

}
class UdemyCertificate {
  VisionText visionText;
  PickedFile image;
  String learner;
  String platform;
  String provider = '';
  String skill;
  UdemyCertificate(this.visionText,this.image){
    //  for (TextBlock block in visionText.blocks){
    //    String text = block.text;
    //     print('block : '+ text);
    // }
    String text =  visionText.blocks[1].text;
    text = text.replaceAll('\n', ' ');
    text = text.replaceAll('This is to certify that ', '/');
    text = text.replaceAll('successfully completed ', '/');
    text = text.replaceAll('the ', '/');
    text = text.replaceAll('by ', '/');
    text = text.replaceAll('on ', '/');
    List<String> ls = text.split('/');
    // print(ls);
    ls.remove('');
    ls.remove(' ');
    ls = ls.map((e) {
      return removeSpace(e);
      }).toList();
    // print(jsonEncode(ls));
    learner = ls[0];
    skill = ls[1];
    provider = ls[2];
    if(hasDigit(provider))
      provider = 'Udemy';
  }

  
}