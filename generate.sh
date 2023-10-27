#! /bin/bash

cd /java

javadoc -d /generated -encoding utf8 -docencoding utf8 -charset utf8 -windowtitle "Bananashake TicTacToe" -subpackages $JAVA_PACKAGE
