`Ihavee` organization of the gentoo overlay

#### Way:

    1. edit: /etc/layman/layman.cfg
    uncomment the line: "overlay_def : /etc/layman/overlays".
    2. mkdir /etc/layman/overlays
    3. add Havee.xml to "/etc/layman/overlays/" with content of https://gitcafe.com/Havee/overlay/raw/master/README.md
    4. layman -S
    5. layman -f -a Havee
