import { usePackage } from "vscode-use-package";

export function init() {
  usePackage("rust-lang.rust", {
    config: {
      clippy_preference: "on",
    },
    globalConfig: {
      "rust-client.channel": "nightly",
      "rust-client.updateOnStartup": true,
    },
  });

  usePackage("bungcip.better-toml");
  usePackage("swellaby.vscode-rust-test-adapter");
}
