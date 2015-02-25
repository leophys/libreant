Internationalization
====================

A program can be a very useful tool, but many times one is expected
to give access to it to many people who are not native English 
speakers.

Libreant makes use of a specific module of Flask (Flask-Babel) which
allows one to easily include translations in the source code.

.. note::
	You do not need to be a developer to contribute to the translations!
	It is as easy as modifying a text document, maybe easier.

What you need
-------------

First of all you need to retrieve the strings to be translated. There are
two main ways right now.

If you are confident with github.com
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Simply clone the repo form `our repository URL`_ .
You will find all the strings to be translated in the directory
``webant/translations/en/LC_MESSAGES/messages.po``.
You can edit this file with any text editor, but if you are not confident
with this ``messages.po`` file, it is better to use a specific tool.
See below for more details.

If you are NOT confident with github.com
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Waiting for an easier solution, you can e-mail us at ``insomnialab@hacari.org``.
We will send you a ``messages.po`` file that you will easily be able to modify
with the following specialized text editor.

What tools do you need
~~~~~~~~~~~~~~~~~~~~~~

If you are on a GNU/Linux system we recommend to use poedit_. It is a
very easy-to-use text editor specialized to work on ``*po`` translation
files.

On Arch Linux you can install it from command line with the command

``sudo pacman -Sy poedit``

On Debian/Ubuntu distributions you can use

``sudo apt-get install poedit``


Opening the ``messages.po`` file you will find a very intuitive interface, showing
a 2 column layout. On the left you will find the english strings. You will
be asked to fill the correspondig translation on the right.
Once finished, you can save the file and either make a pull request, if you
cloned our repository from github.com, or send us back the files.

.. note::
    If you cloned the repository from github.com, before making the pull
    request, make sure to create a folder with path
    ``webant/translations/<two letter code of the language>/LC_MESSAGES/``
    and put the translation ``messages.po`` file inside it.



.. _our repository URL: https://github.com/insomnia-lab/libreant
.. _poedit: http://poedit.net/
