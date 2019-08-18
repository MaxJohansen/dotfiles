import { usePackage } from "vscode-use-package";

export function init() {
  usePackage("llvm-vs-code-extensions.vscode-clangd");
  usePackage("openningia.vscode-google-test-adapter");
}
