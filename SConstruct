#Easy SConstruct file for C++
#Example for SFML and personal project folder structure (/projectDir/src for .cpp, /projectDir/include for .h)
#This file must be named 'SConstruct'

projectName = 'gitTestProject' #Must be the name of the project folder
executableName = 'GitTestProject'

projectDir = '/home/killian/cpp/projects' + projectName #Get your own name in there

#includePathList = ['~/cpp/libraries/SFML-2.0/include/SFML'] #SFML includes NOT USED
#libPathList = ['home/brian/cpp/libraries/SFML-2.0/lib'] #SFML library NOT USED
#All SFML stuff is actually in /usr/lib and /usr/include (so copy the contents of SFML/lib and SFML/include to those folders

libList = [ 'sfml-window','sfml-system','sfml-graphics' ] 

env = Environment( CPPPATH = [ './include', '/usr/include' ] )
env.Program( target = executableName, source = Glob( 'src/*.cpp' ), LIBS = libList, LIBPATH = '/usr/lib')
