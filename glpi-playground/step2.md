# Upgrade Glpi-9.1.6 -> 9.2.1

## Schema

![schema](https://github.com/vijaidjearam/katacoda-scenarios/blob/main/glpi-playground/Assets/images/glpi-916to921.gif?raw=true)
Lets take the scenario of upgrading version 9.1.6 -> 9.2.1:
We need to download 3 files :
1. glpi-upgrade.sh
```
#!/bin/bash
python3 glpi-upgrade-template.py
./glpi-upgrade-template-latest.sh
```
```curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/glpi-upgrade.sh -o glpi-upgrade.sh``` {{execute}}
2. upgrade.py
3. glpi-upgrade-template.sh




