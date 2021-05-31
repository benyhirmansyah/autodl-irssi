### Autodl Irssi

Container definition for the Autodl-irssi. This runs only the "backend" part of the autodl setup i.e. irssi client + it's autodl plugin. If you also want to run the rutorrent plugin, you need to run it separately. There's an awesome container for rtorrent/rutorrent by _crazy-max_:
https://github.com/crazy-max/docker-rtorrent-rutorrent

This container is a fork of https://github.com/thomaswelton/autodl-irssi with slight additions:
- Autodl-irssi and it's tracker files addes as submodules for easy upgrade
- Added a couple of basic tools for convenient troubleshooting: ps, netstat, vim, less
- Small corrections to make it build without issues

## Usage

At the moment I have a build for arm64 only at the dockerhub. Will add other archs when I catch some time. Obviously, you can build what you need yourself :)

```
docker run \
	-it -e TERM \
	--name autodl-irssi \
	-v </path/to/watch/directory>:/home/user/watch:rw \
	-v </path/to/autodl/directory>:/home/user/.autodl:rw \
	darthpyranus/autodl-irssi:test
```
