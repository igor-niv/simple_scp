#define LIBSSH_STATIC 1

#include <iostream>
#include <libssh/libssh.h>

using namespace std;

int main() {
    ssh_session my_ssh_session = ssh_new();
    if (my_ssh_session == NULL)
        exit(-1);

    ssh_free(my_ssh_session);

    return 0;
}