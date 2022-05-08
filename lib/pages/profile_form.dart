import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcadmin_user/utils/validators_form.dart';

import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_profile_list.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

final List<Map<String, dynamic>> _items = [
  {
    'value': 'single',
    'label': 'Solteiro(a)',
  },
  {
    'value': 'married',
    'label': 'Casado(a)',
  },
  {
    'value': 'divorced',
    'label': 'Divorciado(a)',
  },
  {
    'value': 'widower',
    'label': 'Viúvo(a)',
  },
];

class _ProfileFormState extends State<ProfileForm> {
  File? _storedImage;
  final _socialNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobilePhoneController = TextEditingController();
  final _phoneController = TextEditingController();
  final _sosContactController = TextEditingController();
  final _sosPhoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _ufController = TextEditingController();
  final _zipController = TextEditingController();
  final _complementController = TextEditingController();
  final _districtController = TextEditingController();
  final _professionController = TextEditingController();
  final _bithdayController = TextEditingController();
  final _maritalStatusController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formUserData = <String, Object>{};

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  void submitForm() {
    final _isValidForm = _formKey.currentState?.validate() ?? false;

    if (!_isValidForm) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<UserProfileList>(
      context,
      listen: false,
    ).addUserFromData(_formUserData);
    Navigator.of(context).pop();

    //neste método temos que salvar a imagem que está instanciada em _storedImage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editando meus dados'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'nome social:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _socialNameController,
                onSaved: (socialName) =>
                    _formUserData['socialName'] = socialName ?? '',
                validator: ValidatorsForm().validateName,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'e-mail:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                onSaved: (email) => _formUserData['email'] = email ?? '',
                validator: ValidatorsForm().validarEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'telefone celular:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _mobilePhoneController,
                onSaved: (mobilePhone) =>
                    _formUserData['mobilePhone'] = mobilePhone ?? '',
                validator: ValidatorsForm().validateMobile,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'telefone:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                onSaved: (phone) => _formUserData['phone'] = phone ?? '',
                validator: ValidatorsForm().validatePhone,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'SOS contato:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _sosContactController,
                onSaved: (sosContact) =>
                    _formUserData['sosContact'] = sosContact ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'SOS telefone:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _sosPhoneController,
                onSaved: (sosPhone) =>
                    _formUserData['sosPhone'] = sosPhone ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Rua:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _streetController,
                onSaved: (street) => _formUserData['street'] = street ?? '',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'número:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      controller: _houseNumberController,
                      onSaved: (houseNumber) =>
                          _formUserData['houseNumber'] = houseNumber ?? '',
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'complemento:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      controller: _complementController,
                      onSaved: (complement) =>
                          _formUserData['complement'] = complement ?? '',
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Bairro:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _districtController,
                onSaved: (district) =>
                    _formUserData['district'] = district ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Cidade:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _cityController,
                onSaved: (city) => _formUserData['city'] = city ?? '',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 2,
                      decoration: const InputDecoration(
                          counterText: '',
                          labelText: 'UF:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      controller: _ufController,
                      onSaved: (uf) => _formUserData['uf'] = uf ?? '',
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: '01234-000',
                          labelText: 'CEP:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      controller: _zipController,
                      onSaved: (zipCode) =>
                          _formUserData['zipCode'] = zipCode ?? '',
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Profissão:',
                    labelStyle: TextStyle(color: Colors.blueGrey)),
                textInputAction: TextInputAction.next,
                controller: _professionController,
                onSaved: (profession) =>
                    _formUserData['profession'] = profession ?? '',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: '01/01/2000',
                          labelText: 'Data Nascimento:',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      controller: _bithdayController,
                      onSaved: (birthday) =>
                          _formUserData['birthday'] = birthday ?? '',
                    ),
                  ),
                  Expanded(
                      child: SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    decoration: const InputDecoration(
                        labelText: 'Estado civil:',
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                    items: _items,
                    onChanged: (val) {},
                    controller: _maritalStatusController,
                    onSaved: (maritalStatus) =>
                        _formUserData['maritalStatus'] = maritalStatus ?? '',
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: _storedImage != null
                          ? Image.file(
                              _storedImage!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : const Text(
                              'Nenhuma imagem',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera,
                          size: 50,
                          color: Colors.blueGrey,
                        ),
                        onPressed: _takePicture,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
