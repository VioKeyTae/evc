function [result] = evc_gamma_correction(input, gamma, saturate)
%EVC_GAMMA_CORRECTION Wendet Gammakorrektur pro Farbkanal oder Helligkeit an
%   EINGABE
%   input   ... Bild
%   gamma   ... Gamma Wert
%   saturate... Falls 1: Die Farbanteile sollen erhalten bleiben.
%               Sonst: Die Intensit�tswerte sollen direkt hoch Gamma exponiert werden.
%   AUSGABE
%   result  ... Bild nach der Gammakorrektur

    %NOTE: Die folgende Zeile kann gel�scht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abst�rzt.
    result = input;
    
    %TODO Gamma^(-1) berechnen und auf Division durch 0 achten.
    
    if (saturate)
        %TODO Berechne die Helligkeiten der Bildpunkte.
        %     Achtung, rgb2gray normalisiert das Bild. Das Ausma� der 
        %     Intensit�ten soll aber erhalten bleiben!
        %     Berechne die Farbanteile und erhalte sie,
        %     nachdem die Gammakorrektur angewandt wurde.
    else           
        %TODO Alle Intensit�tswerte m�ssen mit gamma^-1 potenziert werden    
    end
end