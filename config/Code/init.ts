import { initUsePackage, usePackage, configSet } from "vscode-use-package";
import * as rust from './rust';
import * as fsharp from './fsharp';
import * as python from './python';
import * as webdev from './webdev';
import * as c from './c';

export function init(context: import("vscode").ExtensionContext) {
  initUsePackage(context);

  configSet("workbench", {
    startupEditor: "newUntitledFile"
  });

  configSet("editor", {
    fontFamily: "FuraCode Nerd Font, Fira Code Retina",
    fontLigatures: true,
    renderWhitespace: "boundary",
    renderIndentGuides: false,
    selectionHighlight: true,
    formatOnSave: true,
    quickSuggestions: { comments: false, strings: false },
    suggestSelection: "recentlyUsedByPrefix",
    "suggest.shareSuggestSelections": true,
    "suggest.localityBonus": true,
  });

  configSet("terminal.integrated", {
    "shell.windows": "C:\\Windows\\System32\\wsl.exe",
    "shell.linux": "/usr/bin/fish",
    commandsToSkipShell: [
      "workbench.action.togglePanel",
      "workbench.action.terminal.toggleTerminal",
      "workbench.action.showCommands",
    ],
  });

  configSet({
    "files.exclude": {
      "**/.DS_Store": true,
      "**/.git": true,
      "**/.hg": true,
      "**/.svn": true,
      "**/CVS": true,
      "**/__pycache__": true
    },
    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
  });

  usePackage("arcticicestudio.nord-visual-studio-code", {
    scope: "workbench",
    config: { colorTheme: "Nord" },
  });

  usePackage("pkief.material-icon-theme", {
    scope: "material-icon-theme",
    config: { showWelcomeMessage: false },
    init: () => configSet("workbench", { iconTheme: "material-icon-theme" }),
  });

  usePackage("eamodio.gitlens");
  usePackage("editorconfig.editorconfig");
  usePackage("davidanson.vscode-markdownlint");
  usePackage("richie5um2.vscode-sort-json");
  usePackage("coenraads.bracket-pair-colorizer-2");
  usePackage("ms-vscode-remote.remote-wsl");

  usePackage("oderwat.indent-rainbow", {
    scope: "indentRainbow",
    config: {
      "colors": [
        "rgba(83,55,95,0.3)",
        "rgba(129,68,102,0.3)",
        "rgba(178,76,100,0.3)",
        "rgba(244,114,116,0.3)",
        "rgba(248,44,26,0.3)"
      ],
    },
  });

  usePackage("hbenl.vscode-test-explorer", {
    scope: "testExplorer",
    config: {
      mergeSuites: true,
      addToEditorContextMenu: true,
      showExpandButton: 0,
      showCollapseButton: false,
      sort: "byLocation",
    },
  });

  usePackage("james-yu.latex-workshop");

  c.init();
  rust.init();
  webdev.init();
  fsharp.init();
  python.init();
}
