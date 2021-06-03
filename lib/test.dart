import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {

  final formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Join'),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: formKey,
                    child: Stepper(
                        type: stepperType,
                        physics: ScrollPhysics(),
                        currentStep: _currentStep,
                        onStepTapped: (step) => tapped(step),
                        onStepContinue:  continued,
                        onStepCancel: cancel,
                        steps: <Step>[
                          Step(
                            title: new Text('Personal Information'),
                            content: Column(
                              children: [
                                FormBuilderTextField(
                                  name: 'firstName',
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    hintText: 'Enter your first Name',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),
                                ),

                                FormBuilderTextField(
                                  name: 'lastName',
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    hintText: 'Enter your Last Name',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),
                                ),

                                FormBuilderTextField(
                                  name: 'mobileNO',
                                  decoration: InputDecoration(
                                    labelText: 'Mobile Number',
                                    hintText: 'Enter your Mobile Number',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),

                                  keyboardType: TextInputType.number,


                                ),

                                FormBuilderTextField(
                                  name: 'address',
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    hintText: 'Enter your address',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),
                                ),

                                FormBuilderTextField(
                                  name: 'email',
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your Email Address',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),
                                ),

                              ],
                            )

                          )
                        ]
                    )

                    ),
                  ),
                )
          ],
        ),
      ),

    );
  }


  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }

}
