# Version check (run first in every stage skill)
1. Read the project's `.sdd-kit` (one line, e.g. `0.2.0`) and this plugin's version from
   `.claude-plugin/plugin.json` at the plugin root (two levels above this file).
2. Same version: continue.
3. Project older: show the owner the CHANGELOG.md entries (plugin root) newer than the project's
   version, with their migration notes. The owner chooses: adopt now (apply the migration notes,
   write the new version to `.sdd-kit`, commit "Adopt sdd-kit X.Y.Z: <what was taken>") or defer
   (continue under the installed plugin, and note the deferral in docs/kit-feedback.md).
4. No `.sdd-kit`: the project has not been set up; stop and point the owner to `/sdd-kit:setup`.
