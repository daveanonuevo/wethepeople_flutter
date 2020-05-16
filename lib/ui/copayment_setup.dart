import 'package:flutter/material.dart';
import 'package:wethepeople_flutter/ui/copayment_overview.dart';

class CoPaymentSetup extends StatefulWidget {
  @override
  _CoPaymentSetupState createState() => _CoPaymentSetupState();
}

class _CoPaymentSetupState extends State<CoPaymentSetup> {
  List<String> _dropdownChoices = ['+65', '+60'];
  List<String> _selectedDropdown = ['+65'];

  List<TextEditingController> _numbers = [TextEditingController()];

  void _onSubmit(selectedDropdown, numbers, context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CoPaymentOverview(currencies: selectedDropdown, numbers: numbers)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("RazerOuts")),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text("Enter details of Co-payers",
                  style: TextStyle(
                    fontSize: 28,
                  ),),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _numbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton<String>(
                                    value: _selectedDropdown[index],
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _selectedDropdown[index] = newValue;
                                      });
                                    },
                                    items: _dropdownChoices
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList()),
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                    controller: _numbers[index],
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 20),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        labelText: "Number",
                                        border: OutlineInputBorder(
                                            gapPadding: 2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      child: RaisedButton(
                          child: Text(
                            "Add More Options",
                            style: TextStyle(
                                color: Colors.black, fontSize: 16.0),
                          ),
                          onPressed: () {
                            setState(() {
                              _numbers.add(new TextEditingController());
                              _selectedDropdown.add("+65");
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    ButtonTheme(
                      buttonColor: Colors.red,
                      child: RaisedButton(
                          child: Text(
                            "Delete Latest Option",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedDropdown.removeLast();
                              _numbers.removeLast();
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    child: SizedBox(
                      width: 500,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueAccent)
                        ),
                        child: Text("Submit",
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                        onPressed: () {
                          _onSubmit(_selectedDropdown, _numbers, context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
