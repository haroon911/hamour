// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart'
//     as smooth_page_indicator;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'home_page_model.dart';
// export 'home_page_model.dart';

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({Key? key}) : super(key: key);

//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget>
//     with TickerProviderStateMixin {
//   late HomePageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final _unfocusNode = FocusNode();
//   int get pageViewCurrentIndex => _model.pageViewController != null &&
//           _model.pageViewController!.hasClients &&
//           _model.pageViewController!.page != null
//       ? _model.pageViewController!.page!.round()
//       : 0;

//   final animationsMap = {
//     'pageViewOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//       ],
//     ),
//   };

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     _unfocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Theme.of(context).primaryBackground,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60),
//           child: AppBar(
//             backgroundColor: Theme.of(context).primaryBackground,
//             automaticallyImplyLeading: false,
//             actions: [],
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 'Hamour',
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).headlineMedium,
//               ),
//               centerTitle: true,
//               expandedTitleScale: 1.0,
//             ),
//             elevation: 0,
//           ),
//         ),
//         body: SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).secondaryBackground,
//                 ),
//                 child: Container(
//                   width: double.infinity,
//                   height: 500,
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
//                         child: PageView(
//                           controller: _model.pageViewController ??=
//                               PageController(initialPage: 0),
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Image.network(
//                               'https://picsum.photos/seed/379/600',
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                             Image.network(
//                               'https://picsum.photos/seed/957/600',
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                             Image.network(
//                               'https://picsum.photos/seed/334/600',
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0, 1),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
//                           child: smooth_page_indicator.SmoothPageIndicator(
//                             controller: _model.pageViewController ??=
//                                 PageController(initialPage: 0),
//                             count: 3,
//                             axisDirection: Axis.horizontal,
//                             onDotClicked: (i) async {
//                               await _model.pageViewController!.animateToPage(
//                                 i,
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.ease,
//                               );
//                             },
//                             effect: smooth_page_indicator.ExpandingDotsEffect(
//                               expansionFactor: 2,
//                               spacing: 8,
//                               radius: 16,
//                               dotWidth: 16,
//                               dotHeight: 16,
//                               dotColor: Theme.of(context).accent2,
//                               activeDotColor:
//                                   Theme.of(context).primary,
//                               paintStyle: PaintingStyle.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ).animateOnPageLoad(
//                     animationsMap['pageViewOnPageLoadAnimation']!),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                 child: Container(
//                   width: 370,
//                   height: 190,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 6,
//                         color: Color(0x4B1A1F24),
//                         offset: Offset(0, 2),
//                       )
//                     ],
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
//                       stops: [0, 1],
//                       begin: AlignmentDirectional(0.94, -1),
//                       end: AlignmentDirectional(-0.94, 1),
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(
//                           'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/default-project-widgets-xzsp5v/assets/ddr0sc80h0hs/@3xlogoMark_outline.png',
//                           width: 44,
//                           height: 44,
//                           fit: BoxFit.cover,
//                         ),
//                         Text(
//                           'Balance',
//                           style:
//                               Theme.of(context).bodyMedium.override(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                         Text(
//                           '\$7,630',
//                           style: Theme.of(context)
//                               .displaySmall
//                               .override(
//                                 fontFamily: 'Outfit',
//                                 color: Colors.white,
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 4),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '**** 0149',
//                                 style: Theme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Roboto Mono',
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                               ),
//                               Text(
//                                 '05/25',
//                                 style: Theme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Roboto Mono',
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
//                 child: Container(
//                   width: double.infinity,
//                   height: 270,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF4B39EF),
//                     borderRadius: BorderRadius.circular(0),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
//                         child: Text(
//                           'You quotes',
//                           style: Theme.of(context)
//                               .headlineMedium
//                               .override(
//                                 fontFamily: 'Outfit',
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 12),
//                         child: Text(
//                           'You will find your quote options below.',
//                           style:
//                               Theme.of(context).bodyMedium.override(
//                                     fontFamily: 'Plus Jakarta Sans',
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView(
//                           padding: EdgeInsets.zero,
//                           primary: false,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
//                               child: Container(
//                                 width: 270,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 4,
//                                       color: Color(0x2B202529),
//                                       offset: Offset(0, 2),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 12, 12, 12),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Company Name',
//                                               style: Theme.of(
//                                                       context)
//                                                   .bodyLarge
//                                                   .override(
//                                                     fontFamily:
//                                                         'Plus Jakarta Sans',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           Icon(
//                                             Icons.star_rounded,
//                                             color: Color(0xFF4B39EF),
//                                             size: 24,
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 4, 0),
//                                             child: Text(
//                                               '4.5',
//                                               style: Theme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily:
//                                                         'Plus Jakarta Sans',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           Text(
//                                             '(242)',
//                                             style: Theme.of(context)
//                                                 .bodySmall
//                                                 .override(
//                                                   fontFamily:
//                                                       'Plus Jakarta Sans',
//                                                   color: Color(0xFF14181B),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 50, 0, 0),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               '\$194.25',
//                                               style: Theme.of(
//                                                       context)
//                                                   .displaySmall
//                                                   .override(
//                                                     fontFamily: 'Outfit',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 36,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 '/mo',
//                                                 style:
//                                                     Theme.of(context)
//                                                         .bodySmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF14181B),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                               ),
//                                             ),
//                                             FlutterFlowIconButton(
//                                               borderColor: Color(0xFFF1F4F8),
//                                               borderRadius: 30,
//                                               borderWidth: 2,
//                                               buttonSize: 44,
//                                               icon: Icon(
//                                                 Icons.arrow_forward_rounded,
//                                                 color: Color(0xFF57636C),
//                                                 size: 24,
//                                               ),
//                                               onPressed: () {
//                                                 print('IconButton pressed ...');
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Icon(
//                                             Icons.local_fire_department_sharp,
//                                             color: Color(0xFFFF5963),
//                                             size: 24,
//                                           ),
//                                           Text(
//                                             '\$124.29 yearly savings',
//                                             style: Theme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily:
//                                                       'Plus Jakarta Sans',
//                                                   color: Color(0xFF14181B),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   12, 12, 12, 12),
//                               child: Container(
//                                 width: 270,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 4,
//                                       color: Color(0x2B202529),
//                                       offset: Offset(0, 2),
//                                     )
//                                   ],
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 12, 12, 12),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Company Name',
//                                               style: Theme.of(
//                                                       context)
//                                                   .bodyLarge
//                                                   .override(
//                                                     fontFamily:
//                                                         'Plus Jakarta Sans',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           Icon(
//                                             Icons.star_rounded,
//                                             color: Color(0xFF4B39EF),
//                                             size: 24,
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 4, 0),
//                                             child: Text(
//                                               '4.5',
//                                               style: Theme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily:
//                                                         'Plus Jakarta Sans',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           Text(
//                                             '(242)',
//                                             style: Theme.of(context)
//                                                 .bodySmall
//                                                 .override(
//                                                   fontFamily:
//                                                       'Plus Jakarta Sans',
//                                                   color: Color(0xFF14181B),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 50, 0, 0),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               '\$194.25',
//                                               style: Theme.of(
//                                                       context)
//                                                   .displaySmall
//                                                   .override(
//                                                     fontFamily: 'Outfit',
//                                                     color: Color(0xFF14181B),
//                                                     fontSize: 36,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 '/mo',
//                                                 style:
//                                                     Theme.of(context)
//                                                         .bodySmall
//                                                         .override(
//                                                           fontFamily:
//                                                               'Plus Jakarta Sans',
//                                                           color:
//                                                               Color(0xFF14181B),
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                               ),
//                                             ),
//                                             FlutterFlowIconButton(
//                                               borderColor: Color(0xFFF1F4F8),
//                                               borderRadius: 30,
//                                               borderWidth: 2,
//                                               buttonSize: 44,
//                                               icon: Icon(
//                                                 Icons.arrow_forward_rounded,
//                                                 color: Color(0xFF57636C),
//                                                 size: 24,
//                                               ),
//                                               onPressed: () {
//                                                 print('IconButton pressed ...');
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Icon(
//                                             Icons.local_fire_department_sharp,
//                                             color: Color(0xFFFF5963),
//                                             size: 24,
//                                           ),
//                                           Text(
//                                             '\$124.29 yearly savings',
//                                             style: Theme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily:
//                                                       'Plus Jakarta Sans',
//                                                   color: Color(0xFF14181B),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
