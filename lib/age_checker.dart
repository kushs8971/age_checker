import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_purpose/age_provider.dart';
import 'package:provider/provider.dart';

class AgeChecker extends StatefulWidget {
  const AgeChecker({Key? key}) : super(key: key);

  @override
  State<AgeChecker> createState() => _AgeCheckerState();
}

class _AgeCheckerState extends State<AgeChecker> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ChangeNotifierProvider<AgeProvider>(
        create: (context) => AgeProvider(),
        child: Consumer<AgeProvider>(
          builder: (context, provider, child){
            return Column(
              children: [
                SizedBox(height: 50,),
                Center(
                    child: Text("Enter Age",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    )),
                SizedBox(height: 40,),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 400
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Age",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (val){
                        provider.checkEligibility(int.parse(val));
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Text(provider.eligibilityMessage,
                  style: TextStyle(
                      fontSize: 16
                  ),
                )

              ],
            );

          },
        ),
      ),
    ));
  }
}
