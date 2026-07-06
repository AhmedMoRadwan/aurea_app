import 'package:flutter/material.dart';
class CollectionsGridView extends StatelessWidget {
  const CollectionsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          // color: Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            // side: BorderSide(color: Color(0xffF6EFDD))
          ),

          // elevation: 0.1,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {},

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/Border.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  Text(
                    'RINGS',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 158, 125, 16),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}