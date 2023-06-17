import 'package:flutter/material.dart';
import '../component.dart';

ElevatedButton CustomElevatedButton1(width,title){
  return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width*0.9, 45),
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.white
      ),
      child: Text(title, style: largeSubTitle,));
}