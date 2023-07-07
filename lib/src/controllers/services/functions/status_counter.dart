// String statusCounter(double value) {
//   List<double> counterDividerList = [
//     10,
//     100,
//     1000,
//     10000,
//     100000,
//     1000000,
//   ];

//   if (value < counterDividerList[0]) return value.toInt().toString();

//   for (int i = counterDividerList.length - 1; i >= 0; i--) {
//     double dV = counterDividerList[i];
//     String s = "";
//     double res = 0;

//     if (value >= counterDividerList[i]) {
//       return "${value % dV}";
//     }
//   }
// }
