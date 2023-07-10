import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:temelden_zirveye_flutter/day09_postman_servis_future_try_catch/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {

  List<PostModel>? _items;
  bool _isLoading=true;

  @override
  void initState() { 
    super.initState();
    fetchPostItems();
  }

  void changeLoading(){
    setState(() {
      _isLoading=!_isLoading;
    });
    
  }

  Future<void> fetchPostItems() async {
    changeLoading();
    final response=await Dio().get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode==HttpStatus.ok){
      final _datas=response.data;

      if(_datas is List){
        setState(() {
          _items=_datas.map((e) => PostModel.fromJson(e)).toList();
        });
        
      }
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servis"),
        actions: [
          _isLoading ?CircularProgressIndicator.adaptive():SizedBox(),
        ],
      ),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              title: Text(_items?[index].title ?? ''),
              subtitle: Text(_items?[index].body ?? ''),
            ),
          );
        }
        ))
    );
  }
}