import re

def parseFile(path):
    f = open(path)
    fileContents = f.read()
    f.close()
    #
    noReturn = re.sub('\n', ';', fileContents)
    noSpace = re.sub('\s+', ' ', noReturn)
    cleanFileContents = re.sub(';[;|\s]+', ';', noSpace)
    #
    return cleanFileContents


def getField(s, field):
    return re.search(field + "\s+\{[^{]+\}", s).group()


# match between ";"
reElem = re.compile("(?<=;)[^;]+(?=;)")


def readTemplate(path):
    f = open(path)
    fileContents = f.read()
    f.close()
    #
    return fileContents


def makeStruct(s):
    param = getField(s,"Param")
    p = reElem.findall(param)
    struct_core = str.join("", map(lambda x: "  " + x + ";\n", p))
    return struct_core

def writeProgram(s):
    withStruct =re.sub('  [/][*]state-core[*][/]\s+', makeStruct(s), template)
    print withStruct
    # FIXME: stopped here. prints the template file with struct replaced


# tests:
s = parseFile("../model/normal.model")
template = readTemplate("templates/fit.h")

writeProgram(s)
