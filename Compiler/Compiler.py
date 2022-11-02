import re
import os

def SearchLabel(LabeltoFind):
    file_name = "CostumeIsa.txt"                        #Assembly input file name
    counterLine = 0
    for line in open (file_name):
        
        if line.split(":")[0] == LabeltoFind:
            
            print("MATCH")
            return counterLine
        else:
            counterLine+=1
        

def DicInstr(operand):
    #Dictionary to store all the escalar instructions 
    EscalarInstDir = {"LDR": "00000" , 
                     "STR": "00001" ,
                     "MOV": "00010" , 
                     "ADD": "00100" ,
                     "SUB": "00101" ,
                     "DIV": "00110" , 
                    "MULT": "00111" ,
                     "JMP": "01110" ,
                      "BE": "01011" ,
                      "CMP": "01010",
                    "PRINT": "01111"}  
    #Dictionary to store all the vector instructions 
    VectorInstDir = {"VSADD": "10100" ,
                     "VADD" : "11100" ,
                     "VSSUB": "11101" ,
                     "VSMUL": "10101" ,
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
    FifteenZeros = "000000000000000"
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
    
    # Instruction Example MOV r1, inm
    # Instruction Example CMP R1, inm
    # Instruction Example VMOVI v1,inm
    if operation in OpRegsWithImm:                      #Chech if the operand has a immediate
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        Operand1 = divideInst[1].split(",")[0]          #Take the the first register
        print(Operand1)
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        print(operand1Bin)
        Operand2 = divideInst[2]                        #Take the value of the immediate
        print(Operand2)
        operand2Bin = format(int(Operand2), '019b')     #Convert the immediate into binary value 19bits
        print(operand2Bin)
        InstMachineCode = opcode + operand1Bin + FourZeros + operand2Bin #Merge the instrucction into machine format
        print(InstMachineCode)
        print(len(InstMachineCode))
        print()
        return  InstMachineCode
        #print((InstMachineCode))
    
    # Instruction Example LDR r1, r2
    # Instruction Example STR r1, r2
    # Instruction Example VSTR v1, R1
    # Instruction Example VLDR v1, r1
    elif operation in OpWithMem:
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        Operand1 = divideInst[1].split(",")[0]          #Take the  first register
        print(Operand1)
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        print(operand1Bin)
        Operand2 = divideInst[2]                        #Take the second register
        print(Operand2)
        operand2Bin = format(int(Operand2[1:]), '04b')  #Convert the immediate into binary value 4bits
        print(operand2Bin)
        InstMachineCode = opcode + operand1Bin + operand2Bin + FourZeros +  FifteenZeros #Merge the instruction into machine format
        print(InstMachineCode)
        print(len(InstMachineCode))
        print()
        return  InstMachineCode
        #print((InstMachineCode))
    
    # Instruction Example JMP INM
    # Instruction Example BE INM
    elif operation in opBrnJmp:
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        direction = divideInst[1].split("\n")[0]        #Catch the address to jump 
        print(direction)
        valueDirection = SearchLabel(direction)
        print(valueDirection)
        Dirbin = format(int(valueDirection),'019b')
        print(Dirbin)
        InstMachineCode = opcode + FourZeros + FourZeros + Dirbin
        print(InstMachineCode)
        print(len(InstMachineCode))
        return  InstMachineCode
        
    # Instruction Example  ADD R1, R2, R3
    # Instruction Example  SUB R1, R2, R3
    # Instruction Example  VSAA V1, V1, R2
    # Instruction Example  VADD V1, V1, V2
    # Instruction Example  VSSUB V1, V1, R1
    # Instruction Example  VSMUL V1, V1, R2
    elif operation in opAritReg:
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        print(Operand1)
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        print(operand1Bin)
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        print(Operand2)
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        print(operand2Bin)
        Operand3 = divideInst[3].split(",")[0].split(",")  #Take the third register
        print(Operand3)
        operand3Bin = format(int(Operand3[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        print(operand3Bin)
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + operand3Bin + FifteenZeros #Merge the instruction into machine format
        print(InstMachineCode)
        print(len(InstMachineCode))
        print()
        return  InstMachineCode
        #print(InstMachineCode)
     
    # Instruction Example  DIV R1, R1, INM
    # Instruction Example  mul R1, R1, INM
    elif operation in opAritImm:
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        print(Operand1)
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        print(operand1Bin)
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        print(Operand2)
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        print(operand2Bin)
        Operand3 = divideInst[3].split(",")[0].split(",")  #Take the immediate
        print(Operand3)
        operand3Bin = format(int(Operand3[0]), '019b')  #Convert the immediate into binary value 19bits
        print(operand3Bin)
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + operand3Bin  #Merge the instruction into machine format
        print(InstMachineCode)
        print(len(InstMachineCode))
        print()
        return  InstMachineCode
        #print(InstMachineCode)
        
    # Instruction Example VMOV V1, V2
    elif operation == "VMOV":
        print(instruction)
        print(operation)
        opcode = DicInstr(operation)                    #Take the instrucction opcode according to match
        print(opcode)
        Operand1 = divideInst[1].split(",")[0]          #Take the first register
        print(Operand1)
        operand1Bin = format(int(Operand1[1:]), '04b')  #Convert the register 1 into binary value 4bits
        print(operand1Bin)
        Operand2 = divideInst[2].split(",")[0].split(",")  #Take the second register
        print(Operand2)
        operand2Bin = format(int(Operand2[0][1:]), '04b')  #Convert the immediate into binary value 4bits
        print(operand2Bin)
        InstMachineCode = opcode +  operand1Bin +  operand2Bin + FourZeros + FifteenZeros  #Merge the instruction into machine format
        print(InstMachineCode)
        print(len(InstMachineCode))
        print()
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
