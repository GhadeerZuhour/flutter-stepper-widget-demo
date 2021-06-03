
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DriverRegistrationForm extends StatefulWidget {

  @override
  _DriverRegistrationFormState createState() => _DriverRegistrationFormState();
}

class _DriverRegistrationFormState extends State<DriverRegistrationForm> {


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
                              title: new Text('Personal Information',
                                style: TextStyle(fontSize: 18),
                              ),
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
                              ),

                            isActive: _currentStep >= 0,
                            state: _currentStep >= 0 ?
                            StepState.complete : StepState.disabled,
                          ),

                          Step(
                              title: new Text('Car Details',
                                  style: TextStyle(fontSize: 18),),
                              content: Column(
                                children: <Widget>[

                                  FormBuilderDropdown(
                                    name: 'carBrand',
                                    decoration: InputDecoration(
                                      labelText: 'Car Brand',
                                    ),

                                    allowClear: true,
                                    hint: Text('Select your Car Brand'),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required(context)]),
                                    items: [
                                      "Skoda",
                                      "Mazda",
                                      "Hyundai",
                                      "Mercedes",
                                      "BMW",
                                      "Honda",
                                      "Other.."
                                    ]
                                        .map((carBrand) => DropdownMenuItem(
                                      value: carBrand,
                                      child: Text('$carBrand'),
                                    ))
                                        .toList(),
                                  ),

                                  FormBuilderDropdown(
                                    name: 'carModelYear',
                                    decoration: InputDecoration(
                                      labelText: 'Car Model Year',
                                    ),
                                    // initialValue: 'Male',
                                    allowClear: true,
                                    hint: Text('Select your Car Model Year'),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required(context)]),
                                    items: [
                                      "2008",
                                      "2009",
                                      "2010",
                                      "2011",
                                      "2012",
                                      "2013",
                                      "2014",
                                      "2015",
                                      "2016",
                                      "2017",
                                      "2018",
                                      "2019",
                                      "2020",
                                      "2021",
                                      "Other.."
                                    ]
                                        .map((carModelYear) => DropdownMenuItem(
                                      value: carModelYear,
                                      child: Text('$carModelYear'),
                                    ))
                                        .toList(),
                                  ),

                                  FormBuilderTextField(
                                    name: 'model',
                                    decoration: InputDecoration(
                                      labelText: 'Car Model',
                                      hintText: 'Enter your Car Model',
                                    ),
                                    //  onChanged: onChanged,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.numeric(context),
                                      FormBuilderValidators.max(context, 70),
                                    ]),
                                  ),

                                  FormBuilderDropdown(
                                    name: 'carType',
                                    decoration: InputDecoration(
                                      labelText: 'Car Type',
                                    ),

                                    allowClear: true,
                                    hint: Text('Select your Car Type'),
                                    validator: FormBuilderValidators.compose(
                                        [FormBuilderValidators.required(context)]),
                                    items: [
                                      "TAXI",
                                      "SMALL VAN",
                                      "SMALL BUS",
                                      "BIG BUS",
                                      "TRUCK",
                                      "Other.."
                                    ]
                                        .map((carType) => DropdownMenuItem(
                                      value: carType,
                                      child: Text('$carType'),
                                    ))
                                        .toList(),
                                  ),

                                ],
                              ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 1 ?
                            StepState.complete : StepState.disabled,
                          ),

                          Step(
                            title: new Text('Upload Documents',
                                  style: TextStyle(fontSize: 18, ),
                            ),
                            content: Column(
                              children: <Widget>[

                                FormBuilderTextField(
                                  name: 'model',
                                  decoration: InputDecoration(
                                    labelText: 'Car Model',
                                    hintText: 'Enter your Car Model',
                                  ),
                                  //  onChanged: onChanged,
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                    FormBuilderValidators.max(context, 70),
                                  ]),
                                ),
                            /*    FormBuilderFilePicker(
                                  name: 'profilePic',
                                  decoration: InputDecoration(labelText: 'Profile Picture'),
                                  maxFiles: null,
                                  previewImages: true,
                                  onChanged: (val) => print(val),
                                  selector: Row(
                                    children: <Widget>[
                                      Icon(Icons.image),
                                      Text('Upload'),
                                    ],
                                  ),
                                  onFileLoading: (val) {
                                    print(val);
                                  },
                                ),*/
                              ],
                            ),
                            isActive:_currentStep >= 0,
                            state: _currentStep >= 2 ?
                            StepState.complete : StepState.disabled,
                          ),
                        ],
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


