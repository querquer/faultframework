%% Documentation Graphical User Interface - Faultlist
% This provides a easy and clear way to create Fault Configuration files.
% This contains the activation and parameter of all 13 fault types. The
% activation can be adjust via the checkboxes. The parameter of the faults
% are accessible over the button of the individual faults which will open
% a seperate gui.
%%

%% Image of the graphical user interface
% <<gui_faultlist.png>>



%% Related Functions

%%
% * <createXML.html createXML>
% * <myXMLwrite.html myXMLwrite>
% * <loadFaultKonf.html loadFaultKonf>



%%% Panel: Individual Fault Configuration

% Elemtent: *Save Configuration*
% Funktion: Calls uiputfile and consigns the filename to createXML()

% Elemtent: *Activate*
% Funktion: Enables/Disables the corresponding fault.

% Elemtent: *Fault Name*
% Funktion: Opens a individual gui for the corresponding fault where all
% parameters can be edit.

% Elemtent: *edit activation matrix*
% Funktion: open a matrix which contains a 7x8 table. 
% The entries of the table represent the probability from one fault state
% to another e.g. if you want that after a choosen fault state the next
% sample is fault free, you have to keep the column of the fault state
% zero(the probability of all fault states are zero and no fault is triggered).



































