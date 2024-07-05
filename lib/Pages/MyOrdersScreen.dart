import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderNumber: '12345',
      date: '2023-07-01',
      status: 'Delivered',
      total: 'Rp. 120,000.00',
      imagePath: 'assets/icons/rendang.jpeg',
    ),
    Order(
      orderNumber: '12346',
      date: '2023-07-02',
      status: 'In Transit',
      total: 'Rp. 80,000.00',
      imagePath: 'assets/icons/pizza.png',
    ),
    Order(
      orderNumber: '12347',
      date: '2023-07-03',
      status: 'Pending',
      total: 'Rp. 50,000.00',
      imagePath: 'assets/icons/sate.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Color(0xFF66B2B2),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(orders[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Number: ${orders[index].orderNumber}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Date: ${orders[index].date}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Status: ${orders[index].status}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Total: ${orders[index].total}', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final String orderNumber;
  final String date;
  final String status;
  final String total;
  final String imagePath;

  Order({
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.total,
    required this.imagePath,
  });
}
