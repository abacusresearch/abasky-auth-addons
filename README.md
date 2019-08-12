# AbaSky Auth Theme and Addons container

Needs to be run as a sidecar to the keycloak image.

## Create a release

Create a release on github. This automatically tags the image and starts a build quay.io.
Use the following convention for tag names: `v20190315-c61dec2`

```
echo v`date +%Y%m%d`-`git describe --match=NeVeRmAtCh --always --dirty`
```
