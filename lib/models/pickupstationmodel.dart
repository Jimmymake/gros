import 'package:flutter/material.dart';

class pickupstationmodel {
  String Firstname;
  String lastname;
  String phonenumber;
  String Pickupstation;
  // String title;

  pickupstationmodel(
      {required this.Firstname,
      required this.lastname,
      required this.phonenumber,
      required this.Pickupstation}) {
    // TODO: implement
    // throw UnimplementedError();
  }
}

class Pickupstation extends StatelessWidget {
  pickupstationmodel picmodel;

  // const Pickupstationmodel({super.key});
  Pickupstation({super.key, required this.picmodel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${picmodel.Firstname}  ${picmodel.lastname}'),
              Text('${picmodel.phonenumber}')
            ],
          ),
          Text('${picmodel.Pickupstation}'),
          Text("Pickupsation"),
          Divider(),
          Row(
            children: [
              Checkbox(value: true, onChanged: (adresspicled) {}),
              Spacer(),
              ActionChip(
                label: Text("Remove"),
              ),
              ActionChip(label: Text("Edit"))
            ],
          )
        ],
      ),
    );
  }
}
