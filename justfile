protocols-fetch:
    echo "Note: Ensure you have run pipenv shell."
    pipenv install
    python awoo-mixins/update_protocols.py > protocols.yaml

protocols-generated-clean:
    rm -rf lib/protocols

protocols-gen:
    dart --enable-asserts bin/scanner.dart scan --format=true --prefix=wl --pkg=client --protocols=protocols.yaml --clean=true

protocols: && protocols-generated-clean protocols-fetch protocols-gen
    echo "Protocols generated successfully."

shared:
    gcc -shared -o libsocket_operations.so -fPIC src/socket.c
