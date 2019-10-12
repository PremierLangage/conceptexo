

orbitales=["1s","2s","2p","3s","3p","4s","3d","4p","5s","4d","5p"]
maximum=[2,2,6,2,6,2,10,6,2,10,6]


def strfromz(Z):
    """
    >>> strfromz(10)
    '1s2 2s2 2p6'
    """
    
    if Z==24:
        s="1s2 2s2 2p6 3s2 3p6 4s1 3d5"
    elif Z==29:
        s="1s2 2s2 2p6 3s2 3p6 4s1 3d10"
    else:
        s=""
        indice=0
        while Z>0:
            if Z>maximum[indice]:
                s=s+orbitales[indice]+str(maximum[indice])+" "
                Z -= maximum[indice]
            else:
                s=s+orbitales[indice]+str(Z)
                Z=0
            indice+=1    
    return s
import sys
def verif(s,Z):
    while s.startswith(" "):
        print("eats white",file=sys.stderr)
        s=s[1:]
    while s.endswith(" "):
        s=s[:-1]
        print("eats end white",file=sys.stderr)

    return s==strfromz(Z)
        
    



