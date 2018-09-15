See [repo](https://github.com/RGBD/curb-segfault)

### Environment

- OS: Ubuntu 16.04
- RVM
- Ruby: 2.2.3, 2.3.6, 2.4.2, 2.5.1,
- Curb: 0.8.8, 0.9.6,
- OpenSSL 1.0.2g,
- Curl: 7.47.0

### What happens

Killing a thread during Curb::Easy#perform causes segfault. Timeout does that under the hood.
Sometimes it happens right after the kill, sometimes on the next garbage collection.

### Steps to reproduce

Install ruby 2.5.1 through rvm.
Start proxy.sh
Start curb_fail.rb
