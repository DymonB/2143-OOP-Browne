//////////////////////////////////////////////////////////////////////////////
//                   
// Author:           Dymon Browne
// Email:            dymon.browne@hotmail.com
// Label:            P01
// Title:            Array Based Stack Example
// Course:           2143
// Semester:         Fall 2020
//
// Description:
//       Implementation of an array based stack that holds integers.
//       Program read in 1000 random integers from a file 
//
// Usage:
//       
//
// Files:            
//       Input
//		 Output
/////////////////////////////////////////////////////////////////////////////////
#include <iostream>
#include <string>
#include <fstream> 
#include <ctime>
#include <time.h>

using namespace std;



/**
* Stack
*
* Description:
*      Integer array based stack implementation
*
* Public Methods:
*      - Stack()
*      - Stack(int)
*      - void Push()
*      - int Pop()
*      - bool empty()
*      - bool full()
*      - void Print()
*
* Private Methods:
*      - None
*
* Usage:
*
*  Stack S;
*  S.Push(80);
*  S.Push(90);
*  S.Print();
*  int x = S.Pop();
*
*/

class Stack {
private:
	int* S;       //array pointer
	int capacity; //max stack size
	int top;      //current top (index)
	int size;     //current num items
public:
	/**
	 * Stack:
	 *    Constructor.
	 * Params:
	 *    void
	 *
	 * Returns:
	 *     Void
	 */
	Stack() {
		capacity = 10;          // set array size
		S = new int[capacity];  // allocate new memory
		top = -1;               // initialize top of stack
		size = 0;               // set stack to empty
	}

	/**
	 * Stack:
	 *    Constructor.
	 * Params:
	 *    int : capacity
	 *
	 * Returns:
	 *     Void
	 */
	Stack(int cap) {
		capacity = cap;         // set array size     
		S = new int[capacity];  // allocate new memory
		top = -1;               // initialize top of stack
		size = 0;               // set stack to empty
	}

	/**
	 * Push:
	 *    Push item onto stack.
	 * Params:
	 *    int : data
	 *
	 * Returns:
	 *     Void
	 */
	 /*void Push(int data) {
		 top++;              // move top of stack up
		 size++;             // increment size
		 S[top] = data;      // add item to array
	 }*/

	 /**
	  * Pop:
	  *    remove item from stack.
	  * Params:
	  *    void
	  *
	  * Returns:
	  *     int
	  */
	  /*int Pop() {
		  int data = S[top];  // pull item from stack
		  top--;              // shrink the stack
		  size--;             // update our size
		  return data;        // send item back
	  }*/


	  //Adds to the top of the stack
	bool Push(int val)
	{
		if (!Full())
		{
			top++;
			S[top] = val;
			return true;
		}
		else
		{
			return false;
		}
	}

	//Removes the top of the stack and returns value
	int Pop()
	{
		ofstream fout;

		fout.open("output.txt");

		if (!Empty())
		{
			int temp = 0;
			temp = S[top];
			top--;
			return temp;
		}
		else
		{
			// should return a value that implies failuer, but good enough for now
			//fout << "Empty stack" << endl;
			fout << " ";
		}
		return 0;
		fout.close();
	}

	/**
	 * Empty:
	 *    is the stack empty?
	 * Params:
	 *    void
	 *
	 * Returns:
	 *     bool : true == stack is empty
	 */
	bool Empty() {
		if (top == 0)
			cout << "Error: Stack Empty";
		//return size == 0;
		return top == -1;
	}

	/**
	 * Full:
	 *    is the stack full?
	 * Params:
	 *    void
	 *
	 * Returns:
	 *     bool : true == stack is full
	 */

	bool Full()
	{
		

		int* S = new int[capacity];
		// assigning
		for (int i = 0;i < capacity;i++)
		{
			S[i] = i * 3;
		}

		if (capacity == size)
		{
			// Allocate new array twice as big
			int* S2 = new int[2 * capacity];

			// Copy data from S to S2
			for (int i = 0;i < capacity;i++)
			{
				S2[i] = S[i];
			}

			// Write out data in S
			for (int i = 0;i < capacity;i++)
			{
				cout << S[i] << " ";
			}
			cout << endl << endl;

			// Write out data in S2
			for (int i = 0;i < 2 * capacity;i++)
			{
				cout << S2[i] << " ";
			}
			cout << endl;

			// Delete old array
			delete[] S;

			// Point S to new array
			S = S2;

			return top == capacity - 1;
		}
	}

	/**
	 * Print:
	 *    Used so we can inspect our stack.
	 * Params:
	 *    void
	 *
	 * Returns:
	 *     void
	 */
	void Print() {
		for (int i = top; i >= 0; i--) {
			cout << S[i] << endl;
		}
	}

	/*
	* Will write random
	*    push int
	*    pop
	*
	*/
		void PopulateFile(string filename, int items) {
		//ofstream fout(filename,ofstream::out);

		ofstream fout;

		fout.open("output.txt");

		for (int i = 0;i < items;i++) {

			if (rand() % 2 == 0) {
				fout << "push " << rand() % 100;
			}
			else {
				fout << "pop";
			}
			fout << endl;
		}

		fout.close();
	}

};

int main()
{
	string sign = "";
	int num = 0;
	int large = 0;
	int curr_size = 0;


	Stack S;  // Instance of our stack default constructor

	ifstream fin;
	fin.open("input.txt");

	ofstream fout;
	fout.open("output1.txt");

	// Heading
	fout << "Dymon Browne " << endl;
	fout << "CMPS 2143 " << endl;
	fout << "Date: 15 Sept 2020" << endl;
	fout << "----------------------" << endl;
	fout << endl;

	while (!fin.eof())
	{
		fin >> sign; // read push or pop  

		if (sign == "push") //if command = push
		{
			S.Push(num);
			large++;
			curr_size++;

			int curr_size_push = curr_size * 2;
			fout << "+" << " : " << curr_size << " -> "
				<< curr_size_push << endl;
		}
		else if (sign == "pop") //if command = pop
		{
			S.Pop();
			curr_size--;

			int curr_size_pop = curr_size / 2;
			fout << "-" << " : " << curr_size << " -> "
				<< curr_size_pop << endl;
		}
	}
	fout << endl << "Start size : " << num << endl
		<< "Max size : " << large << endl
		<< "Ending size : " << curr_size;
	fin.close();
	fout.close();

}
