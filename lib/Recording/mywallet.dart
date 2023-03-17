import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double balance = 100.0;
  List<Transaction> transactions = [    Transaction('Deposit', 50.0, DateTime.now()),    Transaction('Withdrawal', -20.0, DateTime.now()),    Transaction('Deposit', 30.0, DateTime.now()),    Transaction('Withdrawal', -10.0, DateTime.now()),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallet'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionHistoryPage(transactions: transactions),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.greenAccent
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          'Available Balance',
                          style: GoogleFonts.laila(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white)
                      ),
                    ),
                    SizedBox(height: 20.0),
                   Row(
                     children: [
                       Text(
                           '\$${balance.toStringAsFixed(1)}',
                           style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.deepPurple)
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         child: Image(
                           image: AssetImage('assets/images/coin.png'),
                           width: 70,
                           height: 90,

                         ),
                       ),
                     ],
                   )
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Image(
                          image: AssetImage('assets/images/money_tranfer.png',),
                          width: 100,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("    Money Tranfer",style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Image(
                            image: AssetImage('assets/images/money_icon.png',),
                            width: 70,
                            height: 90,
                          ),
                        ),
                        Text("Rewards",style: GoogleFonts.lato(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){

                          },
                            child: Image(
                              image: AssetImage('assets/images/bank_logo.png',),
                              width: 70,
                              height: 90,
                            ),
                          ),
                        Text("Balance",style: GoogleFonts.lato(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransactionHistoryPage(transactions: transactions)));
              },
              child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Icon(Icons.transfer_within_a_station_outlined),
                      Center(
                        widthFactor: 1.2,
                        child: Text("TRANSACTIONS",style: GoogleFonts.lato(fontSize: 20),

                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        transaction.amount < 0 ? Icons.arrow_downward : Icons.arrow_upward,
                        color: transaction.amount < 0 ? Colors.red : Colors.green,
                      ),
                      title: Text(transaction.description,style: GoogleFonts.lato(),),
                      subtitle: Text(transaction.date.toString(),style: GoogleFonts.lato(),),
                      trailing: Text(
                        '\$${transaction.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: transaction.amount < 0 ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHistoryPage({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            leading: Icon(
              transaction.amount < 0 ? Icons.arrow_downward : Icons.arrow_upward,
              color: transaction.amount < 0 ? Colors.red : Colors.green,
            ),
            title: Text(transaction.description),
            subtitle: Text(transaction.date.toString()),
            trailing: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: transaction.amount < 0 ? Colors.red : Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Transaction {
  String description;
  double amount;
  DateTime date;

  Transaction(this.description, this.amount, this.date);
}

