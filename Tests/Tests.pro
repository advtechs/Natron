# ***** BEGIN LICENSE BLOCK *****
# This file is part of Natron <http://www.natron.fr/>,
# Copyright (C) 2016 INRIA and Alexandre Gauthier-Foichat
#
# Natron is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Natron is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Natron.  If not, see <http://www.gnu.org/licenses/gpl-2.0.html>
# ***** END LICENSE BLOCK *****

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
# Cairo is still the default renderer for Roto
!enable-osmesa {
   CONFIG += enable-cairo
}
CONFIG += moc rcc
CONFIG += boost opengl qt python shiboken pyside
enable-cairo: CONFIG += cairo
CONFIG += static-yaml-cpp static-gui static-engine static-serialization static-host-support static-breakpadclient static-libmv static-openmvg static-ceres static-libtess
QT += gui core opengl network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets concurrent

CONFIG += openmvg-flags glad-flags

!noexpat: CONFIG += expat

INCLUDEPATH += google-test/include
INCLUDEPATH += google-test
INCLUDEPATH += google-mock/include
INCLUDEPATH += google-mock


QMAKE_CLEAN += ofxTestLog.txt test_dot_generator0.jpg

include(../global.pri)

SOURCES += \
    google-test/src/gtest-all.cc \
    google-test/src/gtest_main.cc \
    google-mock/src/gmock-all.cc \
    BaseTest.cpp \
    Hash64_Test.cpp \
    Image_Test.cpp \
    Lut_Test.cpp \
    KnobFile_Test.cpp \
    Curve_Test.cpp \
    Tracker_Test.cpp \
    wmain.cpp

HEADERS += \
    BaseTest.h
