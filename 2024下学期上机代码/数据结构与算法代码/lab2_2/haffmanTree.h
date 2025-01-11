#pragma once
#include<iostream>
#include<queue>
#include<vector>
#include<string>
using namespace std;
typedef char Type;
//�����������
typedef struct Node
{
	int weight;//Ȩ��
	Type val;//ֵ
	struct Node* left;
	struct Node* right;

}HFNode, * HFTree;
//�Զ���ȽϷ���
struct cmp
{
	bool operator()(HFTree a, HFTree b)
	{
		return a->weight > b->weight;
	}
};
//�߼����ݽṹС����ʵ��������
priority_queue<HFTree, vector<HFTree>, cmp> q;
HFTree BuildHaffmanTree(vector<int> nums, string str)//Type Ϊcharʱ����string
{
	for (int i = 0; i < nums.size(); i++)
	{
		HFTree newNode = new HFNode;
		newNode->weight = nums[i];
		newNode->val = str[i];
		newNode->left = NULL;
		newNode->right = NULL;
		q.push(newNode);
	}
	//�������н���������1
	while (q.size() > 1)
	{
		HFTree newNode = new HFNode;
		newNode->val = '#';//�½���ֵ
		newNode->left = q.top();
		newNode->weight = q.top()->weight;
		q.pop();
		newNode->right = q.top();
		newNode->weight += q.top()->weight;//newNode��ȨֵΪ������С�ӽ��ĺ�
		q.pop();
		q.push(newNode);
	}
	return q.top();//ʣ�����һ����Ȩֵ���ĸ����
}
//����
//������ȱ���
string HaffmanCode(HFTree root, Type c, string code)
{
	if (root->left == NULL && root->right == NULL)
	{
		if (root->val == c)
		{
			return code;
		}
		else
		{
			return "\0";
		}
	}
	if (root->left != NULL)
	{
		string tmp = HaffmanCode(root->left, c, code + '0');
		if (tmp != "\0")
		{
			return tmp;
		}
	}
	if (root->right != NULL)
	{
		string tmp = HaffmanCode(root->right, c, code + '1');
		if (tmp != "\0")
		{
			return tmp;
		}
	}
	return "\0";
}
string BuildHaffmanCode(HFTree root, string str)
{
	string code;
	for (int i = 0; i < str.size(); i++)
	{
		code += HaffmanCode(root, str[i], "");
	}
	return code;
}
//����
string DeHaffmanCode(HFTree root, string code)
{
	string str;
	for (int i = 0; i < code.size();)
	{
		HFTree tmp = root;
		while (tmp->left != NULL && tmp->right != NULL)
		{
			if (code[i] == '0')
			{
				tmp = tmp->left;
			}
			if (code[i] == '1')
			{
				tmp = tmp->right;
			}
			++i;
		}
		str += tmp->val;
	}
	return str;
}