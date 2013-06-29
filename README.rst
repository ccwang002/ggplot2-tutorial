################
ggplot2 Tutorial
################

The slide is powered by the framework `reveal.js`_ (Hakim El Hattab) under MIT license.

The content itself is licensed under a `Creative Commons Attribution-ShareAlike 3.0 Unported License`__.

.. _reveal.js:  https://github.com/hakimel/reveal.js/
__ http://creativecommons.org/licenses/by-sa/3.0/


View the slides @local
======================

One can simply ``git clone`` this repository or download the `zip`__ file the extract it.

Open the file ``slides/index.html`` in browser (javascript may be needed) then one can enjoy the slide locally.

If the slide is viewed offline, then some font style may be losted.

__ https://github.com/ccwang002/ggplot2-tutorial/archive/master.zip

For Slides Uploading
====================

I manage the ``gh-pages`` branch using `ghp-import`_, which can be installed by

.. code-block:: bash

    pip install ghp-import

To update the slides content shown in the ``gh-pages`` branch, it is simply one command away

.. code-block:: bash

    ghp-import -m 'Update slides' -p slides

.. _ghp-import: https://github.com/davisp/ghp-import
