# screenshot-sync-tool
Linux script file that captures screenshot on given interval and synchronize to specified remote server

# Instruction of how to setup FTP syncing local folder to remote folder

First extract the files given to your prefered location then install the following:

# Install scrot
$ apt-get update
$ apt-get install scrot
To learn more about scrot <a href="https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/">Click Here</a>

# Install JQ
<a href="http://xmodulo.com/how-to-parse-json-string-via-command-line-on-linux.html">Installation Guide</a>

# Install LFTP
$ apt-get install lftp

# Finally, install curl
$ apt-get install curl

After you installed dependencies, edit the variables inside start.sh file based on your credentials.

HOST=’sftp://host.com’
USER='SomeUser'
PASS='SomePassword'
SOURCEFOLDER=’path/to/your/SyncTool-folder/captured’
TARGETFOLDER=’path/to/your/target/folder’
SITE=’https://site.host.com’

Note: There must be folder named "captured" beside with start.sh file, this folder use to stored all the screenshot captured by scrot.