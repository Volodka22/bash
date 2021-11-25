#include <iostream>
#include <csignal>
#include <fstream>

using namespace std;

int main() {
	ifstream in("./.pid");

	size_t pid;
	in >> pid;

	while(true) {
		string operation;
		cin >> operation;
		if (operation == "+") {
			kill(pid, SIGUSR1);
		} else if (operation == "*") {
			kill(pid, SIGUSR2);
		} else if (operation == "TERM") {
			kill(pid, SIGTERM);
		}
	}
}
