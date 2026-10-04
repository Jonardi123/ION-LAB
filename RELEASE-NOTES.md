# ION LAB v4.2 · Release notes

**Visible fix:** `2e+03` is now displayed as `2,000`.

**Training progress:** the synthetic demo displays `2,000 / 10,000 steps`, a 20% progress bar and 8,000 steps remaining. Real runs use configured training budgets or your explicit manual target. Unknown targets are not guessed.

**Preserved from v4.1:** simple dashboard, loss plot, Experiment Doctor, ChatGPT handoff, HTML report, nested-run discovery, app shortcut and full Advanced research workspace.

**Verification:** unit tests, Python syntax compilation, shell syntax checks, export checks and ZIP integrity checks. The Qt smoke test is included but must be run on a machine with PySide6 installed. No claim of verified Gentoo GUI compatibility is made until that test passes there.
