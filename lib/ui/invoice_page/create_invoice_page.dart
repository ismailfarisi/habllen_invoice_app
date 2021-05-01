import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_cubit.dart';

class CreateInvoicePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: CreateInvoicePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: BlocProvider<DriveCubit>(
            create: (context) =>
                DriveCubit(context.read<AuthenticationRepository>()),
            child: ElevatedButton(
              onPressed: () {
                context.read<DriveCubit>().getFiles();
              },
              child: Text("get Data"),
            ),
          ),
        ),
      ),
    );
    // Padding(
    //   padding: EdgeInsets.only(top: 60, left: 20,right:20,bottom:20),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //     Image(image: AssetImage('assets/1.jpg')),
    //     SizedBox(height:30),
    //     Text("Invoice",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 35, 92)),),
    //     SizedBox(height :30),
    //     Row(
    //       children:[
    //         Expanded(
    //           flex: 2,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //             Text('Invoice for',
    //             style:
    //                 TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    //             Text('companyName',
    //                   style: TextStyle(
    //                     fontSize: 11,
    //                   )),
    //             Text('companyAdd1', style: TextStyle(fontSize: 11)),
    //             Text('companyAdd2', style: TextStyle(fontSize: 11)),
    //             Text('GSTIN: companyGst', style: TextStyle(fontSize: 11)),
    //                 ],),
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //                 Text('Invoice#',style:
    //                   TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    //                 Text('100005',style: TextStyle(fontSize: 11),),
    //                 SizedBox(height:15),
    //                 Text("Dated",style:
    //                   TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    //                 Text("23/1/21",style: TextStyle(fontSize: 11),)
    //             ],
    //           ),
    //         )
    //       ]          )
    //   ],),
    // ),
  }
}
