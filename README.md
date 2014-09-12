README -- "Monolith"
====================
2014/08/29
Hoon H.








This is a trial to make a monolithic repository for all of 
my reusable code.

This source tree cares only one thing. Version consistency. 
This doesn't care anything else. Total size of this source 
code will grow large as like GBs, and total build time will
take hours...

Anyway for your convenience, each component libraries are 
currently separated in different repositories. You can 
composite them to build your own llight-weight version 
compositions.



Why Monolithic?
---------------
This is all about convenience. Linking many small libraries
is hard and annoying job, and it consumes too much initial
efforts to starting a project. You start quickly with 
monolithic one, and optimize later to link to only required
stuffs. Or we may think about *static umbrella framework*
to let you link only required parts.



How to Build
------------
Select `Monolith - OSX Dynamic Framework` scheme and build. 
Currently, it will build an umbrella framework.

C++ interface headers can be exposed by the settings of 
embedded framework. If the framework is well configured to
copy the headers properly, then it will work well.




Submodule Layout
----------------
If a component contains its own submodules they shouldn't be 
duplicated. Having multiple source code is explicitly 
prohibited, and only one version must be exist in whole 
source tree. As a simplest way to do this, any code needs
shared dependency must be in same repository. Currently, 
existing code are stored in separated repository, but they 
will be merged soon into this repository.



Note
----
Do not place any large binary. Currently I have no good idea 
how to handle those large binaries. Then, prebuilt LLDB 
library has been excluded.





Issues
------
Currently, only dynamic framework packaging is supported.
This is because I don't know how to merge static libraraies
effectively with thier headers.
If you need static linking, use static library or framework
targets prepared on each component projects.




Project Maintenance
-------------------

-	Setting "Target Dependencies" is required. I think this 
	is also resolving ambguity between same named products.
	Because this project produces many same named products,
	then it seems necessary.














