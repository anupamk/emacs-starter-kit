# Emacs Starter Kit

This is a fork of technomancy's emacs-starter-kit, and ofcourse this
is from the v1 branch of the repository. So the instructions that
apply to that apply here as well. Some parts of the general
*organization* have also been borrowed from topfunky's
emacs-starter-kit as well.

I have added some personal modifications notably starter-kit-c and
starter-kit-erlang for better defaults to c and erlang programs
respectively. starter-kit-erlang is pretty bare bones and only has
support for distel, and nothing fancier e.g. rebar, quick-check
etc. distel is available as git sub-module, which implies that *if*
you clone this repository, you need to do:

          1. git submodule init
          2. git submodule update

to get the correct version of distel.
