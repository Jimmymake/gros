import 'package:flutter/material.dart';

class mpesa extends StatelessWidget {
  const mpesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(
            //   width: 0.5,
            // ),
            borderRadius: BorderRadius.circular(5)),
        height: 140,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                height: 65,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      fit: BoxFit.fill,
                      "assets/icons/MicrosoftTeams-image_41.png",
                      width: 20,
                    ))),
            SizedBox(
              height: 5,
            ),
            // Divider(),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1)),
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: "0700012345"),
            )
          ],
        ),
      ),
    );
  }
}
