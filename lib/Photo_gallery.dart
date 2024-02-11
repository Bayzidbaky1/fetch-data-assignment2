import 'dart:convert';

import 'package:assignment_api_datafetch/details_screen.dart';
import 'package:assignment_api_datafetch/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<PhotoModel> photoList = [];

  bool isLoading = true;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: photoList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            id: photoList[index].id,
                            image: photoList[index].url,
                            title: photoList[index].title,
                          ),
                        ),
                      );
                    },
                    leading: SizedBox(
                      height: 100,
                      child: Image.network(photoList[index].thumbnailUrl ?? ""),
                    ),
                    title: Text(photoList[index].title ?? ""),
                  ),
                );
              },
            ),
    );
  }

  fetchData() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      var jsondecode = jsonDecode(response.body);
      print(jsondecode);
      for (var element in jsondecode) {
        PhotoModel photoModel = PhotoModel.formjson(element);
        photoList.add(photoModel);
        setState(() {
          isLoading = false; // Setting isLoading to false when data is fetched
        });
      }
    }
  }
}
