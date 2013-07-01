################
ggplot2 Tutorial
################

The slide is powered by the framework `reveal.js`_ (Hakim El Hattab) under MIT license.

The content itself is licensed under a `Creative Commons Attribution-ShareAlike 3.0 Unported License`__.

.. _reveal.js:  https://github.com/hakimel/reveal.js/
__ http://creativecommons.org/licenses/by-sa/3.0/


Introduction
============

This repo contains the slides for presentation given at `Taiwan R User Group`_  meet up and the corresponding R example code.

.. _Taiwan R User Group: http://www.meetup.com/Taiwan-R/events/125697962/


View the Slides
===============

Online
------

Simply open the link http://ccwang002.github.io/ggplot2-tutorial/ will do.


@local
------

One can ``git clone`` this repository or download the `zip`__ file then extract it to get full source.

Open the file ``slides/index.html`` in browser (javascript may be needed) then one can enjoy the slide locally.

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
