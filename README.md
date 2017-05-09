# instrumentation_tool
Tool for Instrumenting the Android platform

The Android codebase has been changing extensively over the last few years to support a wide range of mobile devices as well as to add attractive new features. Although the Android Open Source Project (AOSP) is freely available, due to its dynamic nature and continuous growth there is an ever-increasing need for a tool that facilitates developers the inspection of Android's behavior and aids them in the analysis of the source code by providing handles into the platform. This tool provides the developers the ability to instrument the AOSP codebase with the help of Aspect-Oriented Programming(AOP).
The Instrumentation tool enables its users to inject Java code which is useful in many situations such as providing the 
developers with better insights into the Android source code, understanding method, and class usage, 
monitoring the behavior of applications and checking any security violations of Android apps. Furthermore, the tool can also be extended to meet custom needs.



The end user can write a custom Java code to check certain run-time functional characteristics that they want to execute at every time a condition is met in the base code which is the Android Open Source Project (AOSP). The user can then use the Instrumentation tool to inject the custom code into the base code. The Instrumentation tool weaves the custom code into the base code through the build process and generates a custom emulator i.e. a final executable image of the AOSP. The custom emulator can be used by the end users to execute the APKs and see the output of their custom code every time the condition specified by them is met.

