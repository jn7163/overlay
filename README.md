`Ihavanna` organization of the gentoo overlay

#### Way:

    1. edit: /etc/layman/layman.cfg
    uncomment the line: "overlay_def : /etc/layman/overlays".
    2. mkdir /etc/layman/overlays
    3. add Ihavanna.xml to "/etc/layman/overlays" with content of https://raw.github.com/Ihavanna/overlay/master/repo.xml
    4. layman -S
    5. layman -f -a Ihavanna