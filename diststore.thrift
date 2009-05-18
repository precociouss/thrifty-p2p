/*
diststore.thrift

Created by Adam T. Lindsay on 2009-05-18.

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

include "locator.thrift"

struct StarterPackage {
 1: list<locator.Location> nodes,
 2: map<string, string>    store,
}

service Store extends locator.Locator {
 string                 get     (1:string key)
 void                   put     (1:string key, 2:string value)
 StarterPackage         join    (1:locator.Location location)
 map<string, string>    add     (1:locator.Location location, 2:list<locator.Location> authorities)
}
