import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/language_controller.dart';

class LanguageSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr,style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'welcome'.tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'select_language'.tr,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Obx(() => Column(
              children: [
                DropdownButtonFormField<String>(
                  value: languageController.currentLanguage.value,
                  items: [
                    DropdownMenuItem(
                        value: "en",
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.blue),
                            SizedBox(width: 8),
                            Text("English"),
                          ],
                        )),
                    DropdownMenuItem(
                        value: "hi",
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.green),
                            SizedBox(width: 8),
                            Text("Hindi"),
                          ],
                        )),
                    DropdownMenuItem(
                        value: "raj",
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.orange),
                            SizedBox(width: 8),
                            Text("Rajasthani"),
                          ],
                        )),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Choose your language',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  onChanged: (value) {
                    if (value != null) languageController.changeLanguage(value);
                  },
                ),
                SizedBox(height: 20,),
                Text('model'.tr,style:TextStyle(color: Colors.black87),),
              ],
            )),
            SizedBox(height: 30),


            ElevatedButton(
              onPressed: () {
                // Add any desired action for saving/confirming the selection
                Get.snackbar(
                  'Success',
                  'Language changed to ${languageController.currentLanguage.value}',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.teal.shade200,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'SAVE'.tr,
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
