import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Shoes extends StatefulWidget {
  final String image;
  const Shoes({super.key, required this.image});

  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> with TickerProviderStateMixin{
  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation=CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: "red",
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
                ]),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child:  FadeTransition(
                    opacity: _animation,

                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.9),
                              Colors.black.withOpacity(.0)
                            ]
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sneakers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 25,),
                            Text(
                              "Size",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  child: const Center(
                                    child: Text("40", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Text("42", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  child: const Center(
                                    child: Text("44", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  child: const Center(
                                    child: Text("46", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: 60,),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text("Buy Now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            const SizedBox(height: 30,),

                          ],
                        ),
                      ),
                  ),

                )

                // const Text(
                //   "100\$",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
