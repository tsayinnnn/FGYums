import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'indiv_model.dart';
export 'indiv_model.dart';

class IndivWidget extends StatefulWidget {
  const IndivWidget({
    super.key,
    required this.name,
    required this.ingredients,
    required this.procedures,
    required this.image,
    required this.description,
    required this.isFavorite,
    required this.recipe,
  });

  final String? name;
  final List<String>? ingredients;
  final List<String>? procedures;
  final String? image;
  final String? description;
  final bool? isFavorite;
  final DocumentReference? recipe;

  @override
  State<IndivWidget> createState() => _IndivWidgetState();
}

class _IndivWidgetState extends State<IndivWidget>
    with TickerProviderStateMixin {
  late IndivModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(30.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndivModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.recipe!.update({
        ...mapToFirestore(
          {
            'Last_Accessed': FieldValue.serverTimestamp(),
          },
        ),
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'NENET\'S KITCHEN',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.menu_book,
                color: FlutterFlowTheme.of(context).secondary,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(
                  'Book',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.rightToLeft,
                    ),
                  },
                );
              },
            ),
          ],
          centerTitle: false,
          elevation: 4.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                height: 500.0,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.05, -1.0),
                      child: Image.network(
                        widget.image!,
                        width: double.infinity,
                        height: 500.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 60.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '\n\n\n\n',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 700.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 8.0, 10.0, 24.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Divider(
                                          height: 8.0,
                                          thickness: 4.0,
                                          indent: 140.0,
                                          endIndent: 140.0,
                                          color: Color(0xFFE0E3E7),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (widget.isFavorite ==
                                                      true) {
                                                    return Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await widget.recipe!
                                                              .update(
                                                                  createRecipesRecordData(
                                                            isFavorite: false,
                                                          ));
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    return Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await widget.recipe!
                                                              .update(
                                                                  createRecipesRecordData(
                                                            isFavorite: true,
                                                          ));
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 0.0),
                                                  child: GradientText(
                                                    valueOrDefault<String>(
                                                      widget.name,
                                                      'Food',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .warning
                                                    ],
                                                    gradientDirection:
                                                        GradientDirection.ltr,
                                                    gradientType:
                                                        GradientType.linear,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation']!),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Text(
                                                    widget.description!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 628.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                0.0, 16.0),
                                                    child: GradientText(
                                                      'Ingredients',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .warning
                                                      ],
                                                      gradientDirection:
                                                          GradientDirection.ltr,
                                                      gradientType:
                                                          GradientType.linear,
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final ings = widget
                                                        .ingredients!
                                                        .toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: ings.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(height: 4.0),
                                                      itemBuilder:
                                                          (context, ingsIndex) {
                                                        final ingsItem =
                                                            ings[ingsIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            ingsItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                0.0,
                                                                16.0),
                                                    child: GradientText(
                                                      'Procedure',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .warning
                                                      ],
                                                      gradientDirection:
                                                          GradientDirection.ltr,
                                                      gradientType:
                                                          GradientType.linear,
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final proceds = widget
                                                        .procedures!
                                                        .toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: proceds.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(height: 4.0),
                                                      itemBuilder: (context,
                                                          procedsIndex) {
                                                        final procedsItem =
                                                            proceds[
                                                                procedsIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            procedsItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
