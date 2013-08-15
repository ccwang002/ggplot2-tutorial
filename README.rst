################
ggplot2 Tutorial
################

The slide is powered by the framework `reveal.js`_ (Hakim El Hattab) under MIT license. Unless otherwise mentioned, the content itself is licensed under a `Creative Commons Attribution 3.0 Unported License`__.

.. _reveal.js:  https://github.com/hakimel/reveal.js/
__ http://creativecommons.org/licenses/by/3.0/


Introduction
============

This repo contains the slides for presentation given at `Taiwan R User Group`_  meet up and the corresponding R example code. It mainly follows the mindflow of the book: Winston C. (2012) |R_Graphics_Cookbook|_. Sebastopol, CA: O'Reilly Media, Inc. 

.. _Taiwan R User Group: http://www.meetup.com/Taiwan-R/events/125697962/
.. _R_Graphics_Cookbook: http://shop.oreilly.com/product/0636920023135.do
.. |R_Graphics_Cookbook| replace:: *R Graphics Cookbook*

It basically depends on the following packages: `ggplot2`_, `gcookbook`_ and `plyr`_. 

All of these packages can be installed by

.. code-block::

    install.packages(c('ggplot2', 'gcookbook', 'plyr'))

.. _ggplot2: http://ggplot2.org 
.. _plyr: http://plyr.had.co.nz/
.. _gcookbook: https://github.com/wch/gcookbook


View the Slides
===============

Online
------

Simply open the link http://ccwang002.github.io/ggplot2-tutorial/ will do.


Local
------

One can ``git clone`` this repository or download and extract the `zip`__ file to get full source.

Open ``slides/index.html`` in browser (**Javascript** may be needed) to view the slides.

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
