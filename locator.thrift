/*
locator.thrift

Created by Adam T. Lindsay on 2009-05-15.

The MIT License

Copyright (c) 2009 Adam T. Lindsay.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

struct Location {
 1: string address,
 2: i16 port,
}

service Base {
 void           ping         ()
 string         service_type ()
 list<string>   service_types()
 oneway void    debug        ()
 oneway void    die          ()
}

service Locator extends Base {
 oneway void    join    (1:Location location)
 oneway void    remove  (1:Location location, 2:list<Location> authorities)
 oneway void    add     (1:Location location, 2:list<Location> authorities)
 list<Location> get_all ()
 Location       get_node(1:string key)
}
