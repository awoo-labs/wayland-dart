# Awoo-Mixins

These are utilities, files and scripts "mixed into" Dart-Wayland to keep it updated and ensure everything is imported properly.

## Mixins

- `import-map.yaml` - Provides a map of unstable/staging/stable required imports to their Dart bindings as many times unstable/staging protocols do NOT specify proper imports.

- `update_protocols.py` - Please use `pipenv` to install and manage a venv to use the `Pipfile` and avoid system package conflicts. This automatically updates the `protocols.yaml` file with new Wayland protos to keep this project robust and updated.