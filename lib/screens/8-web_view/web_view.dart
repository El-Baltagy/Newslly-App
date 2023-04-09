
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/3-layout/layout.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/widget/components.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatelessWidget {
//
//
//   final String? url;
//   final String? title;
//   WebViewScreen(this.url , this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title! , style: TextStyle(color: Colors.black87),),
//       ),
//       body: WebView(
//         initialUrl: url!,
//       ),
//     );
//   }
// }

class Web extends StatelessWidget {
  Web(this.url);
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit()..checkConnection(),
      child: BlocConsumer<homeCubit,homeStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          final h=MediaQuery.of(context).size.height;
          final w=MediaQuery.of(context).size.width;
          var cubit=homeCubit.getInstance(context);

          return  Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, h*0.06 ),
                child: AppBar(
                  elevation: 0,leadingWidth: 400,
                  leading: Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(onPressed: (){
                      GoPage().navigateAndFinish(context, LayOut(),);
                    }, child: Text('Back'.translate(context: context),style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),)),
                  ),
                  // title: const Text("WebView",style: TextStyle(color: Colors.blue),),
                ),
              ),
              body:!cubit.connected
                  ? networkCheck(h: h, w: w, function: () {
                cubit.checkConnection();
              },)
                  : WebviewPage(url: url,)
          );
        },
      ),
    );
  }
}

class WebviewPage extends StatefulWidget {
  WebviewPage({required this.url});
  final String? url;


  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url!));

  }

  @override
  Widget build(BuildContext context) {

    return WebViewWidget(controller: _controller!);
  }
}

