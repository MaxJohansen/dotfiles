import { usePackage } from "vscode-use-package";

export function init() {
  usePackage("formulahendry.dotnet-test-explorer");
  usePackage("ionide.ionide-fsharp", {
    scope: "FSharp",
    config: {
      fsacRuntime: "netcore"
    }
  });
}
