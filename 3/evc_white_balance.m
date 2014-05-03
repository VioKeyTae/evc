function [result] = evc_white_balance(input, white)
%EVC_WHITE_BALANCE F�hrt den manuellen Wei�abgleich durch.
%
%   EINGABE
%   input ... Bild
%   white ... ein RGB Vektor mit der Farbe, die wei� werden soll
%   AUSGABE
%   result... Ergebnis nach dem Wei�abgleich
    
    R = input(:,:,1) / white(1);
    G = input(:,:,2) / white(2);
    B = input(:,:,3) / white(3);
    
    result = cat(3,R,G,B);
    %NOTE: Die folgende Zeile kann gel�scht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abst�rzt.
    
    %TODO: Berechne den Wei�abgleich mit dem white Wert
    
    %NOTE: Hellere Bildpunkte als dieser, werden anschlie�end Werte > 1 haben.    
    %Die dadurch ben�tigte Normalisierung wird am Ende bei der Kontrastst�rkung
    %gemacht.
end