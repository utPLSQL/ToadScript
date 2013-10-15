---------------------------------------------------
Instructions for installing the utPLSQL TOAD Script
---------------------------------------------------

The supplied script allows utPLSQL to be run directly from TOAD via the
toolbar or a shortcut keystroke.  It was written for TOAD 7.2 and is known
to work on versions 7.4 and 7.6.

1) Put runtest.sql somewhere like C:\utplsql
2) On the toolbar, select the menu dropdown for tools (it looks like a
spanner and a yellow disk) and choose Configure...
3) Select Add
4) Choose any title you like e.g. "Unit Test in utPLSQL"
5) Put the path to SQL*Plus in the Program Box
6) Put the following in the parameters box: "$UID/$UPW@$SID
@'c:\utplsql\runtest' '$FIL'" where the path to runtest is the one you chose
above. (The single quotes are necessary to protect spaces in filenames).
7) Choose any shortcut you like e.g."Alt+Ctrl+U". Press OK to finish.

Now when you are editing a package file called mypack.pkb or mypack.pks, it
will call utplsql.test('mypack') for you.  If on the other hand, you are
working on a unit test package file called ut_blah.pks or ut_blah.pkb, it will
call utplsql.run('ut_blah').

This _does_ rely on you using this naming convention for your files, where the
name of the package is reflected in the name of the file.

Chris Rimmer Mar 2004
