import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../LoginPage/loginscreen.dart';

enum FormData {
  Name,
  Username,
  Phone,
  Email,
  Gender,
  password,
  ConfirmPassword,
  date
}

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color enabled = Color.fromARGB(255, 141, 31, 31);
  Color enabledtxt = Colors.white;
  Color deaible = Color.fromARGB(255, 255, 255, 255);
  Color backgroundColor = Color.fromARGB(255, 141, 31, 31);
  bool ispasswordev = true;

  FormData? selected;

  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController dateinput = new TextEditingController();

  List<DropdownMenuItem> generateItems(List<Genders> genders) {
    List<DropdownMenuItem> items = [];
    for (var item in genders) {
      items.add(DropdownMenuItem(
        child: Text(item.genders),
        value: item,
      ));
    }
    return items;
  }

  Genders? selectedGender;
  List<Genders> genders = [Genders("Laki-Laki"), Genders("Perempuan")];
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.4, 0.7, 0.9],
              colors: [
                HexColor("#A92525").withOpacity(0.8),
                HexColor("#A92525"),
                HexColor("#A92525"),
                HexColor("#A92525")
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Card(
                  elevation: 5,
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 0.8,
                          child: Image.asset(
                            "assets/images/logo_rk.png",
                            width: 90,
                            height: 90,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            child: Text(
                              "Daftar Akun Sekarang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9),
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Name
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: nameController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Name;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Nama Lengkap',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Username
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: usernameController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Username;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person_2,
                                  color: selected == FormData.Username
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Username
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Username
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.password
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: passwordController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          ),
                                    onPressed: () => setState(
                                        () => ispasswordev = !ispasswordev),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.password
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.ConfirmPassword
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: confirmPasswordController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.ConfirmPassword;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.ConfirmPassword
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: selected ==
                                                    FormData.ConfirmPassword
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: selected ==
                                                    FormData.ConfirmPassword
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          ),
                                    onPressed: () => setState(
                                        () => ispasswordev = !ispasswordev),
                                  ),
                                  hintText: 'Konfirmasi Password',
                                  hintStyle: TextStyle(
                                      color:
                                          selected == FormData.ConfirmPassword
                                              ? enabledtxt
                                              : deaible,
                                      fontSize: 12)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.ConfirmPassword
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Email
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Email;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Phone
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Phone;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone_android_rounded,
                                  color: selected == FormData.Phone
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Nomor Telepon',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Phone
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Phone
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.date
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: dateinput,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                  setState(() {
                                    String formattedDate =
                                        DateFormat("dd-MM-yyyy")
                                            .format(pickedDate);
                                    print(formattedDate);
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Tangal belum di pilih");
                                }
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: selected == FormData.date
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Tanggal Lahir',
                                hintStyle: TextStyle(
                                    color: selected == FormData.date
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.date
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.Gender
                                      ? enabled
                                      : backgroundColor,
                                ),
                                // padding: const EdgeInsets.all(4.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.white,
                                    dropdownColor:
                                        Color.fromARGB(255, 141, 31, 31),
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.male,
                                          color: selected == FormData.Gender
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: ("Jenis Kelamin"),
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: selected == FormData.date
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    value: selectedGender,
                                    items: generateItems(genders),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedGender = item;
                                        Text(
                                          (selectedGender != null)
                                              ? selectedGender!.genders
                                              : "Belum ada terpilih",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 245, 47, 47)),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 141, 31, 31),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)))),
                        ),
                      ],
                    ),
                  ),
                ),
                //End of Center Card
                //Start of outer card
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Jika Sudah Memiliki Akun ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 225, 225, 225),
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text("Login disini",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Genders {
  String genders;
  Genders(this.genders);
}
