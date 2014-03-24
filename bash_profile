if [ -e ~/.bashrc ] ; then
  . ~/.bashrc
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/otrenav/.bash_profile file was backed up as /Users/otrenav/.bash_profile.macports-saved_2014-03-22_at_17:56:29
##

# MacPorts Installer addition on 2014-03-22_at_17:56:29: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

