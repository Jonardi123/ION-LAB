# ION LAB v4.2 · Simple Training Studio

A local-first desktop viewer for your Ion training runs. **v4.2** keeps the simple one-screen interface and advanced research tools, fixes scientific notation on training steps, and adds a training progress bar.

## Install on Gentoo / Linux

Download `ion-lab-v4.2.zip`, save it to `~/Downloads`, then run:

```bash
cd ~/Downloads && unzip -o ion-lab-v4.2.zip && bash ion-lab/START-ION-LAB.sh
```

The launcher creates a Python virtual environment, installs dependencies (PySide6 and psutil) if required, installs an optional KDE app shortcut and starts ION LAB. **Do not use sudo.** A graphical desktop, Python 3 with venv, and internet access for the first install are required.

For subsequent launches, open ION LAB from your application menu or run `bash ~/Downloads/ion-lab/START-ION-LAB.sh`.

## Features

- **Simple dashboard** with readable whole-number steps (`2,000`, not `2e+03`), training and validation loss, throughput and loss graph.
- **Training progress** with planned steps detected from trainer configurations or set manually per run. Unknown targets are never guessed.
- **Experiment Doctor** with heuristic diagnostics for unstable loss, potential overfitting and throughput changes.
- **Advanced research studio** with run comparison, model arena, datasets, checkpoint inspection, hardware monitoring and training controls.
- **Research exports** including standalone HTML reports.
- **ChatGPT handoff** using your existing browser session: copies a research brief for you to review and paste. Your ChatGPT subscription is not an API key.
- **Local-first, read-only inspection:** checkpoints are not deserialized just for display and opening a project never starts training.

First launch uses **explicitly fictional demo data** with a `2,000 / 10,000`-step example, not real Ion results.

## Supported inputs

Training logs: `metrics.jsonl`, `train_metrics.jsonl`, `training_log.jsonl`, `metrics.csv`, `metrics.json` and Hugging Face `trainer_state.json` (`log_history`). Standard field names such as `step`, `global_step`, `loss`, `eval_loss`, and `tokens_per_second` are supported.

Planned-step configurations: `training_args.json`, `training_config.json`, `train_config.json`, `trainer_state.json`, and `config.json`. Missing measurements display as missing rather than fabricated zeroes.

## Test

From the extracted `ion-lab` folder:

```bash
python3 -m unittest discover -s tests -v
python3 -m compileall -q ion_lab.py ion_advanced.py ion_simple.py ion_core.py ion_extras.py ion_doctor.py ion_premium.py
QT_QPA_PLATFORM=offscreen .venv/bin/python -m unittest discover -s tests -p test_gui_smoke.py -v
```

v4.2 passed the data-handling and packaging tests during release preparation. The GUI smoke test requires PySide6 and must still be run on a Linux desktop to verify GUI compatibility.

## Release notes

- Fixed scientific notation in steps on the dashboard, advanced tables, and HTML reports.
- Added `current / planned` steps, percent complete, progress bar, and steps remaining.
- Automatic target detection plus per-run manual overrides with honest handling of unknown targets.
- Retained the complete v4.1 experience.

The v4.2 source, tests, launch scripts, icon and synthetic demo are distributed in the release package.
