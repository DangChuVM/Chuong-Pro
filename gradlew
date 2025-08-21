#!/usr/bin/env bash

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass any JVM options to Gradle separately.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'
APP_NAME="Gradlew"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
linux=false
freebsd=false
case "`uname`" in
    CYGWIN*) cygwin=true ;;
    Darwin*) darwin=true ;;
    FreeBSD) freebsd=true ;;
    Linux) linux=true ;;
esac

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done

APP_HOME=`dirname "$PRG"`

# Absolutize APP_HOME
APP_HOME=`cd "$APP_HOME" && pwd`

# Check for APP_HOME
if [ -z "$APP_HOME" ] || ! [ -d "$APP_HOME" ] ; then
    die "Error: APP_HOME is not set correctly." >&2
fi

# Check for JAVA_HOME
if [ -z "$JAVA_HOME" ] ; then
    # If a JDK is installed with sdkman, use it
    if [ -d "$HOME/.sdkman/candidates/java/current" ]; then
        export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
    else
        # Fallback to searching for java
        JAVA_EXE=`which java 2>/dev/null`
    fi
else
    JAVA_EXE="$JAVA_HOME/bin/java"
fi

if [ -z "$JAVA_EXE" ] ; then
    die "Error: JAVA_HOME is not set and no 'java' command could be found in your PATH." >&2
fi

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass any JVM options to Gradle separately.
if [ -z "$GRADLE_OPTS" ] ; then
    GRADLE_OPTS=$DEFAULT_JVM_OPTS
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    GRADLE_OPTS=`cygpath --path --windows "$GRADLE_OPTS"`
fi

# Split up the JVM options passed to Gradle
GRADLE_OPTS=($GRADLE_OPTS)

# Execute Gradle
exec "$JAVA_EXE" "${GRADLE_OPTS[@]}" -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"