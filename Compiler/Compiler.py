import re
import os



def DicInstr(operand):
    #Dictionary to store all the escalar instructions 
    EscalarInstDir = {"LDR": "00000" , 
                     "STR": "00001" ,
                     "MOV": "00010" , 
                     "ADD": "00100" ,
                     "SUB": "00101" ,
                     "DIV": "00110" , 
                    "MULT": "00111" ,
                     "JMP": "01010" ,
                      "BE": "01011" ,
                      "CMP": "01010",
                    "PRINT": "01111"}  
    #Dictionary to store all the vector instructions 
    VectorInstDir = {"VSADD": "10100" ,
                     "VADD" : "10101" ,
                     "VSSUB": "11101" ,
                     "VSMUL": "11100" ,
                     "VMOV" : "11001" ,
                     "VMOVI": "10011" ,
                     "VSTR" : "10001" ,
                     "VLDR" : "10000" }     
    if operand in EscalarInstDir:
        return EscalarInstDir[operand]
    elif operand in VectorInstDir:
        return VectorInstDir[operand]
    else:
        pass


def IntructionAnalyzer(instruction):
    divideInst = instruction.split(" ")                 #Divide the instruction into pieces
    operation = divideInst[0]                           #Take the instrucction operand 
    FourZeros = "0000"
    #List to check for a three operand with a immediate
    OpRegsWithImm = ["MOV", "CMP", "VMOVI"]       
    #List to check the operations who works with memory 
    OpWithMem = ["LDR", "STR", "VSTR", "VLDR"]
    #List to check the operations JMP and BE
    opBrnJmp = ["JMP", "BE"]
    #List to check the aritmetic operations with register
    opAritReg = ["ADD", "SUB", "VSADD", "VADD", "VSSUB", "VSMUL"]
    #List to check the aritmetic operations with immediate
    opAritImm = ["DIV" , "MULT"]
    
    
    if operation in OpRegsWithImm:                      #Chech if the operand has a immediate
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        Operand1 = divideInst[1].split(",")[0]          #Take the the first register
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        Operand2 = divideInst[2]                        #Take the value of the immediate
        operand2Bin = format(int(Operand2), '019b')     #Convert the immediate into binary value 19bits
        InstMachineCode = opcode + operand1Bin + FourZeros + operand2Bin #Merge the instrucction into machine format
        return  InstMachineCode
        #print((InstMachineCode))
    
    elif operation in OpWithMem:
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        Operand1 = divideInst[1].split(",")[0]          #Take the  first register
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        Operand2 = divideInst[2]                        #Take the second register
        operand2Bin = format(int(Operand2[1:]), '04b')  #Convert the immediate into binary value 4bits
        InstMachineCode = opcode + operand1Bin + operand2Bin + FourZeros #Merge the instruction into machine format
        return  InstMachineCode
        #print((InstMachineCode))
        
    elif operation in opBrnJmp:
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        direction = divideInst[1].split("\n")[0]        #Catch the address to jump 
        InstMachineCode = opcode + FourZeros + FourZeros
        return  InstMachineCode
        
    elif operation in opAritReg:
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        Operand3 = divideInst[3].split(",")[0].split(",")  #Take the third register
        operand3Bin = format(int(Operand3[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + operand3Bin + FourZeros #Merge the instruction into machine format
        return  InstMachineCode
        #print(InstMachineCode)
        
    elif operation in opAritImm:
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        Operand3 = divideInst[3].split(",")[0].split(",")  #Take the immediate
        operand3Bin = format(int(Operand3[0]), '019b')  #Convert the immediate into binary value 19bits
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + operand3Bin  #Merge the instruction into machine format
        return  InstMachineCode
        #print(InstMachineCode)
        
    elif operation == "VMOV":
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + operand3Bin + FourZeros  #Merge the instruction into machine format
        return  InstMachineCode
        #print(InstMachineCode)
        
    #PRINT Instruction
    elif operation == "PRINT":
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        InstMachineCode = opcode +  format(0, '019b')
        return  InstMachineCode
        #print(type(InstMachineCode))
        
def ProcessingText():
    file_name = "CostumeIsa.txt"                        #Assembly input file name
    OutputFile = "CompiledInstructions.txt"
    linesWrite = []                                     #Lines to write in the output file
    #Goes through all the lines in the file 
    for codeline in open(file_name):
        vectorInst = re.search("^V", codeline)          #Catch all the lines that starts with a V upper case
        comment = re.search("^//",codeline)             #Catch all the lines that starts with the // comment line symbol
        whiteSpace = re.search("^\n", codeline)         #Catch all the lines that starts with a new line space 
        
        #Search for a vector instruction in the file
        if vectorInst:
            processInst = IntructionAnalyzer(codeline)  #Send the instruction to the analyzer
            linesWrite.append(processInst)              #Append the process line to write
        
        #Search if the lines starts comment or a white space so it can ignore them
        elif comment or whiteSpace:
            continue
        
        #The line is a instrucction
        else :
            processInst = IntructionAnalyzer(codeline)  #Send the instruction to the analyzer
            linesWrite.append(processInst)              #Append the process line to write
            
    newFile = open(OutputFile, 'w+')
    for linetoWrite in linesWrite:
        if linetoWrite != None:
            newFile.write(linetoWrite + "\n")

ProcessingText()