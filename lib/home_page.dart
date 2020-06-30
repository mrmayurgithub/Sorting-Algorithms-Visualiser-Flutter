import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:triedSortingVisualiser/bar_painter.dart';
import 'constants.dart';
import 'sorting_algo/bubble_sort.dart';
import 'sorting_algo/heap_sort.dart';
import 'sorting_algo/insertion_sort.dart';
import 'sorting_algo/merge_sort.dart';
import 'sorting_algo/pigeonhole_sort.dart';
import 'sorting_algo/quick_sort.dart';
import 'sorting_algo/selection_sort.dart';
import 'time_complexities.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream _stream;

  _changeSpeed() {
    if (speed >= 3) {
      speed = 0;
      duration = 1500;
    } else {
      speed++;
      duration = duration ~/ 2;
    }
  }

  _checkAndResetIfSorted() async {
    if (isSorted) {
      _randomise();
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  _sort() async {
    setState(() {
      isSorting = true;
    });

    await _checkAndResetIfSorted();

    Stopwatch stopwatch = new Stopwatch()..start();

    switch (currentSortAlgo) {
      case "bubble":
        await bubbleSort();
        break;
      case "selection":
        await selectionSort();
        break;
      case "heap":
        await heapSort();
        break;
      case "insertion":
        await insertionSort();
        break;
      case "quick":
        await quickSort(0, sampleSize.toInt() - 1);
        break;
      case "merge":
        await mergeSort(0, sampleSize.toInt() - 1);
        break;
      case "pigeonhole":
        await pigeonHole();
        break;
    }

    stopwatch.stop();

    // _scaffoldKey.currentState.removeCurrentSnackBar();
    // _scaffoldKey.currentState.showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       "Sorting completed in ${stopwatch.elapsed.inMilliseconds} ms.",
    //     ),
    //   ),
    // );
    setState(() {
      isSorting = false;
      isSorted = true;
    });
  }

  _setSortAlgo(String type) {
    setState(() {
      currentSortAlgo = type;
    });
  }

  _makeColors() {
    colors[0] = Colors.red;
    colors[1] = Colors.blue;
    colors[2] = Colors.green;
  }

  _ChangeButtonColor() {
    if (c == 3) c = 0;
    sort_color = colors[c++];
  }

  _randomise() {
    numbers = [];
    for (int i = 0; i < sampleSize; i++) {
      numbers.add(Random().nextInt(sampleSize));
    }
    isSorted = false;
    //setState(() {});
    streamController.add(numbers);
  }

  @override
  void initState() {
    super.initState();
    _randomise();
    _makeColors();
    streamController = StreamController<List<int>>();
    _stream = streamController.stream;
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          currentSortAlgo.toUpperCase() + ' SORT',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            initialValue: currentSortAlgo,
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: 'bubble',
                  child: Text("Bubble Sort"),
                ),
                PopupMenuItem(
                  value: 'merge',
                  child: Text("Merge Sort"),
                ),
                PopupMenuItem(
                  value: 'selection',
                  child: Text("Selection Sort"),
                ),
                PopupMenuItem(
                  value: 'heap',
                  child: Text("Heap Sort"),
                ),
                PopupMenuItem(
                  value: 'quick',
                  child: Text("Quick Sort"),
                ),
                PopupMenuItem(
                  value: 'pigeonhole',
                  child: Text("PigeonHole Sort"),
                ),
              ];
            },
            onSelected: (String value) {
              _randomise();
              _setSortAlgo(value);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Card(
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Best time complexity',
                                      style: comptext(),
                                    ),
                                    TextSpan(
                                        text: ' - ${bestTime(currentSortAlgo)}',
                                        style: TextStyle(
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(height: 8),
                        Card(
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Average time complexity',
                                        style: comptext()),
                                    TextSpan(
                                        text:
                                            ' - ${averageTime(currentSortAlgo)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(height: 8),
                        Card(
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Worst time complexity',
                                        style: comptext()),
                                    TextSpan(
                                        text:
                                            ' - ${worstTime(currentSortAlgo)}',
                                        style: TextStyle(
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    IconButton(
                      icon: Icon(
                        Icons.format_color_fill,
                        color: sort_color,
                        size: 30,
                      ),
                      onPressed: () => {
                        _ChangeButtonColor(),
                        setState(() {}),
                      },
                    ),
                  ],
                ),
                StreamBuilder<Object>(
                    initialData: numbers,
                    stream: streamController.stream,
                    builder: (context, snapshot) {
                      List<int> numbers = snapshot.data;
                      int counter = 0;
                      return Row(
                        children: numbers.map((int num) {
                          counter++;
                          return Container(
                            child: CustomPaint(
                              painter: BarPainter(
                                sort_color: sort_color,
                                index: counter,
                                value: num,
                                width: MediaQuery.of(context).size.width /
                                    sampleSize,
                                samplesize: sampleSize,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    onPressed: isSorting
                        ? null
                        : () {
                            _randomise();
                          },
                    child: Text(
                      "RESET",
                      style: bottomBartext(),
                    ))),
            Expanded(
                child: FlatButton(
                    onPressed: () => isSorted ? null : _sort(),
                    child: Text(
                      "SORT",
                      style: bottomBartext(),
                    ))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 0),
                child: TextFormField(
                  initialValue: '${sampleSize}',
                  style: bottomBartext(),
                  onChanged: (value) {
                    sampleSize = int.parse(value);
                    _randomise();
                    if (sampleSize < 80)
                      duration = sampleSize * 120;
                    else if (sampleSize > 500) duration = sampleSize ~/ 1000;
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => {
                  _changeSpeed(),
                  setState(() {
                    if (speed == 1) {
                      speed++;
                    } else if (speed == 2) {
                      speed = 4;
                    } else if (speed == 4) {
                      speed = 1;
                    }
                  })
                },
                child: Text(
                  '${speed + 1}x',
                  style: bottomBartext(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
