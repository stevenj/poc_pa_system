# Web UI Contract

This is a standard WEB UI Distribution Contract.  We should be able to use the same base contract for all Web based UI's.

The State of the Web UI is just a .tar.xz which is statically served at the path:

```http
http://<node>:50509/contract/web/<CONTRACT KEY>
```

The contract should be simple with the following behaviour:

1. The Parameter is a ED25519 public key.
2. A Second parameter could be a file which must exist inside the tar.xz (So we can;t over-write with a different kind of app signed with the same key)  eg `.myappname` or something.
3. The State is a .tar.xz + Signature with the ED25519 public Key.
4. Sync just reports the current Hash of the State and timestamp (which we can extract from the known files timestamp (`.myappname`) inside the .tar.xz)
5. Any write must be the whole archive and it must be properly signed by the key.
6. It must be later than the current archive.

This will allow us to securely update the app without changing the key.
