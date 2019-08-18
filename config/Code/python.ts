import { usePackage } from "vscode-use-package";

export function init() {
  usePackage("ms-python.python", {
    scope: "python",
    config: {
      "formatting.provider": "black",
      "linting.mypyArgs": [
        "--ignore-missing-imports",
        "--follow-imports=silent",
        "--show-column-numbers",
        "--cache-dir=/dev/null"
      ],
      "linting.mypyEnabled": true,
      "linting.pylintEnabled": false,
    }
  });
}
