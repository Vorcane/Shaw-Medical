program PatientTest;

{$mode objfpc}{$H+}

uses crt;
var PatientFile, IDFile:text;
    Filename, PatientName:string;
    ID:integer;
begin
  {writeln('Welcome to the patient Module');
  assign(IDFile, 'IDFile.txt');
  rewrite(IDFile);
  ID:=1;
  writeln(IDFile, ID);
  close(IDFile);
  readln;}
  writeln('Welcome to the patient Module');
  assign(IDFile, 'IDFile.txt');
  reset(IDFile);
  readln(IDFile, ID);
  close(IDFile);
  ID:= ID + 1;
  rewrite(IDFile);
  writeln(IDFIle, ID);
  close(IDFile);
  writeln('Please enter the patient name in format: FName_LName-',ID);
  readln(Filename);
  assign(PatientFile, Filename);
  rewrite(PatientFile);
  writeln('Enter Patient Name please');
  readln(PatientName);
  writeln(PatientFile, PatientName);
  close(PatientFile);
  writeln('You have entered the following details');
  reset(PatientFile);
  readln(PatientFile, PatientName);
  writeln('Name:',PatientName);
  writeln('ID:',ID);
  close(PatientFile);
  readln;
end.

