# Shit bail
case $- in
	  *i*) [ "$GIBRC" ] && echo "Reusing gibrc..." || echo "Using gibrc..." ;;
	    *) return ;; # Exit if not running interactively.
esac

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs
export PATH=$PATH:/Users/Andrew/abin
ahdir=`apsearch -afni_help_dir`
if [ -f "$ahdir/all_progs.COMP.bash" ]
then
	   . $ahdir/all_progs.COMP.bash
   fi
export PATH=/usr/local/bin:$PATH
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/abin
export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'


export PATH="$HOME/.cargo/bin:$PATH"

