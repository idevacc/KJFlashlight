## KJFlashlight

I got fed up with the complexities of the various iPhone flashlight apps I've tried, so I whipped up my own dead-simple flashlight app.

It has three buttons that control the LED on the back of the phone:

- On
- Off
- Flash (once per second)

That's it.

The Xcode project is set up to require iOS 6.  (It will probably compile and run with older versions of iOS, but I haven't tried.)
Also, the Info.plist specifies `camera-flash` as a required device capability, so you won't be able to run it on a device that does
not have an LED flash.


### License

Copyright &copy; 2012 Kristopher Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
