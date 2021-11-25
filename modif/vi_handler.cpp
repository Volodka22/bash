#include <iostream>
#include <csignal>
#include <fstream>
#include <unistd.h>

using namespace std;

size_t ans = 1;

void signalHandler(int signum) {
	if (signum == SIGUSR1) {
		ans += 2;
		cout << ans << endl;
	} else if (signum == SIGUSR2) {
		ans *= 2;
		cout << ans << endl;
	} else if (signum == SIGTERM){
		cout << "Stopped by SIGTERM" << endl;
		exit(0);
	}
}

int main() {
	ofstream out(".pid");
	out << ::getpid() << endl;
	cout << ::getpid() << endl;
	signal(SIGUSR1, signalHandler);
	signal(SIGUSR2, signalHandler);
	signal(SIGTERM, signalHandler);
	while(true) {
		sleep(1);
	}
	return 0;
}
