import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
      padding: const EdgeInsets.fromLTRB(1, 1, 1, 10),
      child: SizedBox(
        height: 50,
        width: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomAppBar(
            color: const Color(0xff143234),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20,
                  ),
                  hoverColor: const Color.fromARGB(255, 130, 129, 129),
                  onPressed: () {
                    // Handle your action here
                  },
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  hoverColor: const Color.fromARGB(255, 130, 129, 129),
                  onPressed: () {
                    // Handle your action here
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                  hoverColor: const Color.fromARGB(255, 130, 129, 129),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
