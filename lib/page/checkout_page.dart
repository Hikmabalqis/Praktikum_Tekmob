import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CardItem> cardItem = [
      const CardItem(
        dueDate: 'Due date on 16 Feb 2024',
        image: 'assets/images/logo-1.png',
        price: 'Rp450.000',
      ),
      const CardItem(
        dueDate: 'Due date on 20 Feb 2024',
        image: 'assets/images/logo-2.png',
        price: 'Rp240.000',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfffafafc),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FeatherIcons.chevronLeft),
          onPressed: () {},
        ),
        title: const Text(
          "Internet",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xffF3CC46),
                            width: 1,
                          ),
                          color: const Color(0xffFFF5E6)),
                      child: const Row(
                        children: [
                          Icon(
                            FeatherIcons.info,
                            color: Color(0xffF3CC46),
                          ),
                          SizedBox(width: 12),
                          Text.rich(
                            textAlign: TextAlign.start,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Perlu diketahui, proses verifikasi transaksi \ndapat memakan waktu hingga ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "1x24 jam.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose All",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Checkbox(value: false, onChanged: (value) {})
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cardItem.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          dueDate: cardItem[index].dueDate,
                          image: cardItem[index].image,
                          price: cardItem[index].price,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction History",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 14, right: 16, left: 16, bottom: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/logo-3.png"),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Total Payment"),
                      ],
                    ),
                    Text("Rp450.000")
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    backgroundColor: Color(0xffE12029),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('PAY NOW'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardItem {
  final String price;
  final String image;
  final String dueDate;

  const CardItem({
    required this.dueDate,
    required this.image,
    required this.price,
  });
}

class Card extends StatefulWidget {
  final String image;
  final String price;
  final String dueDate;

  const Card({
    super.key,
    required this.dueDate,
    required this.image,
    required this.price,
  });

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xffE9E9E9),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 9),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffE9E9E9), width: 0.5)),
                      child: Image.asset(widget.image),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.price),
                        Text(
                          widget.dueDate,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff838799)),
                        ),
                      ],
                    ),
                  ],
                ),
                Checkbox(
                  value: checked,
                  onChanged: (value) => setState(() => checked = !checked),
                  checkColor: Colors.white,
                  activeColor: const Color(0xffE12029),
                )
              ],
            ),
          ),
          Divider(
            color: Color(0xffE9E9E9),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'See Details',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE12029)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
