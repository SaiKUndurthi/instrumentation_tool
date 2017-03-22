#!/bin/bash

TEMP_DIR=$ASPECTJ_HOME/target_classes/

CLASSES_DIR=$1

CLASSPATH=$ASPECTJ_HOME/lib/aspectjrt.jar:$ASPECTJ_HOME/lib/aspectjtools.jar

echo "compiling aspects"
#TODO: compile all java files in dir $CUSTOM_ASPECT_HOME
find $CUSTOM_ASPECT_PATH -type f -name "*.java" -exec javac -classpath $CLASSPATH -g -d $CLASSES_DIR {} \;

echo "Weaving aspect..."
 

#JAVA_OPTS="-Xmx2048M" ajc  -source 1.5 -inpath $CLASSES_DIR/ -aspectpath $CUSTOM_ASPECT_PATH -d $TEMP_DIR
java -cp $CLASSPATH org.aspectj.tools.ajc.Main -Xmx2048M -source 1.5 -inpath $CLASSES_DIR/ -aspectpath $CUSTOM_ASPECT_PATH -d $TEMP_DIR 

echo "Replacing the modified classes..."
cp -rf $TEMP_DIR/* $CLASSES_DIR/

# copy classes in aspectjrt.jar 
cp -r $ASPECTJ_HOME/extracted_classes/* $CLASSES_DIR/

