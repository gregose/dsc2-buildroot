### Buildroot for DSC2 DSD DAC

Custom Buildroot linux image for [DSC2 DSD DAC](http://puredsd.ru/).

```
# git submodule update --init --recursive
# cd buildroot
# make BR2_EXTERNAL=../ dsc2_defconfig
# make
```
