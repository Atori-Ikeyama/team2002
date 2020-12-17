import 'dart:math';
abstract class ICalculate {
  List<double> solarAzimuth(double angle);
}

class Calculate implements ICalculate {
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    // double rad = 1 / 2 * sqrt(Checkbox.width);
    double angle = atan(200);
    /*return Column(
      children: [Center(), FlatButton(onPressed: _calculate(), child: Center())],
    );*/
    _calculate(size);
  }

  void _calculate(size) {
    double width = size.width;
    double height = size.height;
    double tangent = tan(200);
    //[x,y]
    //連立方程式１を配列で表現
    List<List<double>> y1 = [
      [tangent, -1],
      [0, 1]
    ];
    List y2 = [0, width / 2];
    List y3 = [0, -width / 2];
//連立方程式２を配列で表現
    List<List<double>> y4 = [
      [tangent, -1],
      [0, 1]
    ];
    List y5 = [0, height / 2];
    List y6 = [0, -height / 2];

    List ans = [0,0];
    List ans2 = [0,0];
    List ans3 = [0,0];
    List ans4 = [0,0];
    //ヤコビで連立方程式の計算
    jacobi(y1, y2, ans);
    jacobi(y4, y5, ans2);
    jacobi2(y1, y3, ans3);
    jacobi2(y1, y6, ans4);


//絶対値を入れる
    double abs =  (ans[0] + ans[1]).abs();
    double abs2 =  (ans2[0] + ans2[1]).abs();
    double abs3 =  (ans3[0] + ans3[1]).abs();
    double abs4 =  (ans4[0] + ans4[1]).abs();


    if(abs > abs2){
      ans2[0] = ans2[0]/width;
      ans2[1] = ans2[1]/height;
    }else{
      ans[0] = ans2[0]/width;
      ans[1] = ans2[1]/height;
    }

    if(abs3 > abs4){
      ans4[0] = ans4[0]/width;
      ans4[1] = ans4[1]/height;
    }else{
      ans3[0] = ans3[0]/width;
      ans3[1] = ans3[1]/height;
    }

  }


  void jacobi(List<List<double>> a, List b , List x0){
    final int N = 2;

    while (true) {
      List<double> x1 = [0,0];
      bool finish = true;
      for (int i = 0; i < N; i++) {
        x1[i] = 0;
        for (int j = 0; j < N; j++)
          if (j != i)
            x1[i] += a[i][j] * x0[j];

        x1[i] = (b[i] - x1[i]) / a[i][i];
        if ((x1[i] - x0[i]).abs() > 0.0000000001)
          finish = false;
      }

      for (int i = 0; i < N; i++) {
        x0[i] = x1[i];
      }
      if (finish) return;
    }
  }
}