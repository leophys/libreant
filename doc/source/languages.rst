Languages
=========

A program can be a very useful tool, but many times one is expected
to give access to it to many people who are not native English 
speakers (or any other language).

Libreant makes use of a specific module of Flask (Flask-Babel) which
allows one to easily include translations in the source code.

.. note::
	You do not need to be a developer to contribute to the translations!
	It is easy as modify a text document, maybe easier.

What you need
-------------

First of all you need to retrieve the strings to be translated. There are
two main ways right now.

If you are confident with github.com
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Simply clone the repo at ourRepoURL_ .
You will find all the strings to be translated in the directory
``webant/translations/en/LC_MESSAGES/messages.po``.
You can edit this file with any text editor, but if you are not confident
with this ``.po`` files, it is better to use a specific tool.
See below for more details.

If you are NOT confident with github.com
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Waiting for an easier solution, you can e-mail us at ``insomnialab@hacari.org``.
We will send you a ``messages.po`` file that you will easily be able to modify
with the following tool.

What tools do you need
~~~~~~~~~~~~~~~~~~~~~~

If you are on a GNU/Linux system we recommend to use 


.. _ourRepoURL: https://github.com/insomnia-lab/libreant
