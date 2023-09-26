#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/developer/master_ws/master_robot/yolo_ws/src/deep_learning/sarl_ros"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/developer/master_ws/master_robot/yolo_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/developer/master_ws/master_robot/yolo_ws/install/lib/python3/dist-packages:/home/developer/master_ws/master_robot/yolo_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/developer/master_ws/master_robot/yolo_ws/build" \
    "/usr/bin/python3" \
    "/home/developer/master_ws/master_robot/yolo_ws/src/deep_learning/sarl_ros/setup.py" \
     \
    build --build-base "/home/developer/master_ws/master_robot/yolo_ws/build/deep_learning/sarl_ros" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/developer/master_ws/master_robot/yolo_ws/install" --install-scripts="/home/developer/master_ws/master_robot/yolo_ws/install/bin"
