import re
import shutil
import os
src = 'glpi-upgrade-template.sh'
dest = 'glpi-upgrade-template' + '-latest' + '.sh'
shutil.copy(src,dest)
filename = dest
previous_version = input("Please type the Previous Version:")
latest_version = input("Please type the Latest Version:")
version_glpi = input("Please type the GLPI version to download:")
with open(filename, 'r+') as f:
    text = f.read()
    text = re.sub('previous-version', previous_version, text)
    text = re.sub('latest-version', latest_version, text)
    text = re.sub('version-glpi', version_glpi, text)
    f.seek(0)
    f.write(text)
    f.truncate()
