#include <iostream>
#include <string>
#include <algorithm>
#include <math.h>
using namespace std;

int GetNumberFromSTDIN(){
	int m = 0;
	scanf("%d", &m);

	return m;
}

int resolve(int g, int b){

	if (g == 0) return b;
	if (b == 0) return g;
	if (b == g) return 1;

	float upper = max(b, g);
	float lower = min(b, g) + 1;

	float res = upper / lower;
	if (floor(res) == res){
		return res;
	}
	else {
		return ceil(res);
	}

	return 0;
}

int main() {

	int girls = GetNumberFromSTDIN();
	int boys = GetNumberFromSTDIN();

	while (girls != -1){
		cout << resolve(girls, boys) << endl;
		girls = GetNumberFromSTDIN();
		boys = GetNumberFromSTDIN();
	}

	return 0;
}

