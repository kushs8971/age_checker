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
                _buildHeader(),
                SizedBox(height: 40,),
                _buildTextFormField(provider),
                SizedBox(height: 40,),
                _buildTextValidator(provider)
              ],
            );

          },
        ),
      ),
    ));
  }

  Text _buildTextValidator(AgeProvider provider) {
    return Text(provider.eligibilityMessage,
                style: TextStyle(
                    fontSize: 16,
                  color: provider.isEligible ? Colors.greenAccent : Colors.redAccent
                ),
              );
  }
  Container _buildTextFormField(AgeProvider provider) {
    return Container(
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
              );
  }
  Row _buildHeader() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/agee.png",
                  height: 30,
                  width: 30,
                  ),
                  SizedBox(width: 10,),
                  Center(
                      child: Text("Age Gate - Keeper",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )),
                ],
              );
  }

}
