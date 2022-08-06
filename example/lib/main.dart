import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stroke_order_animator/strokeOrderAnimationController.dart';
import 'package:stroke_order_animator/strokeOrderAnimator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/scribble.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController;
  int _selectedIndex = 0;

  List<StrokeOrderAnimationController> _strokeOrderAnimationControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _strokeOrderAnimationControllers = [
      StrokeOrderAnimationController(
        "{'strokes': ['M660,689C637,689 616,679 597,668C570,655 542,648 514,639C464,626 414,615 363,609C319,606 273,607 231,622C211,630 195,646 174,652C167,652 162,643 167,637C181,607 209,587 239,575C284,557 335,556 384,560C462,568 538,593 615,610C639,616 665,619 686,633C695,639 705,646 709,656C712,666 706,676 697,679C685,685 672,689 660,689Z','M334,772C328,770 318,766 320,757C325,746 337,742 346,735C356,729 369,722 369,708C370,687 365,667 363,646C347,530 335,412 345,294C349,258 354,221 366,185C376,158 389,132 410,112C422,103 441,105 449,119C459,136 457,157 448,174C439,190 424,201 415,218C402,245 399,276 396,305C388,397 397,489 415,579C422,613 429,648 447,677C454,692 462,708 459,725C455,740 441,748 427,753C398,764 366,770 334,772Z', 'M559,469C556,469 552,465 555,462C565,445 581,429 580,408C580,388 567,371 558,355C517,288 461,230 402,179C361,146 315,120 264,108C249,105 232,105 220,116C207,129 208,149 210,166C216,210 244,247 278,275C306,298 337,320 372,335C372,348 372,360 373,373C326,357 282,332 241,304C201,275 165,237 151,188C139,151 143,107 168,76C183,57 206,44 230,43C278,40 324,59 364,83C440,130 506,192 558,264C581,298 602,333 619,370C626,386 632,403 629,419C625,433 615,444 604,453C591,463 575,469 559,469M602,416C565,415 528,411 492,406C447,399 405,385 363,369C363,357 363,344 363,332C414,352 467,370 523,376C563,382 604,385 644,381C689,376 736,363 769,331C793,309 806,278 807,246C808,225 806,203 800,183C776,126 725,83 671,54C627,29 580,10 531,-2C521,-6 509,-9 501,-17C498,-21 497,-25 498,-30C549,-27 600,-18 650,-6C715,11 780,39 830,86C861,116 887,155 891,199C899,269 861,343 796,374C736,404 668,416 602,416Z'], 'medians':[[[174,642],[251,592],[440,594],[697,659]],[[331,763],[420,715],[373,512],[367,268],[409,172],[431,123]],[[570,460],[610,416],[460,173],[200,64],[181,218],[342,344],[466,386],[641,401],[754,380],[838,294],[845,137],[703,31],[508,-22]]]}",
        this,
        onQuizCompleteCallback: (summary) {
          Fluttertoast.showToast(
              msg: [
            "Quiz finished. ",
            summary.nTotalMistakes.toString(),
            " mistakes"
          ].join());
        },
      ),
      StrokeOrderAnimationController(
        "{'strokes': ['M 272 567 Q 306 613 342 669 Q 370 718 395 743 Q 405 753 400 769 Q 396 782 365 808 Q 337 827 316 828 Q 297 827 305 802 Q 318 769 306 741 Q 267 647 207 560 Q 150 476 72 385 Q 60 375 58 367 Q 54 355 70 358 Q 82 359 109 384 Q 155 421 213 493 Q 226 509 241 527 L 272 567 Z', 'M 241 527 Q 262 506 258 375 Q 258 374 258 370 Q 254 253 221 135 Q 215 114 224 80 Q 236 44 248 32 Q 267 16 279 44 Q 294 86 294 134 Q 303 420 314 485 Q 321 515 295 543 Q 289 549 272 567 C 272 567 241 527 241 527 Z', 'M 521 560 Q 561 621 602 708 Q 620 751 638 773 Q 645 786 639 799 Q 633 811 602 830 Q 572 846 554 843 Q 535 839 546 817 Q 561 795 552 757 Q 513 619 407 448 Q 398 436 397 430 Q 394 418 409 423 Q 439 432 503 532 L 521 560 Z', 'M 503 532 Q 527 510 555 520 Q 795 608 782 549 Q 783 543 743 468 Q 736 458 741 453 Q 745 447 756 459 Q 852 532 894 549 Q 904 552 905 561 Q 906 574 876 592 Q 852 605 828 621 Q 800 637 783 630 Q 686 590 521 560 C 521 560 503 532 503 532 Z', 'M 568 72 Q 531 81 494 91 Q 482 94 483 86 Q 484 79 494 71 Q 569 7 596 -33 Q 611 -49 626 -36 Q 659 -3 661 82 Q 655 149 655 345 Q 656 382 667 407 Q 676 426 659 439 Q 634 461 604 470 Q 585 477 577 469 Q 571 462 582 447 Q 619 384 603 127 Q 597 82 589 74 Q 582 67 568 72 Z', 'M 444 320 Q 419 262 385 208 Q 364 180 381 144 Q 388 128 409 139 Q 460 181 468 264 Q 472 295 467 319 Q 463 328 456 328 Q 449 327 444 320 Z', 'M 738 307 Q 789 249 847 168 Q 860 146 876 139 Q 885 138 893 146 Q 908 159 900 204 Q 891 264 743 338 Q 734 345 731 332 Q 728 319 738 307 Z'], 'medians': [[[317, 812], [342, 786], [353, 759], [303, 663], [249, 577], [181, 485], [93, 386], [68, 367]], [[273, 558], [274, 525], [285, 495], [284, 441], [273, 243], [256, 123], [260, 41]], [[556, 828], [574, 817], [595, 783], [584, 746], [539, 640], [481, 531], [428, 453], [406, 431]], [[513, 532], [704, 585], [796, 597], [813, 585], [827, 563], [798, 519], [746, 460]], [[586, 463], [615, 438], [632, 412], [627, 73], [616, 41], [604, 30], [558, 47], [490, 85]], [[455, 316], [437, 243], [397, 151]], [[742, 326], [812, 265], [856, 216], [871, 190], [878, 154]]]}",
        this,
        onQuizCompleteCallback: (summary) {
          Fluttertoast.showToast(
              msg: [
            "Quiz finished.",
            summary.nTotalMistakes.toString(),
            " mistakes"
          ].join());
        },
      ),
      StrokeOrderAnimationController(
        "{'strokes': ['M 851.5396 553.552 C 658.0807 658.9621 582.6078 671.3805 504.571 666.3673 C 435.3243 661.9187 370.7316 642.8243 315.1094 599.6983 C 261.985 558.5088 227.4893 503.989 204.6641 441.4038 C 193.2748 410.175 188.8614 378.4128 196.2592 345.7252 C 202.1931 319.5054 216.5153 299.578 242.5345 289.999 C 262.2808 282.7294 282.0912 286.1443 301.3605 292.1379 C 328.9132 300.7081 351.2943 317.8282 372.7433 336.5537 C 429.3686 385.9892 458.0905 449.6918 469.7883 522.5957 C 473.9487 548.5245 477.96 574.3897 478.0397 600.695 C 478.0647 608.9234 477.3683 617.153 477.0477 625.3838 C 476.8966 629.2639 476.9425 633.4877 481.9125 634.0847 C 487.4278 634.7471 488.355 630.4487 488.7016 626.2368 C 490.5672 603.5701 492.0294 580.9371 489.9362 558.1483 C 487.196 528.317 486.8602 498.2386 481.0305 468.7322 C 469.8345 412.0636 441.4791 365.1595 399.3725 326.1503 C 378.374 306.6966 355.9351 289.2106 330.0325 276.7226 C 307.3225 265.7738 282.9527 260.2568 258.0113 262.369 C 223.075 265.3277 197.8443 284.6883 180.3917 314.6094 C 168.8797 334.3456 164.9747 356.0195 163.7063 378.5024 C 161.4654 418.223 174.1656 454.4797 189.9855 489.7242 C 208.4124 530.7768 232.328 568.5777 263.2969 601.4506 C 290.8766 630.7261 323.9718 652.4518 359.9765 670.0891 C 399.9974 689.6937 442.5722 699.7562 486.4926 704.9698 C 583.5713 716.4938 676.2531 699.762 764.832 659.781 C 810.4377 639.1965 852.5137 612.8573 886.6272 575.3258 C 925.8298 532.1954 948.4245 482.489 947.1105 423.2941 C 946.2814 385.9422 932.6299 352.8213 913.748 321.2535 C 891.4993 284.0565 862.0676 253.2778 829.1286 225.7397 C 791.1331 193.9741 750.6042 165.5895 709.0898 138.6189 C 705.7381 136.4414 702.2157 134.367 697.9306 134.9891 C 691.6052 135.9073 687.2609 139.4487 685.7172 145.6153 C 684.0837 152.1403 686.4304 157.4382 692.1567 161.0525 C 747.3077 195.8618 794.668 239.9316 839.7468 286.504 C 862.9763 310.5031 882.5566 337.6826 895.5307 368.6069 C 919.0267 424.6111 909.5598 477.0904 875.5826 526.1237 C 868.7228 536.0235 860.4229 544.7021 851.5396 553.552 z'],'medians':[[[740,496],[540,461],[468,295],[337,128],[202,109],[125,249],[132,409],[193,516],[330,636],[480,693],[655,701],[794,634],[888,454],[858,232],[706,96],[577,36]]]}",
        this,
        onQuizCompleteCallback: (summary) {
          Fluttertoast.showToast(
              msg: [
            "Quiz finished. ",
            summary.nTotalMistakes.toString(),
            " mistakes"
          ].join());
        },
      ),
    ];
    for (StrokeOrderAnimationController i in _strokeOrderAnimationControllers) {
      i.setStrokeAnimationSpeed(2);
      i.setHintAnimationSpeed(3);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _strokeOrderAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Animator"),
      ),
      body: ChangeNotifierProvider<StrokeOrderAnimationController>.value(
        value: _strokeOrderAnimationControllers[_selectedIndex],
        child: Consumer<StrokeOrderAnimationController>(
            builder: (context, controller, child) {
          return Center(
            child: SizedBox(
              width: 500,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          onPressed: () {
                            if (!controller.isQuizzing)
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                          },
                          child: Text("Previous character")),
                      Spacer(),
                      MaterialButton(
                          onPressed: () {
                            if (!controller.isQuizzing)
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                          },
                          child: Text("Next character")),
                    ],
                  ),
                  Expanded(
                    // displays the character
                    child: PageView(
                      physics: controller.isQuizzing
                          ? NeverScrollableScrollPhysics()
                          : ScrollPhysics(),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        _strokeOrderAnimationControllers.length,
                        (index) => FittedBox(
                          child: StrokeOrderAnimator(
                            _strokeOrderAnimationControllers[index],
                            key: UniqueKey(),
                          ),
                        ),
                      ),
                      onPageChanged: (index) => {
                        setState(() {
                          _strokeOrderAnimationControllers[_selectedIndex]
                              .stopAnimation();
                          _selectedIndex = index;
                        })
                      },
                    ),
                  ),
                  Flexible(
                    // displays the menu
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                      ),
                      primary: false,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: !controller.isQuizzing
                              ? () {
                                  if (!controller.isAnimating) {
                                    controller.startAnimation();
                                  } else {
                                    controller.stopAnimation();
                                  }
                                }
                              : null,
                          child: controller.isAnimating
                              ? Text("Stop animation")
                              : Text("Start animation"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (!controller.isQuizzing) {
                              controller.startQuiz();
                            } else {
                              controller.stopQuiz();
                            }
                          },
                          child: controller.isQuizzing
                              ? Text("Stop quiz")
                              : Text("Start quiz"),
                        ),
                        MaterialButton(
                          onPressed: !controller.isQuizzing
                              ? () {
                                  controller.showFullCharacter();
                                }
                              : null,
                          child: Text("Show full character"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.reset();
                          },
                          child: Text("Reset"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.setShowOutline(!controller.showOutline);
                          },
                          child: controller.showOutline
                              ? Text("Hide outline")
                              : Text("Show Outline"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.setShowMedian(!controller.showMedian);
                          },
                          child: controller.showMedian
                              ? Text("Hide medians")
                              : Text("Show medians"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
