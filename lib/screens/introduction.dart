import 'package:alquran/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

//https://www.youtube.com/watch?v=tEhzfG0NUf4&list=PL7jdfftn7HKvWLVrADa7UX-A_6E3859Xi&index=4

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = "Alqur'an Apps";
    return GetMaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Alqur'an Apps",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Sesibuk itu kah kamu, sampai belum membaca Alqur'an?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                height: 300,
                child: Lottie.asset('assets/lotties/quran.json'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Get.to(MyApp()),
                child: Text('GET STARTED'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
