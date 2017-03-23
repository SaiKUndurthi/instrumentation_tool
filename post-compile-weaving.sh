#!/bin/bash

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

export INSTR_HOME=$ANDROID_HOME/instrumentation_tool

TEMP_DIR=$INSTR_HOME/target_classes/

CLASSES_DIR=$1

CLASSPATH=$INSTR_HOME/lib/aspectjrt.jar:$INSTR_HOME/lib/aspectjtools.jar:$2

echo "compiling aspects"
#TODO: compile all java files in src dir

find $INSTR_HOME/src -type f -name "*.java" > sources.txt
javac -classpath $CLASSPATH -g -d $CLASSES_DIR @sources.txt || error_exit "Error in compiling Aspects..Aborting "
rm -f sources.txt

echo "Weaving aspect..."
java -cp $CLASSPATH org.aspectj.tools.ajc.Main -Xmx2048M -source 1.5 -inpath $CLASSES_DIR/ -aspectpath $INSTR_HOME/src -d $TEMP_DIR || error_exit "Error while weaving aspects.. Aborting"


echo "Replacing with the modified classes..."
cp -rf $TEMP_DIR/* $CLASSES_DIR/
rm -rf $TEMP_DIR


# copy classes in aspectjrt.jar 
mkdir $INSTR_HOME/extracted_classes
unzip $INSTR_HOME/lib/aspectjrt.jar -d $INSTR_HOME/extracted_classes > /dev/null
cp -r $INSTR_HOME/extracted_classes/* $CLASSES_DIR/
rm -rf $INSTR_HOME/extracted_classes
