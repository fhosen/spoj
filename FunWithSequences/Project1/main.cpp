#include <iostream>
#include <string>
using namespace std;


int* GetSequenceFromSTDIN(int size){

	int i = 0;
	int sequenceElement = 0;
	int* sequence = new int[size];

	
	while (size--){
		scanf("%d", &sequenceElement);
		sequence[i] = sequenceElement;
		i++;
	}

	return sequence;
}

int main() {

	int n = 0;
	int m = 0;

	scanf("%d", &n);
	int* S1 = GetSequenceFromSTDIN(n);
	scanf("%d", &m);
	int* S2 = GetSequenceFromSTDIN(m);

	int i = 0, j = 0;

	while (i < n && j < m)
	{
		while (S1[i] < S2[j])
		{
			printf("%d", S1[i]);
			cout << " ";
			i++;
		}

		if (S1[i] == S2[j])
		{
			j++;
			i++;
		}
		else
		{
			j++;
		}
	}

	if (i < n)
	{
		while (i < n)
		{
			printf("%d", S1[i]);
			cout << " ";
			i++;
		}
	}

	delete S1;
	delete S2;

	return 0;
}