program InitialDraft;
uses Crt, Dos, Classes, SysUtils, Misc; {Used for the clear screens and the bright text}
label 1; {Used to jump to whatever part of the program is been tested}

const
  AUsername = 'Admin';     {The admin Username for the admin menu}
  APassword = 'Password';  {The admin Password for the admin menu}

Var Choice, ID, Counter, Index:integer;
    PatientFile, IDFile, FilenameFile, DoctorFile, AvApps, Appointment:text;
    Filename, PatientFName, PatientLName, PatientAddress, AdminUsername, AdminPassword, PTitle:string;
    PPostCode, PatientTelephone, PDOB, DTitle, DoctorFName, DoctorLName, time, DFilename, DID:string;
    Filearray : Array[1..999] of string;
    FileList, AppList:TStringList;

Procedure AddPatient; { TODO : Prettify the add patient screen with a menu like the others }
label 1;
begin
 assign(FilenameFile, 'FileFile.txt');
 ClrScr;
 readln; {This fixed the program skipping a readln}
 writeln('Welcome to the patient Module');
 assign(IDFile, 'IDFile.txt');
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);

 Counter:= 1; {Initialises the counter}
 reset(FilenameFile); {opens the filename file for reading}
 while Not EoF(FilenameFile) do    {This should read the filenames from the file}
   begin
    readln(FilenameFile, Filename);  {Should read the filename from the file}
    Filearray[Counter]:= Filename;   {this sets the filenames to specific ids to be rewritten later}
    if EoF(FilenameFile) then break; {skips increasing the counter if at the end of the file}
    Inc(Counter);  {increases the counter by one}
   end;
 close(FilenameFile);

 ID:= ID + 1;   {This makes the next used ID different to the last one to preemptively fix any problems with patients with the same name}
 rewrite(IDFile);  {This clears the ID file}
 writeln(IDFIle, ID);         {This adds one to the last used ID for adding future patients}
 close(IDFile);

 writeln('Please enter the patient name in format: FName_LName-',ID);  {This instructs the user to enter the patients name with their unique ID at the end}
 readln(Filename); {This reads the patients name to make a file in their name}
 Filearray[ID]:= Filename;  {Writes the new file name to the array at the ID location}
 Counter:= ID;              {Sets the counter to the new ID so everything is written correctly}
 {for ID:= 1 to Counter do
   writeln(Filearray[ID]);    {This is debug code that is used to verify the array is working correctly by writing its contents to the console}
 readln;}

 Counter:= ID;  {Makes sure the counter is set at the ID, shouldnt be needed but I dont want to touch it incase it breaks}
 rewrite(FilenameFile); {Clears the FilenameFile so the array can be rewritten to the file without any legacy data floating around}
 for ID:= 1 to Counter do    {This for loop writes the contents of the array to the text file}
   begin
    writeln(FilenameFile, Filearray[ID]);   {writes the filename belonging to the specified ID to the text file}
   end;
 close(FilenameFile);                        {saves all the written data to the text file}

 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}
 1: {this allows the user to re enter information if there was an error}
 rewrite(PatientFile);      {This creates a new file in the name of the patient}
 writeln(PatientFile, FileName); {This writes the Filename used to the patients file}
 writeln(PatientFile, ID); {This writes the patients unique ID to their file}
 writeln('Please enter the patients title');
 readln(PTitle);
 writeln(PatientFile, PTitle); {this writes the patients title to their file}
 writeln('Enter Patient First Name please');
 readln(PatientFName);    {This reads the patients name to save their details}
 writeln(PatientFile, PatientFName);    {This writes the patients first name to their file}
 writeln('Please Enter Patient Last Name');
 readln(PatientLName);
 writeln(PatientFile, PatientLName);  {This writes the patients last name to their file}
 writeln('Please Enter Patient Address');
 readln(PatientAddress);
 writeln(PatientFile, PatientAddress); {This writes the patients address to their file}
 writeln('Please enter the Patient post code');
 readln(PPostCode);
 writeln(PatientFile, PPostCode); {This writes the patients post code to their file}
 writeln('Please enter the Patient Telephone Number');
 readln(PatientTelephone);
 writeln(PatientFile, PatientTelephone); {This writes the patients telephone to their file}
 writeln('Please enter the Patients Date Of Birth');
 readln(PDOB);
 writeln(PatientFile, PDOB);   {This writes the patients Date of birth to their file}
 close(PatientFile);
 ClrScr;                       {clears the screen for verification of entered data}

 writeln('You have entered the following details');  {this writes what the user entered to the console to verify the details}
 reset(PatientFile);   {Opens the patient file for reading}
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 readln(PatientFile, PatientAddress); {reads the patients address from the patients file}
 readln(PatientFile, PPostCode);      {reads the patients post code from the patients file}
 readln(PatientFile, PatientTelephone);{reads the patients telephone from the patients file}
 readln(PatientFile, PDOB);           {reads the patients date of birth from the patients file}
 writeln('File Name: ', FileName);    {writes the File Name to the console}
 writeln('ID: ',ID);                  {writes the ID to the console}
 writeln('First Name: ', PatientFName); {writes the patients first name to the console}
 writeln('Last Name: ', PatientLName); {writes the patients last name to the console}
 writeln('Address: ', PatientAddress); {writes the patients address to the console}
 writeln('Post Code: ', PPostCode); {writes the patients post code to the console}
 writeln('Patient Telephone: ', PatientTelephone); {writes the patients telephone to the console}
 writeln('Patient Date of Birth: ', PDOB);        {writes the patients date of birth to the console}
 close(PatientFile);
 writeln('Is this information correct?');
 writeln('1.Yes');
 writeln('2.No');
 readln(choice);
 if choice = 1 then
    writeln('Ok, infomation saved') {simply displays a confirmation message and continues back to the main menu}
 else goto 1;   {returns to the top of the information enter area}
 writeln('Press enter to continue please');
