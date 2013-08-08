"""Setup all dotfiles in $HOME."""

import os
import sys
import glob

# Destination directory is ~/ unless provided. 
DEST = os.path.expanduser('~') if len(sys.argv) <= 1 else sys.argv[1]

# Make symbolic links in destination directory
# to all the .* entries here.
for fname in glob.glob('.*'):
    
    # Skip some files.
    if fname in ('.git', '.gitmodules'):
        continue

    link = os.path.join(DEST, fname)
    source = os.path.relpath(fname, DEST)

    if os.path.exists(link):
        print('{} exists, skipping.'.format(link))
        continue

    print('Linking {} --> {}'.format(link, source))
    os.symlink(source, link)
