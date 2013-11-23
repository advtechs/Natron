//  Natron
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
*Created by Alexandre GAUTHIER-FOICHAT on 6/1/2012. 
*contact: immarespond at gmail dot com
*
*/

#ifndef NATRON_GLOBAL_GLINCLUDES_H_
#define NATRON_GLOBAL_GLINCLUDES_H_

#include <GL/glew.h>
#define QT_NO_OPENGL_ES_2

#ifndef NATRON_DEBUG
#define checkGLErrors() ((void)0)
#define assert_checkGLErrors() ((void)0)
#else
#define checkGLErrors() \
{ \
GLenum _glerror_ = glGetError(); \
if(_glerror_ != GL_NO_ERROR) { \
std::cout << "GL_ERROR :" << __FILE__ << " "<< __LINE__ << " " << gluErrorString(_glerror_) << std::endl; \
} \
}
#define assert_checkGLErrors() \
{ \
GLenum _glerror_ = glGetError(); \
if(_glerror_ != GL_NO_ERROR) { \
std::cout << "GL_ERROR :" << __FILE__ << " "<< __LINE__ << " " << gluErrorString(_glerror_) << std::endl; abort(); \
} \
}
#endif

#endif
