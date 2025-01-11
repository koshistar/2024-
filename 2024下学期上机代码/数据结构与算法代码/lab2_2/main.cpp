#include"haffmanTree.h"
int main()
{
	string str;
	//ע�ⲻҪ�ظ�
	cin >> str;
	vector<int> weight(str.size());
	for (int i = 0; i < str.size(); i++)
	{
		cout << str[i] << "'s weight is ";
		cin >> weight[i];
		cout << endl;
	}
	HFTree hfTree = BuildHaffmanTree(weight, str);
	string code;
	cout << "Input the string you want to code.\n";
	cin >> code;
	cout << BuildHaffmanCode(hfTree, code) << endl;
	cout << "Input the biostring you want to decode.\n";
	cin >> code;
	cout << DeHaffmanCode(hfTree, code) << endl;
	return 0;
}