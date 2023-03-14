import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final List<Data> _isiListView = [
    Data('Syailendra Pendapatan tetap Premium', '4,0', 'Pendapatan Tetap', 6.22,
        '1.070', '256M'),
    Data('Start Stable Income Fund', '3,2', 'Pendapatan Tetap', 12.37, '1.070',
        '256M'),
    Data('Secureinvest Sharia Sukuk Fund', '4,1', 'Pendapatan Tetap', 12.00,
        '1.080', '3,3T')
  ];
  int _dropdownPeriode = 6;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> dropdownItem = [];

    dropdownItem.add(const DropdownMenuItem(
      value: 6,
      child: Text("6 bulan"),
    ));
    dropdownItem.add(const DropdownMenuItem(
      value: 12,
      child: Text("1 tahun"),
    ));
    dropdownItem.add(const DropdownMenuItem(
      value: 24,
      child: Text("2 tahun"),
    ));

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: const FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: const Text('Quiz Flutter'),
            actions: const <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: DropdownButton(
                  value: _dropdownPeriode,
                  items: dropdownItem,
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue != null) {
                        _dropdownPeriode = newValue;
                      }
                    });
                  },
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: _isiListView.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 100),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180)),
                                  child: Image.network(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                                    height: 50,
                                    width: 100,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(_isiListView[index].getNama()),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            "⭐ ${_isiListView[index].getSkor()} - Pendapatan Tetap"),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Imbas Hasil",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text((_isiListView[index].getImbalHasil() *
                                            _dropdownPeriode.toInt() /
                                            6)
                                        .toString())
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Harga Unit",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                        "Rp ${_isiListView[index].getHarrgaUnit()}")
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Dana kelolaan",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                        "Rp ${_isiListView[index].getDanaKelolaan()}")
                                  ],
                                )
                              ],
                            )
                          ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 17'),
            content:
                const Text('haroldsimarmata@upi.edu ; davin1fausta@upi.edu'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
