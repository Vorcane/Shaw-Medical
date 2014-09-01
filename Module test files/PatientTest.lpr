program PatientTest;

{$mode objfpc}{$H+}

uses crt;
var PatientFile, IDFile:text;
    Filename:string;
begin
  writeln('Welcome to the patient Module');
  assign(IDFile,'IDFile.txt');
  append(IDFile);
  writeln(IDFile,'1');
  close(IDFile);
  readln;
end.

