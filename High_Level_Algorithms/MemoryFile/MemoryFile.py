def MemoryText():
    
    
    
    BinaryImageFile = "BinaryImage.txt"
    OutputFile = "MemoryFile.mif"
    CounterLine = 0
    spaces = "        "
    LastLine = 4056
    List = []
    FileHeader = """
                    -- begin_signature
                    -- memory
                    -- end_signature
                    WIDTH=64;
                    DEPTH=4057;
                    ADDRESS_RADIX=UNS;
                    DATA_RADIX=BIN;
                    CONTENT BEGIN
                    
                    """

    for ImageLine in (open(BinaryImageFile)):
        ImageLine = spaces + str(LastLine) + " :   " + ImageLine
        List+=[ImageLine]
        LastLine-=1
        
    
    newFile = open(OutputFile, 'w+')
    newFile.write(FileHeader)
    for linetoWrite in List:
            newFile.write(linetoWrite)
    newFile.write("END;")
                             
    
    
    
MemoryText()
                  
                  