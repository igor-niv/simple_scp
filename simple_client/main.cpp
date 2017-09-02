#define LIBSSH_STATIC 1

#include <iostream>
#include <libssh/libssh.h>

using namespace std;

int main() {

    ssh_session my_ssh_session;
    int verbosity = SSH_LOG_PROTOCOL;
    int port = 22;
    unsigned char* hash = nullptr;

    my_ssh_session = ssh_new();
    if (my_ssh_session == NULL)
        exit(-1);

    ssh_options_set(my_ssh_session, SSH_OPTIONS_HOST, "localhost");
    ssh_options_set(my_ssh_session, SSH_OPTIONS_USER, "macuser");
    ssh_options_set(my_ssh_session, SSH_OPTIONS_LOG_VERBOSITY, &verbosity);
    ssh_options_set(my_ssh_session, SSH_OPTIONS_PORT, &port);

    int rc = ssh_connect(my_ssh_session);
    if (rc != SSH_OK) {
        fprintf(stderr, "Error connecting to localhost: %s\n",
                ssh_get_error(my_ssh_session));
        exit(-1);
    }

    cout << "Successfully connected to localhost" << endl;
    int hlen = ssh_get_pubkey_hash(my_ssh_session, &hash);

    if (hlen < 0)
        return 0;

    ssh_print_hexa("Public key hash", hash, hlen);

    ssh_disconnect(my_ssh_session);
    ssh_free(my_ssh_session);

    return 0;
}