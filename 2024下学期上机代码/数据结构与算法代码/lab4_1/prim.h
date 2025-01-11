#pragma once
#define n 11
#define m 7
#include<iostream>
using namespace std;
typedef char VexType;
typedef int EdgeType;
EdgeType graph[m][m];
VexType vextexs[m];
void CreateGraph()
{
	cout << "输入各顶点(m="<<m<<"):\n";
	for (int i = 0; i < m; i++)
	{
		cin >> vextexs[i];
	}
	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < m; j++)
		{
			if (i != j)
			{
				graph[i][j] = INT_MAX;
			}
			else
			{
				graph[i][j] = 0;
			}
		}
	}
	cout << "依次输入(vi,vj)的下标i,j和权值w(n=" << n << "):\n";
	for (int i = 0; i < n; i++)
	{
		int v1, v2;
		cin >> v1 >> v2;
		cin >> graph[v1][v2];
		graph[v2][v1] = graph[v1][v2];
	}
}
void prim()
{
	int min;
	int vi[m];
	int lowcost[m];
	lowcost[0] = 0;
	for (int i = 0; i < m; i++)
	{
		lowcost[i] = graph[i][0];
		vi[i] = 0;
	}
	for (int i = 0; i < m; i++)
	{
		min = INT_MAX;
		int j = 1;
		int k = 0;
		while (j < m)
		{
			if (lowcost[j] != 0 && lowcost[j] < min)
			{
				min = lowcost[j];
				k = j;
			}
			++j;
		}
		cout << "(" << vextexs[k] << "," << k << ")\n";
		lowcost[k] = 0;
		for (int i = 1; i < m; i++)
		{
			if (lowcost[i] != 0 && graph[k][i] < lowcost[i])
			{
				lowcost[i] = graph[k][i];
				vi[i] = k;
			}
		}
	}
	for (int i = 0; i < m; i++)
	{
		cout << vi[i] << " ";
	}
}