The gentoo overlay for Havee

#### Way:

    1. edit: /etc/layman/layman.cfg
    uncomment the line: "overlay_def : /etc/layman/overlays".
    2. mkdir /etc/layman/overlays
    3. wget -O /etc/layman/overlays/Havee.xml https://raw.githubusercontent.com/Ihavee/overlay/master/repo.xml
    4. layman -S
    5. layman -f -a Havee
