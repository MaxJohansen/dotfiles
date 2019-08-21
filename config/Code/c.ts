import { usePackage } from "vscode-use-package";

export function init() {
  usePackage("ms-vscode.cpptools");
  usePackage("llvm-vs-code-extensions.vscode-clangd");
  usePackage("openningia.vscode-google-test-adapter");
}