end;
procedure ListPatients; { TODO : Prettify }

begin
 ClrScr; {Clears the menu previously on the page}
 writeln('This will display all patient identifiers currently registered with the system');
 delay(500);
 write('ID');    {These three lines are needed to produce the output (ID's) because of the apostrophe problem}
 write('''');
 write('s:');

 assign(FilenameFile, 'FileFile.txt');
 Counter:= 1; {Initialises the counter}
 reset(FilenameFile); {opens the filename file for reading}
 while Not EoF(FilenameFile) do    {This should read the filenames from the file}
   begin
    readln(FilenameFile, Filename);  {Should read the filename from the file}
    Filearray[Counter]:= Filename;   {this sets the filenames to specific ids to be rewritten later}
    if EoF(FilenameFile) then break; {skips increasing the counter if at the end of the file}
    Inc(Counter);  {increases the counter by one}
   end;
 close(FilenameFile);

 {This procedure reads the ID from the ID file to ensure the correct number of files are written to the terminal}
 Counter:= 1;  {Resets the counter to 1}
 assign(IDFile, 'IDFile.txt');
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);

 for Counter:= 1 to ID do   {Writes the correct amount of filenames up to the last ID used}
   begin
    writeln(Filearray[Counter]);    {Writes the filenames stored in the array to the terminal}
   end;
 writeln('Please press enter to return to main menu');
 readln;
end;
Procedure EditPatient; { TODO : Prettify }
label 1; {Allows the user to edit another field at the end}
label 2; {Stops the program crashing if the user enters an invalid file name}
label 3; {Allows return to main menu if too many attempts made at file name}
begin
 Counter:= 1; {Initialises the counter}
 ClrScr; {Gets rid of any previous menus}
 writeln('This screen allows you to edit a patients details');
 2:
 writeln('Please enter the patients filename');
 readln;
 readln(Filename);
 1:
 ClrScr;

 assign(PatientFile, 'Patients/'+Filename); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('This is the current information for the patient:');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 readln(PatientFile, PatientAddress); {reads the patients address from the patients file}
 readln(PatientFile, PPostCode);      {reads the patients post code from the patients file}
 readln(PatientFile, PatientTelephone);{reads the patients telephone from the patients file}
 readln(PatientFile, PDOB);           {reads the patients date of birth from the patients file}
 writeln('File Name: ', FileName);    {writes the File Name to the console}
 writeln('ID: ',ID);                  {writes the ID to the console}
 writeln('Title: ', PTitle);          {Writes the title to the terminal}
 writeln('First Name: ', PatientFName); {writes the patients first name to the console}
 writeln('Last Name: ', PatientLName); {writes the patients last name to the console}
 writeln('Address: ', PatientAddress); {writes the patients address to the console}
 writeln('Post Code: ', PPostCode); {writes the patients post code to the console}
 writeln('Patient Telephone: ', PatientTelephone); {writes the patients telephone to the console}
 writeln('Patient Date of Birth: ', PDOB);        {writes the patients date of birth to the console}
 close(PatientFile);
 delay(1000);
 writeln;

 writeln('Please choose a field to edit');
 writeln('1: Title');
 writeln('2: First Name');
 writeln('3: Last Name');
 writeln('4: Address');
 writeln('5: Post Code');
 writeln('6: Telephone number');
 writeln('7: Date of Birth');
 writeln;

 writeln('Please enter a number');
 readln(Choice);    {reads which number the user has chosen}
 delay(500);
 writeln('Please enter the new detail:');
 case choice of 1: read(PTitle); {reads the new patient title, overwriting the previous one}
                2: read(PatientFName); {reads the new patient first name, overwriting the previous one}
                3: read(PatientLName); {reads the new patient last name, overwriting the previous one}
                4: read(PatientAddress); {reads the new patient address, overwriting the previous one}
                5: read(PPostCode);      {reads the new patient post code, overwriting the previous one}
                6: read(PatientTelephone); {reads the new patient telephone, overwriting the previous one}
                7: read(PDOB);             {reads the new patient date of birth, overwriting the previous one}
 end;

 rewrite(PatientFile);        {This clears the patients file for rewriting}
 writeln(PatientFile, FileName);          {This writes the patients file name to their file}
 writeln(PatientFile, ID);                {This writes the patients ID to their file}
 writeln(PatientFile, PTitle);            {This writes the patients title to their file}
 writeln(PatientFile, PatientFName);      {This writes the patients first name to their file}
 writeln(PatientFile, PatientLName);      {This writes the patients last name to their file}
 writeln(PatientFile, PatientAddress);    {This writes the patients address to their file}
 writeln(PatientFile, PPostCode);         {This writes the patients post code to their file}
 writeln(PatientFile, PatientTelephone);  {This writes the patients telephone number to their file}
 writeln(PatientFile, PDOB);              {This writes the patients date of birth to their file}
 close(PatientFile);                      {Saves the file}
 writeln('File adjusted, would you like to edit another field?');
 writeln('1: Yes');
 writeln('2: No');
 readln(Choice);   {reads what option they chose}
 if choice = 1 then goto 1;
 writeln('Please press enter to return to main menu');
 delay(1500);
 3: {Allows for return to main menu if too many tries at file name made}
end;
Procedure RemovePatient;   { TODO : Prettify }
label 1; {allows the user to back out of removing a patient if they came here in error}
label 2; {Allows the user to enter another filename if they make a mistake}
begin
 writeln('This screen will allow you to delete a patients record');
 writeln('This is irreversible, are you sure you wish to continue?');
 writeln('1: Yes');
 writeln('2: No');
 readln(Choice);  {reads what option the user chose}
 if choice = 2 then goto 1;
 2: {Allows the user to enter another filename if they make a mistake}
 writeln('Please enter the filename to be removed');
 readln(FileName); {reads the name of the file to be removed}
 assign(PatientFile, 'Patients/'+Filename); {assigns the term PatientFile to the selected file}

 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 Erase(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 1;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('File successfully removed');
   end;
 assign(FilenameFile, 'FileFile.txt');
 FileList:= TStringList.Create;       {Creates a T String List under the name FileList}
 FileList.LoadFromFile('FileFile.txt');  {Loads all the filenames from the File name file into the T string list}
 Index:= FileList.IndexOf(FileName);     {Finds the index position of the filename been removed}
 FileList.Delete(Index);                 {deletes the filename been removed from the T string list}
 FileList.SaveToFile('FileFile.txt');    {Saves the modified T string list back to the File name file}
 FileList.free;                          {Deletes the T String List}
 1: {allows the user to exit the module if they dont want to remove a patient}
 writeln('Press enter to return to main menu');
end;
Procedure ViewPatient;   { TODO : Prettify }
label 2;    {returns to enter file name in case of error}
label 3;    {Exits module if too many tries made}
begin
 writeln('This screen will allow you to view a patients file');
 2: {allows program to return to enter filename in case of error}
 writeln('Please enter the file name you wish to view');
 readln(Filename);  {reads the name of the file to be displayed}
 assign(PatientFile, 'Patients/'+Filename); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}

 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('This is the current information for the patient:');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 readln(PatientFile, PatientAddress); {reads the patients address from the patients file}
 readln(PatientFile, PPostCode);      {reads the patients post code from the patients file}
 readln(PatientFile, PatientTelephone);{reads the patients telephone from the patients file}
 readln(PatientFile, PDOB);           {reads the patients date of birth from the patients file}
 writeln('File Name: ', FileName);    {writes the File Name to the console}
 writeln('ID: ',ID);                  {writes the ID to the console}
 writeln('Title: ', PTitle);          {Writes the title to the terminal}
 writeln('First Name: ', PatientFName); {writes the patients first name to the console}
 writeln('Last Name: ', PatientLName); {writes the patients last name to the console}
 writeln('Address: ', PatientAddress); {writes the patients address to the console}
 writeln('Post Code: ', PPostCode); {writes the patients post code to the console}
 writeln('Patient Telephone: ', PatientTelephone); {writes the patients telephone to the console}
 writeln('Patient Date of Birth: ', PDOB);        {writes the patients date of birth to the console}
 close(PatientFile);
 3: {Exits module if too many tries made}
end;

procedure PatientScreen;
begin
 clrscr;   {Clears the previous menu and displays the patient menu}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the patient screen                       | ');
 writeln(' |                                                                           | ');
 writeln(' |   These are your current options, please choose a number when prompted    | ');
 writeln(' |                                                                           | ');
 writeln(' |   1: Add new patient to the system                                        | ');
 writeln(' |   2: Edit a current patients details                                      | ');
 writeln(' |   3: Remove a patient from the system                                     | ');
 writeln(' |   4: View a patients details                                              | ');
 writeln(' |   5: List all patients                                                    | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');
 delay(500);
 gotoXY(6,13);
 write('Please select a number:');
 gotoXY(30,13);
 read(choice); {reads the choice from the cursor position which is after the please select a number}
 case choice of 1: AddPatient;
                2: EditPatient;
                3: RemovePatient;
                4: ViewPatient;
                5: ListPatients;
 end;
 readln;
end;
procedure AddDoctor;
label 1; {Allows the user to edit what they entered if they made a mistake}
begin
 ClrScr;
 readln; {This fixed the program skipping a readln}
 writeln('Welcome to the patient Module');
 assign(IDFile, 'IDFile.txt');
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);
 ID:= ID + 1;   {This makes the next used ID different to the last one to preemptively fix any problems with patients with the same name}
 rewrite(IDFile);  {This clears the ID file}
 writeln(IDFIle, ID);         {This adds one to the last used ID for adding future patients}
 close(IDFile);

 writeln('Please enter the doctor name in format: FName_LName-',ID);  {This instructs the user to enter the doctors name with their unique ID at the end}
 readln(Filename); {This reads the patients name to make a file in their name}

 assign(DoctorFile, 'Doctors/'+Filename); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}
 1: {this allows the user to re enter information if there was an error}
 rewrite(DoctorFile);      {This creates a new file in the name of the patient}
 writeln(DoctorFile, FileName); {This writes the Filename used to the patients file}
 writeln(DoctorFile, ID); {This writes the patients unique ID to their file}
 writeln('Please enter the Doctors title');
 readln(DTitle);
 writeln(DoctorFile, DTitle); {this writes the Doctors title to their file}
 writeln('Enter Doctor First Name please');
 readln(DoctorFName);    {This reads the Doctors name to save their details}
 writeln(DoctorFile, DoctorFName);    {This writes the doctors first name to their file}
 writeln('Please Enter Doctor Last Name');
 readln(DoctorLName);
 writeln(DoctorFile, DoctorLName);  {This writes the doctors last name to their file}
 close(DoctorFile);

 writeln('You have entered the following details');  {this writes what the user entered to the console to verify the details}
 reset(DoctorFile);   {Opens the Doctor file for reading}
 readln(DoctorFile, FileName); {reads the file name from the Doctors file}
 readln(DoctorFile, ID);       {reads the ID from the Doctors file}
 readln(DoctorFile, DTitle);         {reads the Doctors title from the Doctor file}
 readln(DoctorFile, DoctorFName);   {reads the Doctors details from the Doctor file}
 readln(DoctorFile, DoctorLName);   {reads the Doctors last name from the Doctor file}

 writeln('File Name: ', FileName);    {writes the File Name to the console}
 writeln('ID: ',ID);                  {writes the ID to the console}
 writeln('First Name: ', DoctorFName); {writes the Doctors first name to the console}
 writeln('Last Name: ', DoctorLName); {writes the Doctors last name to the console}
 close(DoctorFile);

 writeln('Is this information correct?');
 writeln('1.Yes');
 writeln('2.No');
 readln(choice);
 if choice = 1 then
    writeln('Ok, infomation saved') {simply displays a confirmation message and continues back to the main menu}
 else goto 1;   {returns to the top of the information enter area}
 writeln('Press enter to continue please');
end;
procedure EditDoctor;
label 1; {Allows the user to edit another field at the end}
label 2; {Stops the program crashing if the user enters an invalid file name}
label 3; {Allows return to main menu if too many attempts made at file name}
begin
 Counter:= 1; {Initialises the counter}
 ClrScr; {Gets rid of any previous menus}
 writeln('This screen allows you to edit a Doctors details');
 2:
 writeln('Please enter the Doctors filename');
 readln(Filename);
 1:
 ClrScr;

 assign(DoctorFile, 'Doctors/'+Filename); {This assigns the identifier DoctorFile to the Doctors file} {The plus sign makes it work, must join the strings or something}
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(DoctorFile);   {Opens the Doctor file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('This is the current information for the Doctor:');
   end;
 readln(DoctorFile, FileName); {reads the file name from the Doctors file}
 readln(DoctorFile, ID);       {reads the ID from the Doctors file}
 readln(DoctorFile, DTitle);         {reads the Doctors title from the Doctors file}
 readln(DoctorFile, DoctorFName);   {reads the Doctors details from the Doctor file}
 readln(DoctorFile, DoctorLName);   {reads the Doctors last name from the Doctors file}
 writeln('File Name: ', FileName);    {writes the File Name to the console}
 writeln('ID: ',ID);                  {writes the ID to the console}
 writeln('Title: ', PTitle);          {Writes the title to the terminal}
 writeln('First Name: ', DoctorFName); {writes the Doctors first name to the console}
 writeln('Last Name: ', DoctorLName); {writes the Doctors last name to the console}
 close(DoctorFile);
 delay(1000);
 writeln;

 writeln('Please choose a field to edit');
 writeln('1: Title');
 writeln('2: First Name');
 writeln('3: Last Name');
 writeln;

 writeln('Please enter a number');
 readln(Choice);    {reads which number the user has chosen}
 delay(500);
 writeln('Please enter the new detail:');
 case choice of 1: read(PTitle); {reads the new Doctor title, overwriting the previous one}
                2: read(DoctorFName); {reads the new Doctor first name, overwriting the previous one}
                3: read(DoctorLName); {reads the new Doctor last name, overwriting the previous one}

 end;

 rewrite(DoctorFile);        {This clears the Doctors file for rewriting}
 writeln(DoctorFile, FileName);          {This writes the Doctors file name to their file}
 writeln(DoctorFile, ID);                {This writes the Doctors ID to their file}
 writeln(DoctorFile, PTitle);            {This writes the Doctors title to their file}
 writeln(DoctorFile, DoctorFName);      {This writes the Doctors first name to their file}
 writeln(DoctorFile, DoctorLName);      {This writes the Doctors last name to their file}
 close(DoctorFile);                      {Saves the file}
 writeln('File adjusted, would you like to edit another field?');
 writeln('1: Yes');
 writeln('2: No');
 readln(Choice);   {reads what option they chose}
 if choice = 1 then goto 1;
 writeln('Please press enter to return to main menu');
 delay(1500);
 3: {Allows for return to main menu if too many tries at file name made}
end;

procedure GPScreen;
begin
  clrscr;   {Clears the previous menu and displays the patient menu}
  writeln('  --------------------------------------------------------------------------- ');
  writeln(' |                       Welcome to the Doctor  screen                       | ');
  writeln(' |                                                                           | ');
  writeln(' |   These are your current options, please choose a number when prompted    | ');
  writeln(' |                                                                           | ');
  writeln(' |   1: Add new Doctor  to the system                                        | ');
  writeln(' |   2: Edit a current Doctors details                                       | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln('  --------------------------------------------------------------------------- ');
  delay(500);
  gotoXY(6,13);
  write('Please select a number:');
  gotoXY(30,13);
  read(choice); {reads the choice from the cursor position which is after the please select a number}
  case choice of 1: AddDoctor;
                 2: EditDoctor;
  end;
  readln;

end;
procedure AddAppointment;
label 2; {allows the user to try again if an error is made}
label 3; {exits the procedure if too many errors are made}
label 4; //allows the user to try again if too many errors are made
begin
 ClrScr;
 writeln('This screen allows you to add an appointment');
 assign(AvApps, 'Appointments/AvApps.txt');
 writeln('These are the currently available appointments:');
 reset(AvApps);   //opens the list of times for reading
 while not EoF(AvApps) do {reads the list of available appointments from the file}
   begin
    if EoF(AvApps) then break;  {leaves the loop if end of the file}
    readln(AvApps, time);   {reads a time from the file}
    writeln(time);          {writes the time to the file}
   end;
 close(AvApps);
 readln;
 writeln;
 writeln('Please enter a time in format 0000xx, e.g 1030am or 0200pm');
 readln(time);    //reads what time the user wants to make an appointment for
 assign(appointment, time);
 rewrite(appointment);
 writeln('Please enter the filename of the patient to be added');
 2: {allows the user to enter another filename if an error is made}
 readln(Filename);  {reads the name of the file to be displayed}
 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}

 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('Please enter the filename for the GP with whom the appointment is');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 close(PatientFile);

 4: {allows the user to try again if an error is made}
 readln(DFilename);
 assign(DoctorFile, 'Doctors/'+DFilename); {This assigns the identifier DoctorFile to the Doctors file} {The plus sign makes it work, must join the strings or something}
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(DoctorFile);   {Opens the Doctor file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 4;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('These are the current appointment details:');
   end;
 readln(DoctorFile, DFileName); {reads the file name from the Doctors file}
 readln(DoctorFile, DID);       {reads the ID from the Doctors file}
 readln(DoctorFile, DTitle);         {reads the Doctors title from the Doctors file}
 readln(DoctorFile, DoctorFName);   {reads the Doctors details from the Doctor file}
 readln(DoctorFile, DoctorLName);   {reads the Doctors last name from the Doctors file}

 writeln('Patient Filename: ', Filename);    //This outputs all the patients relevant details to the console for confirmation
 writeln('Patient ID: ', ID);
 writeln('Patient Title: ', PTitle);
 writeln('Patient Name: ', PatientFName, ' ', PatientLName);
 writeln;
 writeln('Doctor Filename: ', DFileName);   //This outputs all the doctors relevants details to the console for confirmation
 writeln('Doctor ID: ', DID);
 writeln('Doctor Title: ', DTitle);
 writeln('Doctor Name: ', DoctorFName, ' ', DoctorLName);
 writeln;
 writeln('Is this correct?');
 writeln('1: Yes');
 writeln('2: No');
 readln(Choice);//Reads whether or not the information is correct
 if Choice = 2 then
    begin
      writeln('Returning to main menu');
      goto 3; //go's to the end of the procedure
    end;
 writeln('Saving to file');
 rewrite(Appointment);//This next section writes all the appointment details to the appropriate file
 writeln(Appointment, Filename);
 writeln(Appointment, ID);
 writeln(Appointment, PTitle);
 writeln(Appointment, PatientFName);
 writeln(Appointment, PatientLName);
 writeln(Appointment, ' ');
 writeln(Appointment, DFilename);
 writeln(Appointment, DID);
 writeln(Appointment, DTitle);
 writeln(Appointment, DoctorFName);
 writeln(Appointment, DoctorLName);
 close(Appointment);

 assign(AvApps, 'Appointments/AvApps.txt');
 AppList:= TStringList.Create;       {Creates a T String List under the name AppList}
 AppList.LoadFromFile('Appointments/AvApps.txt');  {Loads all the appointments from the appointment list file into the T string list}
 Index:= AppList.IndexOf(time);     {Finds the index position of the appointment been taken}
 AppList.Delete(Index);                 {deletes the filename been removed from the T string list}
 AppList.SaveToFile('Appointments/Avapps.txt');    {Saves the modified T string list back to the Appointment list file}
 AppList.free;                          {Deletes the T String List}
 3:{exits the procedure if a mistake is made too many times}
end;
procedure ViewAppointment;
begin
 writeln('This will alloy you to view the details of an appointment');
 writeln('Please enter the time for the appointment you wish to view in format 0000xx e.g 1230pm or 0400am');
 readln(time);    //reads what time the user wants to make an appointment for
 assign(appointment, time); //assigns
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(Appointment);//This next section reads all the appointment details
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('Here are the appointment details');
   end;

 readln(Appointment, Filename);          //reads the variables from the file
 readln(Appointment, ID);
 readln(Appointment, PTitle);
 readln(Appointment, PatientFName);
 readln(Appointment, PatientLName);
 readln(Appointment, ' ');
 readln(Appointment, DFilename);
 readln(Appointment, DID);
 readln(Appointment, DTitle);
 readln(Appointment, DoctorFName);
 readln(Appointment, DoctorLName);
 close(Appointment);

 writeln(Filename);      //writes the read variables to the terminal
 writeln(ID);
 writeln(PTitle);
 writeln(PatientFName);
 writeln(PatientLName);
 writeln(' ');
 writeln(DFilename);
 writeln(DID);
 writeln(DTitle);
 writeln(DoctorFName);
 writeln(DoctorLName);

end;

procedure ScheduleMenu;
begin
 clrscr;   {Clears the previous menu and displays the patient menu}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the Schedule screen                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   These are your current options, please choose a number when prompted    | ');
 writeln(' |                                                                           | ');
 writeln(' |   1: Add new appointment to the system                                    | ');
 writeln(' |   2: View an appointment                                                  | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');
 delay(500);
 gotoXY(6,13);
 write('Please select a number:');
 gotoXY(30,13);
 read(choice); {reads the choice from the cursor position which is after the please select a number}
 case choice of 1: AddAppointment;
                2: ViewAppointment;
 end;
 readln;

end;
procedure PrintDailyList;
begin

end;
Procedure AdminMenu;
label 1; {Skips back to admin menu}
begin
 ClrScr;
 goto 1;   {Skips the log in system while everything is been tested}
repeat {This is an authentication system}
       writeln('Welcome to the Admin Menu, please enter your credentials to continue');
       delay(50);
       writeln('Please enter your username');
       readln(AdminUsername);
       if AdminUsername = AUsername then   {This value is a constant and can be changed at the top of the program}
          begin
          repeat
          writeln('Please enter your password');
          readln(AdminPassword);
          until AdminPassword = APassword;  {This value is a constant and can be changed at the top of the program}
          break;{needed to stop invalid username appearing with correct password}
          end
       else;
         begin
           writeln('invalid username');
           clrscr
         end;
 until AdminPassword = 'Password'; {Makes sure the user cant proceed until correct password has been entered}
 writeln('Credentials recognised, welcome back');

 delay(500);
 1:
 clrscr;
 writeln('                        -------------------------------- '); {Admin Menu Splashscreen}
 writeln('                       |    Welcome to the Admin menu   |');
 writeln('                       |--------------------------------|');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                       |           Press Enter          |');
 writeln('                       |           To Continue          |');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                        -------------------------------- ');

 {This next set of lines replaces the text in the Admin menu with the options}
 gotoXY(26,5); {moves the cursor to the Admin menu box}
 write('1. Reset Patient ID File       |');
 delay(50); {Provides a small delay for visual effect}
 gotoXY(26,6);
 ClrEol; {This clear the Press Enter so that it can be replaced}
 writeln('2. Reset File Name File        |');
 delay(50);
 gotoXY(26,7);
 ClrEol;
 writeln('3. Initialise day              |');
 delay(50);
 gotoXY(26,8);
 ClrEol;
 writeln('4.                             |');
 delay(50);
 gotoXY(26,9);
 ClrEol;
 writeln('5. Exit to Main Menu           |');
 {This next segment of code contains the selection process}
 delay(1000);
 repeat {This works with the else}
 gotoXY(26,10);
 ClrEol;
 writeln('Please choose a number:        |');
 gotoXY(50,10); {moves the cursor to the right of the choose number line}

 read(Choice);
 case Choice of 1:        begin
                           repeat
                           writeln('warning this will reset the ID File and could result in patient files been overwritten');
                           delay(500);   {provides delays to make sure the user really want to reset the file}
                           writeln('This is unreversible');
                           delay(500);
                           writeln('Do you still wish to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice);
                           if Choice = 1 then {one been yes they want to continue}
                              begin
                              writeln('Proceeding with rewrite');  {Continues onto resetting the file}
                              end
                              else if Choice = 2 then break; {Escapes the case meaning the file is not rewritten} {nested if prevents return to main menu if invalid choice is made}
                           until Choice = 1;    {repeats until a valid choice is made}
                           assign(IDFile, 'IDFile.txt');  {makes sure the IDFile is assigned}
                           rewrite(IDFile);               {clears the IDFile}
                           writeln(IDFile, '1');          {resets the id to 1}
                           close(IDFile);                 {saves the new ID}
                           writeln('Successfully reset ID File');
                           break; {the breaks in this case are needed to exit the loop successfully}
                          end;

                        2:begin
                           repeat
                           writeln('This will clear the File Name file');
                           delay(500);    {again just makes the user pause a moment to consider whether they really want to do this}
                           writeln('This is irreversible');
                           delay(500);
                           writeln('This will result in the program been unable to display all patients made prior to the reset');
                           delay(500);
                           writeln('Are you sure you want to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice);
                           if Choice = 1 then {one been yes they want to continue}
                              begin
                              writeln('Proceeding with rewrite');  {Continues onto resetting the file}
                              end
                              else if Choice = 2 then break; {Escapes the case meaning the file is not rewritten} {nested if prevents return to main menu if invalid choice is made}
                           until Choice = 1;  {repeats until a valid choice is made}
                           assign(FilenameFile, 'FileFile.txt'); {Makes sure the FileNameFile is assigned}
                           rewrite(FilenameFile); {clears the File name file}
                           close(FilenameFile);   {saves the cleared file name file}
                           writeln('Successful rewrite, returning to main menu');
                           delay(1500);
                           break;                 {exits the case and loop}
                          end;

                        3:begin
                           writeln('This will get the program ready for the day and will delete all of yesterdays appointments');
                           writeln('Are you sure you want to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice); {Reads what choice the user makes}
                           if Choice = 2 then break;
                           assign(AvApps, 'Appointments/AvApps.txt');
                           rewrite(AvApps); {This next bit rewrites the available appointments list to display the complete list of available appointments}
                           writeln(AvApps, '0900am');
                           writeln(AvApps, '0930am');
                           writeln(AvApps, '1000am');
                           writeln(AvApps, '1030am');
                           writeln(AvApps, '1100am');
                           writeln(AvApps, '1130am');
                           writeln(AvApps, '1200pm');
                           writeln(AvApps, '1230pm');
                           writeln(AvApps, '0100pm');
                           writeln(AvApps, '0130pm');
                           writeln(AvApps, '0200pm');
                           writeln(AvApps, '0230pm');
                           writeln(AvApps, '0300pm');
                           writeln(AvApps, '0330pm');
                           writeln(AvApps, '0400pm');
                           writeln(AvApps, '0430pm');
                           writeln(AvApps, '0500pm');
                           writeln(AvApps, '0530pm');
                           writeln(AvApps, '0600pm');
                           writeln(AvApps, '0630pm');
                           close(AvApps);

                           assign(Appointment, 'Appointments/0900am');   {This next bit creates blank text files for every appointment}
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0930am');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1000am');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1030am');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1100am');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1130am');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1200pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1230pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0100pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0130pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0200pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0230pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0300pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0330pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0400pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0430pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0500pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0530pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0600pm');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0630pm');
                           rewrite(Appointment);
                           close(Appointment);
                           writeln('Finished, returning to menu');
                           delay(1500);
                           break;
                          end;
                        4:begin

                           break;
                          end;
                        5: break; {Breaks out of the procedure and loop}
                        else {This else accounts for a wrong choice by displaying a message and then resetting the line}
                          begin
                            gotoXY(26,10);
                            ClrEol;
                            write('Invalid choice, try again      |');
                            delay(1000);
                            goto 1;
                          end;
                          end;
 until Choice = 1 or 2 or 3 or 4 or 5;  {allows the loop to exit}
 end;

procedure MainMenu;  {this is the main menu procedure}
label 2;  {Used to allow other procedures to return to the main menu}
begin
 repeat
  2: {Point of return to the main menu}
  ClrScr;
  writeln('                        -------------------------------- '); {Main Menu Splashscreen}
  writeln('                       |    Welcome to the main menu    |');
  writeln('                       |--------------------------------|');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |           Press Enter          |');
  writeln('                       |           To Continue          |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                        -------------------------------- ');
  readln;
  {This next set of lines replaces the text in the main menu with the options}
  gotoXY(26,5); {moves the cursor to the main menu box}
  write('1. Patient Screen              |');
  delay(50); {Provides a small delay for visual effect}
  gotoXY(26,6);
  ClrEol; {This clear the Press Enter so that it can be replaced}
  writeln('2. GP Screen                   |');
  delay(50);
  gotoXY(26,7);
  ClrEol;
  writeln('3. Schedule Appointment        |');
  delay(50);
  gotoXY(26,8);
  ClrEol;
  writeln('4. Print Daily Appointment List|');
  delay(50);
  gotoXY(26,9);
  ClrEol;
  writeln('5. Exit the program            |');
  delay(50);
  gotoXY(26,10);
  ClrEol;
  writeln('6. Admin Menu                  |');
  {This next segment of code contains the selection process}
  delay(1000);
  repeat {This works with the else}
  gotoXY(26,11);
  ClrEol;
  writeln('Please choose a number:        |');
  gotoXY(50,11); {moves the cursor to the right of the choose number line}
  read(Choice);
  case Choice of 1:begin
                            PatientScreen;
                            {break; {the breaks in this case are needed to exit the loop successfully}}
                           end;
                         2:begin
                            GPScreen;
                            break;
                           end;
                         3:begin
                            ScheduleMenu;
                            break;
                           end;
                         4:begin
                            PrintDailyList;
                            break;
                           end;
                         5: break; {Breaks out of the procedure and loop}
                         6: AdminMenu;
                         else {This else accounts for a wrong choice by displaying a message and then resetting the line}
                           begin
                             gotoXY(26,10);
                             ClrEol;
                             write('Invalid choice, try again      |');
                             delay(1000);
                           end;

                         end;
  goto 2; {This allows procedures to return to the main menu without funky formatting errors}
  until Choice = 1 or 2 or 3 or 4 or 5;  {allows the loop to exit}
  until Choice = 5; {Allows other procedure to return to the main menu}
end; {end for main menu procedure}


begin
  highvideo;
  {Addpatient;}
  {patientscreen;}     {These procedure calls are here for quick skip to the parts been tested, are commented out when not in use}
  {AdminMenu;}
  writeln('  --------------------------------------------------------------------------- ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |=============================                 =============================| ');
  writeln(' |                               W E L C O M E                               | ');
  writeln(' |                                                                           | ');
  writeln(' |                                   SHAW                                    | ');
  writeln(' |                                  MEDICAL                                  | ');
  writeln(' |                                  SURGERY                                  | ');
  writeln(' |                                                                           | ');
  writeln(' |=============================                 =============================| ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |     PRESS     |                             | ');
  writeln(' |                             |     ENTER     |                             | ');
  writeln('  --------------------------------------------------------------------------- ');
  {The splash screen}
  readln;
  ClrScr; {gets rid of the splash screen}
  highvideo; {Brightens the text}
  1:
  MainMenu;
  ClrScrr;
  writeln;
  readln;
end.
