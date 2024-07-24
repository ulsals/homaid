part of 'pages.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
             const SizedBox(
              height: 20,
            ),
            Image.asset('assets/Hom.png', fit: BoxFit.fill),
            const SizedBox(
              height: 50,
            ),

            const Text("Jasa Kebutuhan \nRumah Tangga\n Terlengkap",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 43,
              width: 388,
              
              //button
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman berikutnya
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Lanjut',
                  style: TextStyle(color: whiteColour),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
