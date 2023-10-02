import 'package:flutter/material.dart';
import 'package:practice7rau/components/f2.dart';

void main() => runApp(Cape());

class Cape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterFormUser(),
    );
  }
}

class RegisterFormUser extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFormUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  User newUser = User();

  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      newUser = User(
        personName: newUser.personName,
        phoneNumber: newUser.phoneNumber,
        country: newUser.country,
        email: newUser.email,
        life: newUser.life,
        password: newUser.password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationConfirmation(user: newUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  icon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.personName = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Write your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  icon: Icon(Icons.phone),
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.phoneNumber = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Write your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Country',
                  icon: Icon(Icons.map),
                ),
                value: newUser.country,
                items: _countries.map((country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    newUser.country = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select your country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.email = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tell your life story',
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.life = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  icon: Icon(Icons.security),
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.password = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Write your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.security),
                ),
                onChanged: (value) {
                  setState(() {
                    newUser.confirmPassword = value;
                  });
                },
                validator: (value) {
                  if (value != newUser.password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
